#include <stdio.h>
#include <iostream>
#include <string>
#include <stdlib.h>
#include <unistd.h>

#include <QThread>
#include <QObject>
#include <QDebug>
#include <QQuickWindow>

#include "control_midi.h"
#include "backend.h"
#include "defs.h"

#define BLUEPRINT_USB_DATA_PACKET_SIZE 64
#define BLUEPRINT_USB_HID_PACKET_SIZE (BLUEPRINT_USB_DATA_PACKET_SIZE + 1)

#define BLUEPRINT_ENDPOINT_IN (2 | LIBUSB_ENDPOINT_IN)
#define BLUEPRINT_ENDPOINT_OUT (2 | LIBUSB_ENDPOINT_OUT)

BackEnd::BackEnd(QObject *parent) :
        QObject(parent)
{
        firstConfiguration = true;          //  Bool variable used only to known if the tinami is conected for the first time

        setDeviceStatus(Unplugged);       //  Select Variable. Values: "unplugged"; "connected"; "wrongData"; "okData"; "working"
        setComponentMinValue(0);
        setComponentMaxValue(127);

        memset(&configuration, 0, sizeof (configuration));

        this->timer = new QTimer(this);
        connect(timer, &QTimer::timeout, this, &BackEnd::timer_timeout);
        this->timer->start(50);
}

BackEnd::~BackEnd()
{
        this->timer->stop();

        if(m_deviceStatus != Unplugged){
                hid_close(tinami_dev);

                qDebug() << "Released Interface\n";
        }
}

void BackEnd::timer_timeout(){  //ENHANCE: Use HotPlug events
        switch (m_deviceStatus) {
        case Unplugged:
                senseDeviceStatus();
                break;
        case Ready_for_config:
                readDeviceConfiguration();
                break;
        case Ready_for_update:
                break;
        case Ok_data:
                setLayout();
                break;
        case Working:
                senseValue();
                break;
        case Wrong_data:
                readDeviceConfiguration();
                break;
        }
}

void BackEnd::setDeviceStatus(const DeviceStatus &deviceStatus){

        if (deviceStatus == m_deviceStatus)
                return;

        m_deviceStatus = deviceStatus;

        emit deviceStatusChanged();
        return;
}

void BackEnd::pollUSB(uint16_t deviceVIDtoPoll, uint16_t devicePIDtoPoll)
{
        hid_device_info *dev;

        dev = hid_enumerate(deviceVIDtoPoll, devicePIDtoPoll);

        connected = (dev != nullptr);
        hid_free_enumeration(dev);
}

BackEnd::ErrorCode BackEnd::open(uint16_t deviceVIDtoOpen, uint16_t devicePIDtoOpen)
{
        tinami_dev = hid_open(deviceVIDtoOpen, devicePIDtoOpen, nullptr);
        if(tinami_dev)
        {
                connected = true;
                hid_set_nonblocking(tinami_dev, true);
                qWarning("Device successfully connected to.");
                return Success;
        }

        qWarning("Unable to open device.");
        return NotConnected;
}

void BackEnd::setPreset(const unsigned char &preset){
        if (preset == m_preset)
                return;
        m_preset = preset;
        emit presetChanged();
        selectComponent(m_component);
        qDebug() << preset;
}

void BackEnd::setComponentMode(const ComponentMode &deviceMode){
        int index = BLUEPRINT_PRESET_DATA_SIZE * m_preset + BLUEPRINT_CONTROL_DATA_SIZE * m_component;

        qDebug() << index << m_preset << m_component << deviceMode;

        if (deviceMode == m_componentMode)
                return;

        configuration.preset[m_preset].component[m_component].bytes.mode = static_cast<unsigned char>(deviceMode);

        m_componentMode = deviceMode;

        emit componentModeChanged();
        return;
}

void BackEnd::setComponentChannel(const unsigned char &controlChannel){
        unsigned char channel = 0xFF;

        if(controlChannel == m_componentChannel)
                return;

        if ((controlChannel >= 1) && (controlChannel <= 16)){
                channel = controlChannel - 1;
                m_componentChannel = controlChannel;
        }

        configuration.preset[m_preset].component[m_component].bytes.channel = channel;

        if (channel == 0xFF)
                m_componentChannel = 0;

        emit componentChannelChanged();
        return;
}

void BackEnd::setComponentData(const unsigned char &controlData){
        if(controlData == m_componentData)
                return;

        configuration.preset[m_preset].component[m_component].bytes.data = controlData;
        m_componentData = controlData;

        emit componentDataChanged();
        return;
}

void BackEnd::setComponentMinValue(const unsigned char &minValue){
        if (minValue == m_componentMinValue)
                return;

        configuration.preset[m_preset].component[m_component].bytes.min = minValue;
        m_componentMinValue = minValue;

        emit componentMinValueChanged();
        return;
}

void BackEnd::setComponentMaxValue(const unsigned char &maxValue){
        if (maxValue == m_componentMaxValue)
                return;

        configuration.preset[m_preset].component[m_component].bytes.max = maxValue;
        m_componentMaxValue = maxValue;

        emit componentMaxValueChanged();
        return;
}

void BackEnd::setComponentButtonBehaviour(const ComponentButtonBehaviour &controlButtonBehaviour){
        int index = BLUEPRINT_CONTROL_DATA_SIZE + m_component;

        if (controlButtonBehaviour == m_componentButtonBehaviour)
                return;

        switch (controlButtonBehaviour) {
        case None:
                break;
        case Momentary:
                layout[index] = Momentary;
                break;
        case Toggle:
                layout[index] = Toggle;
                break;
        }

        m_componentButtonBehaviour = controlButtonBehaviour;
        emit componentButtonBehaviourChanged();
        return;
}

void BackEnd::selectComponent(const unsigned char &component){
        unsigned char type;
        unsigned char mode;
        unsigned char channel;
        unsigned char data;
        unsigned char minValue;
        unsigned char maxValue;

        m_component = component;
        emit componentChanged();

        type = layout[BLUEPRINT_CONTROL_TYPE_INDEX + m_component];
        mode = configuration.preset[m_preset].component[m_component].bytes.mode;
        channel = configuration.preset[m_preset].component[m_component].bytes.channel;
        data = configuration.preset[m_preset].component[m_component].bytes.data;
        minValue = configuration.preset[m_preset].component[m_component].bytes.min;
        maxValue = configuration.preset[m_preset].component[m_component].bytes.max;

        setComponentChannel(channel);
        setComponentData(data);
        setComponentMinValue(minValue);
        setComponentMaxValue(maxValue);

        setComponentMode(static_cast<ComponentMode>(mode));
        setComponentButtonBehaviour(static_cast<ComponentButtonBehaviour>(type));

        return;
}

void BackEnd::senseDeviceStatus(){

        this->timer->stop();
        setDeviceStatus(Unplugged);

        pollUSB(0x04D8, 0x0053);
        if(connected)
        {
                qWarning("Attempting to open device...");
                open(0x04D8, 0x0053);
                setDeviceStatus(Ready_for_config);
        }

        pollUSB(0x04D8, 0x003C);
        if(connected)
        {
                qWarning("Attempting to open device to bootload...");
                open(0x04D8, 0x003C);
                setDeviceStatus(Ready_for_update);
        }

        this->timer->start(50);
        return;
}

void BackEnd::setControl0Type(const unsigned char &controlType){
        if (controlType == m_controlType[0])
                return;
        m_controlType[0] = controlType;
        emit control0TypeChanged();
        return;
}

void BackEnd::setControl1Type(const unsigned char &controlType){
        if (controlType == m_controlType[1])
                return;
        m_controlType[1] = controlType;
        emit control1TypeChanged();
        return;
}

void BackEnd::setControl2Type(const unsigned char &controlType){
        if (controlType == m_controlType[2])
                return;
        m_controlType[2] = controlType;
        emit control2TypeChanged();
        return;
}

void BackEnd::setControl3Type(const unsigned char &controlType){
        if (controlType == m_controlType[3])
                return;
        m_controlType[3] = controlType;
        emit control3TypeChanged();
        return;
}

void BackEnd::setControl4Type(const unsigned char &controlType){
        if (controlType == m_controlType[4])
                return;
        m_controlType[4] = controlType;
        emit control4TypeChanged();
        return;
}

void BackEnd::setControl5Type(const unsigned char &controlType){
        if (controlType == m_controlType[5])
                return;
        m_controlType[5] = controlType;
        emit control5TypeChanged();
        return;
}

void BackEnd::setControl6Type(const unsigned char &controlType){
        if (controlType == m_controlType[6])
                return;
        m_controlType[6] = controlType;
        emit control6TypeChanged();
        return;
}

void BackEnd::setControl7Type(const unsigned char &controlType){
        if (controlType == m_controlType[7])
                return;
        m_controlType[7] = controlType;
        emit control7TypeChanged();
        return;
}

void BackEnd::setControl8Type(const unsigned char &controlType){
        if (controlType == m_controlType[8])
                return;
        m_controlType[8] = controlType;
        emit control8TypeChanged();
        return;
}

void BackEnd::setControl9Type(const unsigned char &controlType){
        if (controlType == m_controlType[9])
                return;
        m_controlType[9] = controlType;
        emit control9TypeChanged();
        return;
}


void BackEnd::setControl10Type(const unsigned char &controlType){
        if (controlType == m_controlType[10])
                return;
        m_controlType[10] = controlType;
        emit control10TypeChanged();
        return;
}


void BackEnd::setControl11Type(const unsigned char &controlType){
        if (controlType == m_controlType[11])
                return;
        m_controlType[11] = controlType;
        emit control11TypeChanged();
        return;
}


void BackEnd::setControl12Type(const unsigned char &controlType){
        if (controlType == m_controlType[12])
                return;
        m_controlType[12] = controlType;
        emit control12TypeChanged();
        return;
}


void BackEnd::setControl13Type(const unsigned char &controlType){
        if (controlType == m_controlType[13])
                return;
        m_controlType[13] = controlType;
        emit control13TypeChanged();
        return;
}


void BackEnd::setControl14Type(const unsigned char &controlType){
        if (controlType == m_controlType[14])
                return;
        m_controlType[14] = controlType;
        emit control14TypeChanged();
        return;
}

void BackEnd::setControl15Type(const unsigned char &controlType){
        if (controlType == m_controlType[15])
                return;
        m_controlType[15] = controlType;
        emit control15TypeChanged();
        return;
}

void BackEnd::readDeviceConfiguration(){
        int offset;

        /*******************************************************************************
        *
        *   HOST REQUEST READING
        *
        *    ___________________________ ___________________________ ___________________________ ___________________________
        *   |           SOF             |   HOST_REQUIRES_READING   |           CMD             |   HOST_REQUIRES_READING   |
        *    --------------------------- --------------------------- --------------------------- ---------------------------
        *
        *   HOST REQUEST READING
        *
        *    ___________________________ ___________________________ ___________________________ ___________________________
        *   |           SOF             |   HOST_REQUIRES_READING   |           CMD             |   HOST_REQUIRES_READING   |
        *    --------------------------- --------------------------- --------------------------- ---------------------------
        *
        *   HOST REQUEST READING
        *
        *    ___________________________ ___________________________ ___________________________ ___________________________
        *   |           SOF             |   HOST_REQUIRES_READING   |           CMD             |   HOST_REQUIRES_READING   |
        *    --------------------------- --------------------------- --------------------------- ---------------------------
        */

        qDebug() << "\nReading device configuration\n";

        this->timer->stop();

        unsigned char data_out[BLUEPRINT_USB_HID_PACKET_SIZE]; //data to write
        unsigned char data_in[BLUEPRINT_USB_HID_PACKET_SIZE]; //data to read

        int res;

        memset(data_out,0,BLUEPRINT_USB_HID_PACKET_SIZE);
        memset(data_in,0,BLUEPRINT_USB_HID_PACKET_SIZE);
        memset(layout, 0, sizeof (layout));

        data_out[0]=0;
        data_out[1]=SOF;
        data_out[2]=HOST_REQUIRES_READING;
        data_out[3]=CMD_LAYOUT;
        data_out[4]=0;

        res = hid_write(tinami_dev,data_out,BLUEPRINT_USB_HID_PACKET_SIZE);

        res = hid_read_timeout(tinami_dev, data_in, BLUEPRINT_USB_HID_PACKET_SIZE, 1000);

        if (res < 0){
                qDebug() << " write error";
                setDeviceStatus(Unplugged);
                this->timer->start(50);
                return;
        }

        qDebug() << "Read request send";

        while ((data_in[0] != SOF) && (data_in[1] != OK) && (data_in[2] != CMD_LAYOUT)){
                qDebug() << "####";
                res = hid_read_timeout(tinami_dev, data_in, BLUEPRINT_USB_HID_PACKET_SIZE, 1000);

                if (res < 0){
                        setDeviceStatus(Unplugged);
                        qDebug() << "read error";
                        this->timer->start(50);
                        return;
                }
        }

        qDebug() << "Ok\n\nReading Data";

        int j = 0;

        while(data_in[1] != FINISH){

                res = hid_read_timeout(tinami_dev, data_in, BLUEPRINT_USB_HID_PACKET_SIZE, 1000);

                if (res < 0){
                        qDebug() << " write error";
                        setDeviceStatus(Unplugged);
                        this->timer->start(50);
                        return;
                }

                if(data_in[1] == FINISH)
                        break;

                offset = j * BLUEPRINT_USB_DATA_PACKET_SIZE;

                for (int i = 0; i < BLUEPRINT_USB_DATA_PACKET_SIZE; i++) {
                        layout[offset + i] = data_in[i];
                        qDebug() << offset + i << layout[offset + i];
                }

                j = j+1;
        }

        setDeviceStatus(Ok_data);

        qDebug() << "Done";
        this->timer->start(50);

        return;
}

void BackEnd::setLayout(){

        this->timer->stop();

        setControl0Type(layout[0]); qDebug() << "#";
        setControl1Type(layout[1]); qDebug() << "#";
        setControl2Type(layout[2]); qDebug() << "#";
        setControl3Type(layout[3]); qDebug() << "#";
        setControl4Type(layout[4]); qDebug() << "#";
        setControl5Type(layout[5]); qDebug() << "#";
        setControl6Type(layout[6]); qDebug() << "#";
        setControl7Type(layout[7]); qDebug() << "#";
        setControl8Type(layout[8]); qDebug() << "#";
        setControl9Type(layout[9]); qDebug() << "#";
        setControl10Type(layout[10]); qDebug() << "#";
        setControl11Type(layout[11]); qDebug() << "#";
        setControl12Type(layout[12]); qDebug() << "#";
        setControl13Type(layout[13]); qDebug() << "#";
        setControl14Type(layout[14]); qDebug() << "#";
        setControl15Type(layout[15]); qDebug() << "#";

        if(firstConfiguration){
                firstConfiguration = false;
                sleep(1);
        }
        setPreset(0);
        readPreset(0);
        selectComponent(0);

        setDeviceStatus(Working);
        qDebug() << "Done\n";
        this->timer->start(50);
        return;
}

void BackEnd::readPreset(const unsigned char &preset){
        unsigned char data_out[BLUEPRINT_USB_HID_PACKET_SIZE]; //data to write
        unsigned char data_in[BLUEPRINT_USB_HID_PACKET_SIZE]; //data to read

        int res;

        memset(data_out,0,BLUEPRINT_USB_HID_PACKET_SIZE);
        memset(data_in,0,BLUEPRINT_USB_HID_PACKET_SIZE);

        data_out[0]=0;
        data_out[1]=SOF;
        data_out[2]=HOST_REQUIRES_READING;
        data_out[3]=CMD_PRESET;
        data_out[4]=0;

        res = hid_write(tinami_dev,data_out,BLUEPRINT_USB_HID_PACKET_SIZE);

        res = hid_read_timeout(tinami_dev, data_in, BLUEPRINT_USB_HID_PACKET_SIZE, 1000);

        if (res < 0){
                qDebug() << "read error";
                setDeviceStatus(Unplugged);
                this->timer->start(50);
                return;
        }

        qDebug() << "Read Preset request send";

        while ((data_in[0] != SOF) && (data_in[1] != OK) && (data_in[2] != CMD_PRESET)){
                qDebug() << "####";
                res = hid_read_timeout(tinami_dev, data_in, BLUEPRINT_USB_HID_PACKET_SIZE, 1000);
                if (res < 0){
                        setDeviceStatus(Unplugged);
                        qDebug() << "read error";
                        this->timer->start(50);
                        return;
                }
                for (int i = 0; i < 64; ++i) {
                        qDebug() << data_in[i];
                }
        }

        qDebug() << "Ok\n\nReading Data";

        int k = 0;

        while(data_in[1] != FINISH){
                res = hid_read_timeout(tinami_dev, data_in, BLUEPRINT_USB_HID_PACKET_SIZE, 1000);

                if (res < 0){
                        setDeviceStatus(Unplugged);
                        qDebug() << "read error";
                        this->timer->start(50);
                        return;
                }

                if(data_in[1] == FINISH)
                        break;

                for (int i = 0; i < BLUEPRINT_USB_DATA_PACKET_SIZE; i++) {
                        configuration.preset[preset].packet[k].data[i] = data_in[i];
                }

                k = k + 1;

        }

        setDeviceStatus(Ok_data);
}

void BackEnd::senseValue(){
        this->timer->stop();

        unsigned char data_in[BLUEPRINT_USB_HID_PACKET_SIZE];

        int res;

        res = hid_read_timeout(tinami_dev, data_in, BLUEPRINT_USB_HID_PACKET_SIZE, 1000);

        if (res < 0) {
                setDeviceStatus(Unplugged);
                qDebug() << "error\n";
                this->timer->start(50);
                return;
        }
}

void BackEnd::syncHost2Device(){
        int offset;

        this->timer->stop();

        qDebug() << "\nSync\n";

        //        setDeviceStatus("sending data");

        unsigned char data_out[BLUEPRINT_USB_HID_PACKET_SIZE]; //data to write
        unsigned char data_in[BLUEPRINT_USB_HID_PACKET_SIZE]; //data to read

        int res;

        memset(data_out,0,BLUEPRINT_USB_HID_PACKET_SIZE);
        memset(data_in,0,BLUEPRINT_USB_HID_PACKET_SIZE);

        data_out[0]=0;
        data_out[1]=SOF;
        data_out[2]=HOST_REQUIRES_WRITING;
        data_out[3]=CMD_LAYOUT;
        data_out[4]=0;

        res = hid_write(tinami_dev,data_out,BLUEPRINT_USB_HID_PACKET_SIZE);

        res = hid_read_timeout(tinami_dev, data_in, BLUEPRINT_USB_HID_PACKET_SIZE, 1000);

        if (res < 0){
                qDebug() << " write error";
                setDeviceStatus(Unplugged);
                this->timer->start(50);
                return;
        }

        qDebug() << "Read request send";

        while ((int(data_in[1])!=OK) ){
                res = hid_read_timeout(tinami_dev, data_in, BLUEPRINT_USB_HID_PACKET_SIZE, 1000);
                if (res < 0){
                        setDeviceStatus(Unplugged);
                        qDebug() << " read error";
                        this->timer->start(50);
                        return;
                }
                for (int i = 0; i < BLUEPRINT_USB_DATA_PACKET_SIZE; i++) {
                        qDebug() << data_in[i + 1];
                }
        }

        qDebug() << "\nOk\n\nWritting Data\nLayout";
        for (unsigned char j = 0; j<2; j++) {
                offset = BLUEPRINT_USB_DATA_PACKET_SIZE * j;

                data_out[0] = 0;
                for (unsigned char k = 0; k < BLUEPRINT_USB_DATA_PACKET_SIZE; k++){
                        data_out[k + 1] = layout[offset + k];
                }

                if(j == 1)
                        data_out[BLUEPRINT_USB_DATA_PACKET_SIZE] = 0xAA;

                res = hid_write(tinami_dev,data_out,BLUEPRINT_USB_HID_PACKET_SIZE);

                if (res < 0){
                        qDebug() << " write error";
                        setDeviceStatus(Unplugged);
                        this->timer->start(50);
                        return;
                }

                QThread::msleep(100);
        }

        data_out[0]=0;
        data_out[1]=SOF;
        data_out[2]=FINISH;
        data_out[3]=CMD_LAYOUT;
        data_out[4]=FINISH;

        res = hid_write(tinami_dev,data_out,BLUEPRINT_USB_HID_PACKET_SIZE);

        if (res < 0){
                qDebug() << " write error";
                setDeviceStatus(Unplugged);
                this->timer->start(50);
                return;
        }

        QThread::msleep(500);

        data_out[0]=0;
        data_out[1]=SOF;
        data_out[2]=HOST_REQUIRES_WRITING;
        data_out[3]=CMD_CHANGES;
        data_out[4]=m_preset;

        res = hid_write(tinami_dev,data_out,BLUEPRINT_USB_HID_PACKET_SIZE);

        if (res < 0){
                qDebug() << " write error";
                setDeviceStatus(Unplugged);
                this->timer->start(50);
                return;
        }

        qDebug() << "\nWrite Preset Request Send\n";

        QThread::msleep(500);

        while ((int(data_in[1])!=OK) ){
                res = hid_read_timeout(tinami_dev, data_in, BLUEPRINT_USB_HID_PACKET_SIZE, 1000);
                if (res < 0){
                        setDeviceStatus(Unplugged);
                        qDebug() << " read error";
                        this->timer->start(50);
                        return;
                }
        }

        qDebug() << "Sending preset" << m_preset;

        for (int k =0; k < 4; k++){
                offset = BLUEPRINT_PRESET_DATA_SIZE * m_preset + BLUEPRINT_USB_DATA_PACKET_SIZE * k;

                data_out[0] = 0;
                for(int j = 0; j < BLUEPRINT_USB_DATA_PACKET_SIZE; j++){
                        data_out[j + 1] = configuration.preset[m_preset].packet[k].data[j];
                        qDebug() << offset + j;
                }

                res = hid_write(tinami_dev,data_out,BLUEPRINT_USB_HID_PACKET_SIZE);

                if(res < 0){
                        setDeviceStatus(Unplugged);
                        qDebug() << " read error";
                        this->timer->start(50);
                        return;
                }

                QThread::msleep(100);
                qDebug() << ".";
        }

        data_out[0]=0;
        data_out[1]=SOF;
        data_out[2]=FINISH;
        data_out[3]=CMD_CHANGES;
        data_out[4]=m_preset;

        res = hid_write(tinami_dev,data_out,BLUEPRINT_USB_HID_PACKET_SIZE);

        if (res < 0){
                qDebug() << " write error";
                setDeviceStatus(Unplugged);
                this->timer->start(50);
                return;
        }

        qDebug() << "Done\n";

        setDeviceStatus(Working);

        this->timer->start(50);
        return;
}
