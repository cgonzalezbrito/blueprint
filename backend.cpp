#include <stdio.h>
#include <iostream>
#include <libusb.h>
#include <string>
#include <stdlib.h>
#include <unistd.h>
//#include <libudev.h>

#include "backend.h"
#include "defs.h"

#include <QThread>
#include <QObject>
#include <QDebug>
#include <QQuickWindow>

static libusb_device **devs;
static libusb_device_handle *dev_handle;
static libusb_context *ctx = NULL;

BackEnd::BackEnd(QObject *parent) :
    QObject(parent)
{
    firstConfiguration = true;          //  Bool variable used only to known if the tinami is conected for the first time

    setDeviceStatus("unplugged");       //  Select Variable. Values: "unplugged"; "connected"; "wrongData"; "okData"; "working"
    setMinValue(0);
    setMaxValue(127);

    this->timer = new QTimer(this);
    connect(timer, &QTimer::timeout, this, &BackEnd::timer_timeout);
    this->timer->start(50);
}

BackEnd::~BackEnd()
{
    this->timer->stop();

    if(m_deviceStatus != "unplugged"){

        int r;

        r = libusb_release_interface(dev_handle, 1); //release the claimed interface

        if(r != 0){
            printf("Cannot release Interface\n");
            return;
        }

        printf("Released Interface\n");

        libusb_close(dev_handle);
        libusb_exit(ctx); //close the session
    }
}

void BackEnd::timer_timeout(){  //ENHANCE: Use HotPlug events

    if(m_deviceStatus == "unplugged")
        senseDeviceStatus();
    else if (m_deviceStatus == "connected")
        readDeviceConfiguration();
    else if (m_deviceStatus == "wrongData")
        readDeviceConfiguration();
    else if (m_deviceStatus == "okData")
        setInterface();
    else if (m_deviceStatus == "working")
        senseValue();
    return;
}

void BackEnd::setDeviceStatus(const QString &deviceStatus){

    if (deviceStatus == m_deviceStatus)
        return;
    m_deviceStatus = deviceStatus;
    emit deviceStatusChanged();
    return;
}

QString BackEnd::deviceStatus(){
    return m_deviceStatus;
}

void BackEnd::setDeviceMode(const QString &deviceMode){

    if (deviceMode == m_deviceMode)
        return;

    if (deviceMode == "Voice Note")
        interfaceConfig[32 + 5*m_component] = voiceNote;
    if (deviceMode == "PP")
        interfaceConfig[32 + 5*m_component] = voicePolyPressure;
    if (deviceMode == "CC")
        interfaceConfig[32 + 5*m_component] = voiceControlChange;
    if (deviceMode == "PC")
        interfaceConfig[32 + 5*m_component] = voiceProgramChange;
    if (deviceMode == "CP")
        interfaceConfig[32 + 5*m_component] = voiceChannelPreassure;
    if (deviceMode == "PB")
        interfaceConfig[32 + 5*m_component] = voicePitchBend;

    m_deviceMode = deviceMode;
    emit deviceModeChanged();
    return;
}

QString BackEnd::deviceMode(){
    return m_deviceMode;
}

void BackEnd::setCcNumber(const unsigned char &ccNumber){
    if(ccNumber == m_ccNumber)
        return;
    interfaceConfig[34 + 5*m_component] = ccNumber;
    m_ccNumber = ccNumber;
    emit ccNumberChanged();
    return;
}

unsigned char BackEnd::ccNumber(){
    return m_ccNumber;
}


void BackEnd::setMinValue(const unsigned char &minValue){

    if (minValue == m_minValue)
        return;
    interfaceConfig[35 +5*m_component] = minValue;
    m_minValue = minValue;
    emit minValueChanged();
    return;
}

unsigned char BackEnd::minValue(){
    return m_minValue;
}

void BackEnd::setMaxValue(const unsigned char &maxValue){

    if (maxValue == m_maxValue)
        return;
    interfaceConfig[36 +5*m_component] = maxValue;
    m_maxValue = maxValue;
    emit maxValueChanged();
    return;
}

unsigned char BackEnd::maxValue(){
    return m_maxValue;
}

void BackEnd::selectComponent(const unsigned char &component){
    if (component == m_component)
        return;
    m_component = component;
    emit componentChanged();

    if(interfaceConfig[32 + 5*component]==voiceControlChange)
        setDeviceMode("CC");
    else if (interfaceConfig[32 + 5*component]==voiceNote)
        setDeviceMode("Voice Note");
    else
        setDeviceMode("Not Implemented");

    setCcNumber(int (interfaceConfig[34 + 5*component]));

    setMinValue(int (interfaceConfig[35 + 5*component]));
    setMaxValue(int (interfaceConfig[36 + 5*component]));

    return;
}

unsigned char BackEnd::component(){
    return m_component;
}

void BackEnd::setControl0Type(const unsigned char &controlType){
    if (controlType == m_controlType[0])
        return;
    m_controlType[0] = controlType;
    emit control0TypeChanged();
    return;
}

unsigned char BackEnd::control0Type(){
    return m_controlType[0];
}

void BackEnd::setControl1Type(const unsigned char &controlType){
    if (controlType == m_controlType[1])
        return;
    m_controlType[1] = controlType;
    emit control1TypeChanged();
    return;
}

unsigned char BackEnd::control1Type(){
    return m_controlType[1];
}

void BackEnd::setControl2Type(const unsigned char &controlType){
    if (controlType == m_controlType[2])
        return;
    m_controlType[2] = controlType;
    emit control2TypeChanged();
    return;
}

unsigned char BackEnd::control2Type(){
    return m_controlType[2];
}

void BackEnd::setControl3Type(const unsigned char &controlType){
    if (controlType == m_controlType[3])
        return;
    m_controlType[3] = controlType;
    emit control3TypeChanged();
    return;
}

unsigned char BackEnd::control3Type(){
    return m_controlType[3];
}

void BackEnd::setControl4Type(const unsigned char &controlType){
    if (controlType == m_controlType[4])
        return;
    m_controlType[4] = controlType;
    emit control4TypeChanged();
    return;
}

unsigned char BackEnd::control4Type(){
    return m_controlType[4];
}

void BackEnd::setControl5Type(const unsigned char &controlType){
    if (controlType == m_controlType[5])
        return;
    m_controlType[5] = controlType;
    emit control5TypeChanged();
    return;
}

unsigned char BackEnd::control5Type(){
    return m_controlType[5];
}

void BackEnd::setControl6Type(const unsigned char &controlType){
    if (controlType == m_controlType[6])
        return;
    m_controlType[6] = controlType;
    emit control6TypeChanged();
    return;
}

unsigned char BackEnd::control6Type(){
    return m_controlType[6];
}

void BackEnd::setControl7Type(const unsigned char &controlType){
    if (controlType == m_controlType[7])
        return;
    m_controlType[7] = controlType;
    emit control7TypeChanged();
    return;
}

unsigned char BackEnd::control7Type(){
    return m_controlType[7];
}

void BackEnd::setControl8Type(const unsigned char &controlType){
    if (controlType == m_controlType[8])
        return;
    m_controlType[8] = controlType;
    emit control8TypeChanged();
    return;
}

unsigned char BackEnd::control8Type(){
    return m_controlType[8];
}

void BackEnd::setControl9Type(const unsigned char &controlType){
    if (controlType == m_controlType[9])
        return;
    m_controlType[9] = controlType;
    emit control9TypeChanged();
    return;
}

unsigned char BackEnd::control9Type(){
    return m_controlType[9];
}

void BackEnd::setControl10Type(const unsigned char &controlType){
    if (controlType == m_controlType[10])
        return;
    m_controlType[10] = controlType;
    emit control10TypeChanged();
    return;
}

unsigned char BackEnd::control10Type(){
    return m_controlType[10];
}

void BackEnd::setControl11Type(const unsigned char &controlType){
    if (controlType == m_controlType[11])
        return;
    m_controlType[11] = controlType;
    emit control11TypeChanged();
    return;
}

unsigned char BackEnd::control11Type(){
    return m_controlType[11];
}

void BackEnd::setControl12Type(const unsigned char &controlType){
    if (controlType == m_controlType[12])
        return;
    m_controlType[12] = controlType;
    emit control12TypeChanged();
    return;
}

unsigned char BackEnd::control12Type(){
    return m_controlType[12];
}

void BackEnd::setControl13Type(const unsigned char &controlType){
    if (controlType == m_controlType[13])
        return;
    m_controlType[13] = controlType;
    emit control13TypeChanged();
    return;
}

unsigned char BackEnd::control13Type(){
    return m_controlType[13];
}

void BackEnd::setControl14Type(const unsigned char &controlType){
    if (controlType == m_controlType[14])
        return;
    m_controlType[14] = controlType;
    emit control14TypeChanged();
    return;
}

unsigned char BackEnd::control14Type(){
    return m_controlType[14];
}

void BackEnd::setControl15Type(const unsigned char &controlType){
    if (controlType == m_controlType[15])
        return;
    m_controlType[15] = controlType;
    emit control15TypeChanged();
    return;
}

unsigned char BackEnd::control15Type(){
    return m_controlType[15];
}

void BackEnd::setValue0(const unsigned char &value){

    if (value == m_value[0])
        return;
    m_value[0] = value;
    emit value0Changed();
    return;
}

unsigned char BackEnd::value0(){
    return m_value[0];
}

void BackEnd::setValue1(const unsigned char &value){

    if (value == m_value[1])
        return;
    m_value[1] = value;
    emit value1Changed();
    return;
}

unsigned char BackEnd::value1(){
    return m_value[1];
}

void BackEnd::setValue2(const unsigned char &value){

    if (value == m_value[2])
        return;
    m_value[2] = value;
    emit value2Changed();
    return;
}

unsigned char BackEnd::value2(){
    return m_value[2];
}

void BackEnd::setValue3(const unsigned char &value){

    if (value == m_value[3])
        return;
    m_value[3] = value;
    emit value3Changed();
    return;
}

unsigned char BackEnd::value3(){
    return m_value[3];
}

void BackEnd::setValue4(const unsigned char &value){

    if (value == m_value[4])
        return;
    m_value[4] = value;
    emit value4Changed();
    return;
}

unsigned char BackEnd::value4(){
    return m_value[4];
}

void BackEnd::setValue5(const unsigned char &value){

    if (value == m_value[5])
        return;
    m_value[5] = value;
    emit value5Changed();
    return;
}

unsigned char BackEnd::value5(){
    return m_value[5];
}

void BackEnd::setValue6(const unsigned char &value){

    if (value == m_value[6])
        return;
    m_value[6] = value;
    emit value6Changed();
    return;
}

unsigned char BackEnd::value6(){
    return m_value[6];
}

void BackEnd::setValue7(const unsigned char &value){

    if (value == m_value[7])
        return;
    m_value[7] = value;
    emit value7Changed();
    return;
}

unsigned char BackEnd::value7(){
    return m_value[7];
}

void BackEnd::setValue8(const unsigned char &value){

    if (value == m_value[8])
        return;
    m_value[0] = value;
    emit value8Changed();
    return;
}

unsigned char BackEnd::value8(){
    return m_value[8];
}

void BackEnd::setValue9(const unsigned char &value){

    if (value == m_value[9])
        return;
    m_value[9] = value;
    emit value9Changed();
    return;
}

unsigned char BackEnd::value9(){
    return m_value[9];
}

void BackEnd::setValue10(const unsigned char &value){

    if (value == m_value[10])
        return;
    m_value[10] = value;
    emit value10Changed();
    return;
}

unsigned char BackEnd::value10(){
    return m_value[10];
}

void BackEnd::setValue11(const unsigned char &value){

    if (value == m_value[11])
        return;
    m_value[11] = value;
    emit value11Changed();
    return;
}

unsigned char BackEnd::value11(){
    return m_value[11];
}

void BackEnd::setValue12(const unsigned char &value){

    if (value == m_value[12])
        return;
    m_value[12] = value;
    emit value12Changed();
    return;
}

unsigned char BackEnd::value12(){
    return m_value[12];
}

void BackEnd::setValue13(const unsigned char &value){

    if (value == m_value[13])
        return;
    m_value[13] = value;
    emit value13Changed();
    return;
}

unsigned char BackEnd::value13(){
    return m_value[13];
}

void BackEnd::setValue14(const unsigned char &value){

    if (value == m_value[14])
        return;
    m_value[14] = value;
    emit value14Changed();
    return;
}

unsigned char BackEnd::value14(){
    return m_value[14];
}

void BackEnd::setValue15(const unsigned char &value){

    if (value == m_value[15])
        return;
    m_value[15] = value;
    emit value15Changed();
    return;
}

unsigned char BackEnd::value15(){
    return m_value[15];
}

void BackEnd::senseDeviceStatus(){

    this->timer->stop();

    int r;

    ssize_t cnt;
    r = libusb_init(&ctx);
    if(r < 0) {
        setDeviceStatus("unplugged");
        this->timer->start(50);
        return;
    }

    libusb_set_debug(ctx, 3);

    cnt = libusb_get_device_list(ctx, &devs);
    if(cnt<0) {
        setDeviceStatus("unplugged");
        this->timer->start(50);
        return;
    }

    dev_handle = libusb_open_device_with_vid_pid(ctx, 4660, 1);
    if(dev_handle ==NULL){
        setDeviceStatus("unplugged");
        this->timer->start(50);
        return;
    }

    libusb_free_device_list(devs, 1);

    for (int i=0; i<2;i++){

        if(libusb_kernel_driver_active(dev_handle, i) == 1) {
            libusb_detach_kernel_driver(dev_handle, i);
        }

        r = libusb_claim_interface(dev_handle, i);

        if(r < 0){
            setDeviceStatus("unplugged");
            this->timer->start(50);
            return;
        }
    }
    setDeviceStatus("connected");

    this->timer->start(50);
    return;
}

void BackEnd::readDeviceConfiguration(){

    printf("\nReading device configuration\n");

    this->timer->stop();

    unsigned char *data_out = new unsigned char[4]; //data to write
    unsigned char *data_in  = new unsigned char[4]; //data to read

    int actual;
    int r;

    data_out[0]=HOST_REQUIRES_READING; data_out[1]=HOST_REQUIRES_READING;
    data_out[2]=HOST_REQUIRES_READING; data_out[3]=HOST_REQUIRES_READING;

    r = libusb_bulk_transfer(dev_handle, (1 | LIBUSB_ENDPOINT_OUT), data_out, 4, &actual, 0);

    if (r != 0){
        printf(" write error");
        setDeviceStatus("unplugged");
        this->timer->start(50);
        return;
    }

    printf("\nRead request send");

    while ((data_in[2] != OK) && (data_in[3]!=OK)){
        printf(".");
        r = libusb_bulk_transfer(dev_handle, (1 | LIBUSB_ENDPOINT_IN), data_in, 4, &actual, 25);
        if (r != 0){
            if(r == LIBUSB_ERROR_TIMEOUT){
                r = libusb_bulk_transfer(dev_handle, (1 | LIBUSB_ENDPOINT_OUT), data_out, 4, &actual, 0);
            } else {
                setDeviceStatus("unplugged");
                printf(" read error");
                this->timer->start(50);
                return;
            }
        }
    }

    printf("Ok\n\nReading Data");

    int i = 0;

    while((int(data_in[2])!=FINISH) && (int(data_in[3]!=FINISH))){

        r = libusb_bulk_transfer(dev_handle, (1 | LIBUSB_ENDPOINT_IN), data_in, 4, &actual, 0);
        if (r != 0){
            setDeviceStatus("unplugged");
            printf(" read error");
            this->timer->start(50);
            return;
        }

        interfaceConfig[i] = char(data_in[0]);  printf("\n%i - %i",i,data_in[0]);        //Its read all the package.
        interfaceConfig[i+1] = char(data_in[1]); printf("\n%i - %i",i+1,data_in[1]);        //ENHANCE: It is better read the address in data_in[0]
        interfaceConfig[i+2] = char(data_in[2]); printf("\n%i - %i",i+2,data_in[2]);       //and the values in data_in[1:3]
        interfaceConfig[i+3] = char(data_in[3]); printf("\n%i - %i",i+3,data_in[3]);

        i = i+4;

        //printf(".");
    }

    setDeviceStatus("okData");

    printf("Done\n");

    printf("\nSetting Layout");

    this->timer->start(50);

    return;
}

void BackEnd::setInterface(){

    this->timer->stop();

    setControl0Type(int(interfaceConfig[0])); printf(".");
    setControl1Type(int(interfaceConfig[1])); printf(".");
    setControl2Type(int(interfaceConfig[2])); printf(".");
    setControl3Type(int(interfaceConfig[3])); printf(".");
    setControl4Type(int(interfaceConfig[4])); printf(".");
    setControl5Type(int(interfaceConfig[5])); printf(".");
    setControl6Type(int(interfaceConfig[6])); printf(".");
    setControl7Type(int(interfaceConfig[7])); printf(".");
    setControl8Type(int(interfaceConfig[8])); printf(".");
    setControl9Type(int(interfaceConfig[9])); printf(".");
    setControl10Type(int(interfaceConfig[10])); printf(".");
    setControl11Type(int(interfaceConfig[11])); printf(".");
    setControl12Type(int(interfaceConfig[12])); printf(".");
    setControl13Type(int(interfaceConfig[13])); printf(".");
    setControl14Type(int(interfaceConfig[14])); printf(".");
    setControl15Type(int(interfaceConfig[15])); printf(".");

    if(firstConfiguration){
        firstConfiguration = false;
        sleep(1);
    }

    selectComponent(0);

    setDeviceStatus("working");
    printf("Done\n");
    this->timer->start(50);
    return;
}

void BackEnd::senseValue(){

    return;

    this->timer->stop();

    unsigned char *data_in  = new unsigned char[4];

    int actual = 0;
    int r;
    char tComp;
    char pComp;

    r = libusb_bulk_transfer(dev_handle, (1 | LIBUSB_ENDPOINT_IN), data_in, 4, &actual, 50);

    if (r == 0) {

        //printf("'%i | %i | %i | %i'\n",int(data_in[0]),int(data_in[1]),int(data_in[2]),int(data_in[3]));

        tComp = (data_in[2] & 0xF0) >> 4;
        pComp = data_in[2] & 0x0F;

        //printf("tipo= %i  Componente = %i\n",tComp,pComp);

        switch(tComp){
        case 5:
            switch (pComp) {
            case 0:
                setValue0(int(data_in[3])*255/(int(interfaceConfig[36])-int(interfaceConfig[35])));
                break;
            case 1:
                setValue1(int(data_in[3])*255/(int(interfaceConfig[36])-int(interfaceConfig[35])));
                break;
            case 2:
                setValue2(int(data_in[3])*255/(int(interfaceConfig[36])-int(interfaceConfig[35])));
                break;
            case 3:
                setValue3(int(data_in[3])*255/(int(interfaceConfig[36])-int(interfaceConfig[35])));
                break;
            case 4:
                setValue4(int(data_in[3])*255/(int(interfaceConfig[36])-int(interfaceConfig[35])));
                break;
            case 5:
                setValue5(int(data_in[3])*255/(int(interfaceConfig[36])-int(interfaceConfig[35])));
                break;
            case 6:
                setValue6(int(data_in[3])*255/(int(interfaceConfig[36])-int(interfaceConfig[35])));
                break;
            case 7:
                setValue7(int(data_in[3])*255/(int(interfaceConfig[36])-int(interfaceConfig[35])));
                break;
            case 8:
                setValue8(int(data_in[3])*255/(int(interfaceConfig[36])-int(interfaceConfig[35])));
                break;
            case 9:
                setValue9(int(data_in[3])*255/(int(interfaceConfig[36])-int(interfaceConfig[35])));
                break;
            case 10:
                setValue10(int(data_in[3])*255/(int(interfaceConfig[36])-int(interfaceConfig[35])));
                break;
            case 11:
                setValue11(int(data_in[3])*255/(int(interfaceConfig[36])-int(interfaceConfig[35])));
                break;
            case 12:
                setValue12(int(data_in[3])*255/(int(interfaceConfig[36])-int(interfaceConfig[35])));
                break;
            case 13:
                setValue13(int(data_in[3])*255/(int(interfaceConfig[36])-int(interfaceConfig[35])));
                break;
            case 14:
                setValue14(int(data_in[3])*255/(int(interfaceConfig[36])-int(interfaceConfig[35])));
                break;
            case 15:
                setValue15(int(data_in[3])*255/(int(interfaceConfig[36])-int(interfaceConfig[35])));
                break;
            default:
                break;
            }

            break;
        case 6:
          //  setValue2(int(data_in[3])*255/(int(interfaceConfig[41])-int(interfaceConfig[40])));
            break;
        case 7:
           // setValue3(int(data_in[3])*255/(int(interfaceConfig[46])-int(interfaceConfig[45])));
            break;
        default:
            break;
        }

    } else {
        if(r != LIBUSB_ERROR_TIMEOUT){
            setDeviceStatus("unplugged");
            printf("error\n");
            this->timer->start(50);
            return;
        }
    }
    this->timer->start(50);
    return;
}

void BackEnd::syncHost2Device(){

    this->timer->stop();

    printf("\nSync\n");

    setDeviceStatus("sending data");

    unsigned char *data_out = new unsigned char[4]; //data to write
    unsigned char *data_in  = new unsigned char[4]; //data to read

    int actual;
    int r;

    data_out[0]=HOST_REQUIRES_WRITING;
    data_out[1]=HOST_REQUIRES_WRITING;
    data_out[2]=HOST_REQUIRES_WRITING;
    data_out[3]=HOST_REQUIRES_WRITING;

    r = libusb_bulk_transfer(dev_handle, (1 | LIBUSB_ENDPOINT_OUT), data_out, 4, &actual, 0);

    printf("\nWrite Request Send\n");

    usleep(100);
    if (r != 0){
        printf(" write error");
        setDeviceStatus("unplugged");
        this->timer->start(50);
        return;
    }

    while ((int(data_in[2])!=OK) && (int(data_in[3]!=OK))){
        r = libusb_bulk_transfer(dev_handle, (1 | LIBUSB_ENDPOINT_IN), data_in, 4, &actual, 25);
        if (r != 0){
            if(r == LIBUSB_ERROR_TIMEOUT){
                r = libusb_bulk_transfer(dev_handle, (1 | LIBUSB_ENDPOINT_OUT), data_out, 4, &actual, 0);
            } else {
                setDeviceStatus("unplugged");
                printf(" read error");
                this->timer->start(50);
                return;
            }
        }
        //printf("%i | %i | %i | %i\n",int(data_in[0]),int(data_in[1]),int(data_in[2]),int(data_in[3]));
    }

    printf("\nOk\n\nWritting Data");

    interfaceConfig[31]=176;

    for (int i =0; i < 128; i=i+4){

        data_out[0]=interfaceConfig[i]; data_out[1]=interfaceConfig[i + 1];         //ENHANCE: It is better send address and values
        data_out[2]=interfaceConfig[i + 2]; data_out[3]=interfaceConfig[i + 3];

        r = libusb_bulk_transfer(dev_handle, (1 | LIBUSB_ENDPOINT_OUT), data_out, 4, &actual, 0);
        if (r != 0){
            setDeviceStatus("unplugged");
            printf(" read error");
            this->timer->start(50);
            return;
        }
        usleep(11100); // WE NEED SYNCRONIZE    --  ENHANCE
        printf(".");
    }

    data_out[0]=FINISH; data_out[1]=FINISH;
    data_out[2]=FINISH; data_out[3]=FINISH;

    r = libusb_bulk_transfer(dev_handle, (1 | LIBUSB_ENDPOINT_OUT), data_out, 4, &actual, 0);
    if (r != 0){
        setDeviceStatus("unplugged");
        printf(" read error");
        this->timer->start(50);
        return;
    }

    printf("Done\n");

    readDeviceConfiguration();

    firstConfiguration = true;
    setInterface();

   //setDeviceStatus("working");

   // sleep(1);

    this->timer->start(50);
    return;
}
