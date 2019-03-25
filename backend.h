#ifndef BACKEND_H
#define BACKEND_H

#include <QtCore>
#include <QtGui>
#include <QObject>
#include <QThread>

#include <libusb.h>

class BackEnd : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString deviceStatus READ deviceStatus WRITE setDeviceStatus NOTIFY deviceStatusChanged)
    Q_PROPERTY(QString deviceMode READ deviceMode WRITE setDeviceMode NOTIFY deviceModeChanged)
    Q_PROPERTY(unsigned char ccNumber READ ccNumber WRITE setCcNumber NOTIFY ccNumberChanged)
    Q_PROPERTY(unsigned char minValue READ minValue WRITE setMinValue NOTIFY minValueChanged)
    Q_PROPERTY(unsigned char maxValue READ maxValue WRITE setMaxValue NOTIFY maxValueChanged)
    Q_PROPERTY(unsigned char component READ component WRITE selectComponent NOTIFY componentChanged)
    Q_PROPERTY(unsigned char control0Type READ control0Type WRITE setControl0Type NOTIFY control0TypeChanged)
    Q_PROPERTY(unsigned char control1Type READ control1Type WRITE setControl1Type NOTIFY control1TypeChanged)
    Q_PROPERTY(unsigned char control2Type READ control2Type WRITE setControl2Type NOTIFY control2TypeChanged)
    Q_PROPERTY(unsigned char control3Type READ control3Type WRITE setControl3Type NOTIFY control3TypeChanged)
    Q_PROPERTY(unsigned char control4Type READ control4Type WRITE setControl4Type NOTIFY control4TypeChanged)
    Q_PROPERTY(unsigned char control5Type READ control5Type WRITE setControl5Type NOTIFY control5TypeChanged)
    Q_PROPERTY(unsigned char control6Type READ control6Type WRITE setControl6Type NOTIFY control6TypeChanged)
    Q_PROPERTY(unsigned char control7Type READ control7Type WRITE setControl7Type NOTIFY control7TypeChanged)
    Q_PROPERTY(unsigned char control8Type READ control8Type WRITE setControl8Type NOTIFY control8TypeChanged)
    Q_PROPERTY(unsigned char control9Type READ control9Type WRITE setControl9Type NOTIFY control9TypeChanged)
    Q_PROPERTY(unsigned char control10Type READ control10Type WRITE setControl10Type NOTIFY control10TypeChanged)
    Q_PROPERTY(unsigned char control11Type READ control11Type WRITE setControl11Type NOTIFY control11TypeChanged)
    Q_PROPERTY(unsigned char control12Type READ control12Type WRITE setControl2Type NOTIFY control12TypeChanged)
    Q_PROPERTY(unsigned char control13Type READ control13Type WRITE setControl13Type NOTIFY control13TypeChanged)
    Q_PROPERTY(unsigned char control14Type READ control14Type WRITE setControl14Type NOTIFY control14TypeChanged)
    Q_PROPERTY(unsigned char control15Type READ control15Type WRITE setControl15Type NOTIFY control15TypeChanged)
    Q_PROPERTY(unsigned char value0 READ value0 WRITE setValue0 NOTIFY value0Changed)
    Q_PROPERTY(unsigned char value1 READ value1 WRITE setValue1 NOTIFY value1Changed)
    Q_PROPERTY(unsigned char value2 READ value2 WRITE setValue2 NOTIFY value2Changed)
    Q_PROPERTY(unsigned char value3 READ value3 WRITE setValue3 NOTIFY value3Changed)
    Q_PROPERTY(unsigned char value4 READ value4 WRITE setValue4 NOTIFY value4Changed)
    Q_PROPERTY(unsigned char value5 READ value5 WRITE setValue5 NOTIFY value5Changed)
    Q_PROPERTY(unsigned char value6 READ value6 WRITE setValue6 NOTIFY value6Changed)
    Q_PROPERTY(unsigned char value7 READ value7 WRITE setValue7 NOTIFY value7Changed)
    Q_PROPERTY(unsigned char value8 READ value8 WRITE setValue8 NOTIFY value8Changed)
    Q_PROPERTY(unsigned char value9 READ value9 WRITE setValue9 NOTIFY value9Changed)
    Q_PROPERTY(unsigned char value10 READ value10 WRITE setValue10 NOTIFY value10Changed)
    Q_PROPERTY(unsigned char value11 READ value11 WRITE setValue11 NOTIFY value11Changed)
    Q_PROPERTY(unsigned char value12 READ value12 WRITE setValue12 NOTIFY value12Changed)
    Q_PROPERTY(unsigned char value13 READ value13 WRITE setValue13 NOTIFY value13Changed)
    Q_PROPERTY(unsigned char value14 READ value14 WRITE setValue14 NOTIFY value14Changed)
    Q_PROPERTY(unsigned char value15 READ value15 WRITE setValue15 NOTIFY value15Changed)

public:
    explicit BackEnd(QObject *parent = nullptr);
    ~BackEnd();

    QString deviceStatus();
    void setDeviceStatus(const QString &deviceStatus);

    QString deviceMode();

    bool firstConfiguration;
    unsigned char *interfaceConfig  = new unsigned char[128]; //data to read

    unsigned char ccNumber();

    unsigned char minValue();

    unsigned char maxValue();

    unsigned char component();

    unsigned char control0Type();
    unsigned char control1Type();
    unsigned char control2Type();
    unsigned char control3Type();
    unsigned char control4Type();
    unsigned char control5Type();
    unsigned char control6Type();
    unsigned char control7Type();
    unsigned char control8Type();
    unsigned char control9Type();
    unsigned char control10Type();
    unsigned char control11Type();
    unsigned char control12Type();
    unsigned char control13Type();
    unsigned char control14Type();
    unsigned char control15Type();

    unsigned char value0();
    void setValue0(const unsigned char &value);
    unsigned char value1();
    void setValue1(const unsigned char &value);
    unsigned char value2();
    void setValue2(const unsigned char &value);
    unsigned char value3();
    void setValue3(const unsigned char &value);
    unsigned char value4();
    void setValue4(const unsigned char &value);
    unsigned char value5();
    void setValue5(const unsigned char &value);
    unsigned char value6();
    void setValue6(const unsigned char &value);
    unsigned char value7();
    void setValue7(const unsigned char &value);
    unsigned char value8();
    void setValue8(const unsigned char &value);
    unsigned char value9();
    void setValue9(const unsigned char &value);
    unsigned char value10();
    void setValue10(const unsigned char &value);
    unsigned char value11();
    void setValue11(const unsigned char &value);
    unsigned char value12();
    void setValue12(const unsigned char &value);
    unsigned char value13();
    void setValue13(const unsigned char &value);
    unsigned char value14();
    void setValue14(const unsigned char &value);
    unsigned char value15();
    void setValue15(const unsigned char &value);

public slots:
    void syncHost2Device();

    void setDeviceMode(const QString &deviceMode);

    void setCcNumber(const unsigned char &ccNumber);

    void setInterface();

    void selectComponent(const unsigned char &component);
    void setMinValue(const unsigned char &minValue);
    void setMaxValue(const unsigned char &maxValue);

    void setControl0Type(const unsigned char &controlType);
    void setControl1Type(const unsigned char &controlType);
    void setControl2Type(const unsigned char &controlType);
    void setControl3Type(const unsigned char &controlType);
    void setControl4Type(const unsigned char &controlType);
    void setControl5Type(const unsigned char &controlType);
    void setControl6Type(const unsigned char &controlType);
    void setControl7Type(const unsigned char &controlType);
    void setControl8Type(const unsigned char &controlType);
    void setControl9Type(const unsigned char &controlType);
    void setControl10Type(const unsigned char &controlType);
    void setControl11Type(const unsigned char &controlType);
    void setControl12Type(const unsigned char &controlType);
    void setControl13Type(const unsigned char &controlType);
    void setControl14Type(const unsigned char &controlType);
    void setControl15Type(const unsigned char &controlType);

private slots:
    void timer_timeout();

signals:
    void deviceStatusChanged();
    void deviceModeChanged();
    void ccNumberChanged();
    void minValueChanged();
    void maxValueChanged();
    void componentChanged();
    void control0TypeChanged();
    void control1TypeChanged();
    void control2TypeChanged();
    void control3TypeChanged();
    void control4TypeChanged();
    void control5TypeChanged();
    void control6TypeChanged();
    void control7TypeChanged();
    void control8TypeChanged();
    void control9TypeChanged();
    void control10TypeChanged();
    void control11TypeChanged();
    void control12TypeChanged();
    void control13TypeChanged();
    void control14TypeChanged();
    void control15TypeChanged();
    void value0Changed();
    void value1Changed();
    void value2Changed();
    void value3Changed();
    void value4Changed();
    void value5Changed();
    void value6Changed();
    void value7Changed();
    void value8Changed();
    void value9Changed();
    void value10Changed();
    void value11Changed();
    void value12Changed();
    void value13Changed();
    void value14Changed();
    void value15Changed();

private:
    QString m_deviceStatus;
    QString m_deviceMode;
    unsigned char m_ccNumber;
    unsigned char m_minValue;
    unsigned char m_maxValue;
    unsigned char m_component;

    unsigned char *m_controlType = new unsigned char [16];

    unsigned char *m_value = new unsigned char [16];

    QTimer *timer;

    void senseValue();
    void senseDeviceStatus();
    void readDeviceConfiguration();
};

#endif // BACKEND_H
