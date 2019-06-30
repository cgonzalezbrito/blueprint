import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 2.2
import QtQuick.Controls 1.4 as QQC1
import QtQuick.Controls.Styles 1.4
import QtQml 2.1
//import QtQuick.Dialogs 1.1

//Our modele
import com.tinami.backend 1.0
//import io.qt.examples.controller 1.0

import "content"

Window {

    visible: true
    width: 1024
    height: 768
    title: qsTr("Tinami")

    BackEnd {
        id: backend

        onDeviceStatusChanged: {
            switch(backend.deviceStatus){
            case BackEnd.Unplugged:
                deviceStatusLabel.text = "unplugged";
                break;
            case BackEnd.Ready_for_config:
                deviceStatusLabel.text = "ready for config";
                break;
            case BackEnd.Ready_for_update:
                deviceStatusLabel.text = "ready for update";
                break;

            case BackEnd.Ok_data:
                deviceStatusLabel.text = "ok Data";
                break;
            case BackEnd.Working:
                deviceStatusLabel.text = "working";
                break;
            case BackEnd.Wrong_data:
                deviceStatusLabel.text = "wrong Data";
                break;
            }
        }

        onComponentModeChanged: {
            switch(backend.deviceMode){
            case BackEnd.VoiceNote:
                componentMode_combo.currentIndex = 0
                break;
            case BackEnd.VoiceControlChange:
                componentMode_combo.currentIndex = 1
                break;
            }
        }

        onComponentButtonBehaviourChanged: {
            switch(backend.componentButtonBehaviour){
            case BackEnd.None:
                break;
            case BackEnd.Momentary:
                componentButtonBehaviour_combo.currentIndex = 0
                break;
            case BackEnd.Toggle:
                componentButtonBehaviour_combo.currentIndex = 1
                break;
            }
        }

        onComponentDataChanged: {
            componentData_combo.currentIndex = componentData;
        }

        onComponentChannelChanged: {
            componentChannel_combo.currentIndex = componentChannel;
        }

        onComponentMinValueChanged: {
            componentMinValue_textInput.text = componentMinValue;
        }

        onComponentMaxValueChanged: {
            componentMaxValue_textInput.text = componentMaxValue;
        }

        onControl0TypeChanged:{
            if(backend.control0Type === 2) a1Loader.sourceComponent = potSelected;
            if(backend.control0Type === 1){
                a1Loader.sourceComponent = buttonSelected;
                comp_name.text = qsTr("button a1");}
        }
        onControl1TypeChanged:{
            if(backend.control1Type === 2){
                a2Loader.sourceComponent = a2Pot;
            }
            if(backend.control1Type === 1)
                a2Loader.sourceComponent = a2Button;
        }
        onControl2TypeChanged:{
            if(backend.control2Type === 2){
                a3Loader.sourceComponent = a3Pot;
            }
            if(backend.control2Type === 1)
                a3Loader.sourceComponent = a3Button;
        }
        onControl3TypeChanged:{
            if(backend.control3Type === 2){
                a4Loader.sourceComponent = a4Pot;
            }
            if(backend.control3Type === 1)
                a4Loader.sourceComponent = a4Button;

        }
        onControl4TypeChanged:{
            if(backend.control4Type === 2){
                b1Loader.sourceComponent = b1Pot;
            }
            if(backend.control4Type === 1)
                b1Loader.sourceComponent = b1Button;
        }
        onControl5TypeChanged:{
            if(backend.control5Type === 2){
                b2Loader.sourceComponent = b2Pot;
            }
            if(backend.control5Type === 1)
                b2Loader.sourceComponent = b2Button;

        }
        onControl6TypeChanged:{
            if(backend.control6Type === 2){
                b3Loader.sourceComponent = b3Pot;
            }
            if(backend.control6Type === 1)
                b3Loader.sourceComponent = b3Button;

        }
        onControl7TypeChanged:{
            if(backend.control7Type === 2){
                b4Loader.sourceComponent = b4Pot;
            }
            if(backend.control7Type === 1)
                b4Loader.sourceComponent = b4Button;

        }
        onControl8TypeChanged:{
            if(backend.control8Type === 2){
                c1Loader.sourceComponent = c1Pot;
            }
            if(backend.control8Type === 1)
                c1Loader.sourceComponent = c1Button;

        }
        onControl9TypeChanged:{
            if(backend.control9Type === 2){
                c2Loader.sourceComponent = c2Pot;
            }
            if(backend.control9Type === 1)
                c2Loader.sourceComponent = c2Button;

        }
        onControl10TypeChanged:{
            if(backend.control10Type === 2){
                c3Loader.sourceComponent = c3Pot;
            }
            if(backend.control10Type === 1)
                c3Loader.sourceComponent = c3Button;

        }
        onControl11TypeChanged:{
            if(backend.control11Type === 2){
                c4Loader.sourceComponent = c4Pot;
            }
            if(backend.control11Type === 1)
                c4Loader.sourceComponent = c4Button;

        }
        onControl12TypeChanged:{
            if(backend.control12Type === 2){
                d1Loader.sourceComponent = d1Pot;
            }
            if(backend.control12Type === 1)
                d1Loader.sourceComponent = d1Button;

        }
        onControl13TypeChanged:{
            if(backend.control13Type === 2){
                d2Loader.sourceComponent = d2Pot;
            }
            if(backend.control13Type === 1)
                d2Loader.sourceComponent = d2Button;

        }
        onControl14TypeChanged:{
            if(backend.control14Type === 2){
                d3Loader.sourceComponent = d3Pot;
            }
            if(backend.control14Type === 1)
                d3Loader.sourceComponent = d3Button;
        }
        onControl15TypeChanged:{
            if(backend.control15Type === 2){
                d4Loader.sourceComponent = d4Pot;
            }
            if(backend.control15Type === 1)
                d4Loader.sourceComponent = d4Button;
        }

        onSynchronizingChanged: {
            if(!backend.synchronizing){
                clock.visible = false;
                syncButton.visible = true;
            } else {
                clock.visible = true;
                syncButton.visible = false;
            }
        }
    }

    Component{
        id: potSelected
        Button{
            autoExclusive: false
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: a1Pot.down ? "#17a81a" : "transparent"
                Image { source: "content/images/knobS.svg"}
            }
        }
    }

    Component{
        id: buttonSelected
        Button{
            autoExclusive: false
            //display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: a1Button.down ? "#17a81a" : "transparent"
                Image { source: "content/images/buttonS.svg"}
            }
        }
    }

    /*  Component{
        id: a1Back
        Image { source: "content/images/Knob-w-back.svg"}
    }*/

    Component{
        id: a1Pot
        Button{
            autoExclusive: false
            //display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: a1Pot.down ? "#17a81a" : "transparent"
                Image { source: "content/images/knob.svg"}
            }

            onClicked:{
                comp_name.text = qsTr("knob a1");
                backend.selectComponent(0);

                if(backend.control1Type === 2) a2Loader.sourceComponent = a2Pot;
                if(backend.control1Type === 1) a2Loader.sourceComponent = a2Button;

                if(backend.control2Type === 2) a3Loader.sourceComponent = a3Pot;
                if(backend.control2Type === 1) a3Loader.sourceComponent = a3Button;

                if(backend.control3Type === 2) a4Loader.sourceComponent = a4Pot;
                if(backend.control3Type === 1) a4Loader.sourceComponent = a4Button;

                if(backend.control4Type === 2) b1Loader.sourceComponent = b1Pot;
                if(backend.control4Type === 1) b1Loader.sourceComponent = b1Button;

                if(backend.control5Type === 2) b2Loader.sourceComponent = b2Pot;
                if(backend.control5Type === 1) b2Loader.sourceComponent = b2Button;

                if(backend.control6Type === 2) b3Loader.sourceComponent = b3Pot;
                if(backend.control6Type === 1) b3Loader.sourceComponent = b3Button;

                if(backend.control7Type === 2) b4Loader.sourceComponent = b4Pot;
                if(backend.control7Type === 1) b4Loader.sourceComponent = b4Button;

                if(backend.control8Type === 2) c1Loader.sourceComponent = c1Pot;
                if(backend.control8Type === 1) c1Loader.sourceComponent = c1Button;

                if(backend.control9Type === 2) c2Loader.sourceComponent = c2Pot;
                if(backend.control9Type === 1) c2Loader.sourceComponent = c2Button;

                if(backend.control10Type === 2) c3Loader.sourceComponent = c3Pot;
                if(backend.control10Type === 1) c3Loader.sourceComponent = c3Button;

                if(backend.control11Type === 2) c4Loader.sourceComponent = c4Pot;
                if(backend.control11Type === 1) c4Loader.sourceComponent = c4Button;

                if(backend.control12Type === 2) d1Loader.sourceComponent = d1Pot;
                if(backend.control12Type === 1) d1Loader.sourceComponent = d1Button;

                if(backend.control13Type === 2) d2Loader.sourceComponent = d2Pot;
                if(backend.control13Type === 1) d2Loader.sourceComponent = d2Button;

                if(backend.control14Type === 2) d3Loader.sourceComponent = d3Pot;
                if(backend.control14Type === 1) d3Loader.sourceComponent = d3Button;

                if(backend.control15Type === 2) d4Loader.sourceComponent = d4Pot;
                if(backend.control15Type === 1) d4Loader.sourceComponent = d4Button;

                a1Loader.sourceComponent = potSelected;
            }
        }
    }

    Component{
        id: a1Button
        Button{
            autoExclusive: false
            //display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: a1Button.down ? "#17a81a" : "transparent"
                Image { source: "content/images/button.svg"}
            }
            onClicked:{
                comp_name.text = qsTr("button a1");
                backend.selectComponent(0);

                if(backend.control1Type === 2) a2Loader.sourceComponent = a2Pot;
                if(backend.control1Type === 1) a2Loader.sourceComponent = a2Button;

                if(backend.control2Type === 2) a3Loader.sourceComponent = a3Pot;
                if(backend.control2Type === 1) a3Loader.sourceComponent = a3Button;

                if(backend.control3Type === 2) a4Loader.sourceComponent = a4Pot;
                if(backend.control3Type === 1) a4Loader.sourceComponent = a4Button;

                if(backend.control4Type === 2) b1Loader.sourceComponent = b1Pot;
                if(backend.control4Type === 1) b1Loader.sourceComponent = b1Button;

                if(backend.control5Type === 2) b2Loader.sourceComponent = b2Pot;
                if(backend.control5Type === 1) b2Loader.sourceComponent = b2Button;

                if(backend.control6Type === 2) b3Loader.sourceComponent = b3Pot;
                if(backend.control6Type === 1) b3Loader.sourceComponent = b3Button;

                if(backend.control7Type === 2) b4Loader.sourceComponent = b4Pot;
                if(backend.control7Type === 1) b4Loader.sourceComponent = b4Button;

                if(backend.control8Type === 2) c1Loader.sourceComponent = c1Pot;
                if(backend.control8Type === 1) c1Loader.sourceComponent = c1Button;

                if(backend.control9Type === 2) c2Loader.sourceComponent = c2Pot;
                if(backend.control9Type === 1) c2Loader.sourceComponent = c2Button;

                if(backend.control10Type === 2) c3Loader.sourceComponent = c3Pot;
                if(backend.control10Type === 1) c3Loader.sourceComponent = c3Button;

                if(backend.control11Type === 2) c4Loader.sourceComponent = c4Pot;
                if(backend.control11Type === 1) c4Loader.sourceComponent = c4Button;

                if(backend.control12Type === 2) d1Loader.sourceComponent = d1Pot;
                if(backend.control12Type === 1) d1Loader.sourceComponent = d1Button;

                if(backend.control13Type === 2) d2Loader.sourceComponent = d2Pot;
                if(backend.control13Type === 1) d2Loader.sourceComponent = d2Button;

                if(backend.control14Type === 2) d3Loader.sourceComponent = d3Pot;
                if(backend.control14Type === 1) d3Loader.sourceComponent = d3Button;

                if(backend.control15Type === 2) d4Loader.sourceComponent = d4Pot;
                if(backend.control15Type === 1) d4Loader.sourceComponent = d4Button;

                a1Loader.sourceComponent = buttonSelected;
            }
        }
    }

    /*Component{
        id: a2Back
        Image { source: "content/images/Knob-w-back.svg"}
    }*/

    Component{
        id: a2Pot
        Button{
            autoExclusive: false
            //display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: a2Pot.down ? "#17a81a" : "transparent"
                Image { source: "content/images/knob.svg"}
            }
            onClicked:{
                comp_name.text = qsTr("knob a2");
                backend.selectComponent(1);

                if(backend.control0Type === 2) a1Loader.sourceComponent = a1Pot;
                if(backend.control0Type === 1) a1Loader.sourceComponent = a1Button;

                if(backend.control2Type === 2) a3Loader.sourceComponent = a3Pot;
                if(backend.control2Type === 1) a3Loader.sourceComponent = a3Button;

                if(backend.control3Type === 2) a4Loader.sourceComponent = a4Pot;
                if(backend.control3Type === 1) a4Loader.sourceComponent = a4Button;

                if(backend.control4Type === 2) b1Loader.sourceComponent = b1Pot;
                if(backend.control4Type === 1) b1Loader.sourceComponent = b1Button;

                if(backend.control5Type === 2) b2Loader.sourceComponent = b2Pot;
                if(backend.control5Type === 1) b2Loader.sourceComponent = b2Button;

                if(backend.control6Type === 2) b3Loader.sourceComponent = b3Pot;
                if(backend.control6Type === 1) b3Loader.sourceComponent = b3Button;

                if(backend.control7Type === 2) b4Loader.sourceComponent = b4Pot;
                if(backend.control7Type === 1) b4Loader.sourceComponent = b4Button;

                if(backend.control8Type === 2) c1Loader.sourceComponent = c1Pot;
                if(backend.control8Type === 1) c1Loader.sourceComponent = c1Button;

                if(backend.control9Type === 2) c2Loader.sourceComponent = c2Pot;
                if(backend.control9Type === 1) c2Loader.sourceComponent = c2Button;

                if(backend.control10Type === 2) c3Loader.sourceComponent = c3Pot;
                if(backend.control10Type === 1) c3Loader.sourceComponent = c3Button;

                if(backend.control11Type === 2) c4Loader.sourceComponent = c4Pot;
                if(backend.control11Type === 1) c4Loader.sourceComponent = c4Button;

                if(backend.control12Type === 2) d1Loader.sourceComponent = d1Pot;
                if(backend.control12Type === 1) d1Loader.sourceComponent = d1Button;

                if(backend.control13Type === 2) d2Loader.sourceComponent = d2Pot;
                if(backend.control13Type === 1) d2Loader.sourceComponent = d2Button;

                if(backend.control14Type === 2) d3Loader.sourceComponent = d3Pot;
                if(backend.control14Type === 1) d3Loader.sourceComponent = d3Button;

                if(backend.control15Type === 2) d4Loader.sourceComponent = d4Pot;
                if(backend.control15Type === 1) d4Loader.sourceComponent = d4Button;

                a2Loader.sourceComponent = potSelected;
            }
        }
    }

    Component{
        id: a2Button
        Button{
            autoExclusive: false
            //display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: a2Button.down ? "#17a81a" : "transparent"
                Image { source: "content/images/button.svg"}
            }
            onClicked:{
                comp_name.text = qsTr("button a2");
                backend.selectComponent(1);

                if(backend.control0Type === 2) a1Loader.sourceComponent = a1Pot;
                if(backend.control0Type === 1) a1Loader.sourceComponent = a1Button;

                if(backend.control2Type === 2) a3Loader.sourceComponent = a3Pot;
                if(backend.control2Type === 1) a3Loader.sourceComponent = a3Button;

                if(backend.control3Type === 2) a4Loader.sourceComponent = a4Pot;
                if(backend.control3Type === 1) a4Loader.sourceComponent = a4Button;

                if(backend.control4Type === 2) b1Loader.sourceComponent = b1Pot;
                if(backend.control4Type === 1) b1Loader.sourceComponent = b1Button;

                if(backend.control5Type === 2) b2Loader.sourceComponent = b2Pot;
                if(backend.control5Type === 1) b2Loader.sourceComponent = b2Button;

                if(backend.control6Type === 2) b3Loader.sourceComponent = b3Pot;
                if(backend.control6Type === 1) b3Loader.sourceComponent = b3Button;

                if(backend.control7Type === 2) b4Loader.sourceComponent = b4Pot;
                if(backend.control7Type === 1) b4Loader.sourceComponent = b4Button;

                if(backend.control8Type === 2) c1Loader.sourceComponent = c1Pot;
                if(backend.control8Type === 1) c1Loader.sourceComponent = c1Button;

                if(backend.control9Type === 2) c2Loader.sourceComponent = c2Pot;
                if(backend.control9Type === 1) c2Loader.sourceComponent = c2Button;

                if(backend.control10Type === 2) c3Loader.sourceComponent = c3Pot;
                if(backend.control10Type === 1) c3Loader.sourceComponent = c3Button;

                if(backend.control11Type === 2) c4Loader.sourceComponent = c4Pot;
                if(backend.control11Type === 1) c4Loader.sourceComponent = c4Button;

                if(backend.control12Type === 2) d1Loader.sourceComponent = d1Pot;
                if(backend.control12Type === 1) d1Loader.sourceComponent = d1Button;

                if(backend.control13Type === 2) d2Loader.sourceComponent = d2Pot;
                if(backend.control13Type === 1) d2Loader.sourceComponent = d2Button;

                if(backend.control14Type === 2) d3Loader.sourceComponent = d3Pot;
                if(backend.control14Type === 1) d3Loader.sourceComponent = d3Button;

                if(backend.control15Type === 2) d4Loader.sourceComponent = d4Pot;
                if(backend.control15Type === 1) d4Loader.sourceComponent = d4Button;

                a2Loader.sourceComponent = buttonSelected;
            }
        }
    }

    /*Component{
        id: a3Back
        Image { source: "content/images/Knob-w-back.svg"}
    }*/

    Component{
        id: a3Pot
        Button{
            autoExclusive: false
            //display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: a3Pot.down ? "#17a81a" : "transparent"
                Image { source: "content/images/knob.svg" }
            }
            onClicked:{
                comp_name.text = qsTr("knob a3")
                backend.selectComponent(2)

                if(backend.control0Type === 2) a1Loader.sourceComponent = a1Pot;
                if(backend.control0Type === 1) a1Loader.sourceComponent = a1Button;

                if(backend.control1Type === 2) a2Loader.sourceComponent = a2Pot;
                if(backend.control1Type === 1) a2Loader.sourceComponent = a2Button;

                if(backend.control3Type === 2) a4Loader.sourceComponent = a4Pot;
                if(backend.control3Type === 1) a4Loader.sourceComponent = a4Button;

                if(backend.control4Type === 2) b1Loader.sourceComponent = b1Pot;
                if(backend.control4Type === 1) b1Loader.sourceComponent = b1Button;

                if(backend.control5Type === 2) b2Loader.sourceComponent = b2Pot;
                if(backend.control5Type === 1) b2Loader.sourceComponent = b2Button;

                if(backend.control6Type === 2) b3Loader.sourceComponent = b3Pot;
                if(backend.control6Type === 1) b3Loader.sourceComponent = b3Button;

                if(backend.control7Type === 2) b4Loader.sourceComponent = b4Pot;
                if(backend.control7Type === 1) b4Loader.sourceComponent = b4Button;

                if(backend.control8Type === 2) c1Loader.sourceComponent = c1Pot;
                if(backend.control8Type === 1) c1Loader.sourceComponent = c1Button;

                if(backend.control9Type === 2) c2Loader.sourceComponent = c2Pot;
                if(backend.control9Type === 1) c2Loader.sourceComponent = c2Button;

                if(backend.control10Type === 2) c3Loader.sourceComponent = c3Pot;
                if(backend.control10Type === 1) c3Loader.sourceComponent = c3Button;

                if(backend.control11Type === 2) c4Loader.sourceComponent = c4Pot;
                if(backend.control11Type === 1) c4Loader.sourceComponent = c4Button;

                if(backend.control12Type === 2) d1Loader.sourceComponent = d1Pot;
                if(backend.control12Type === 1) d1Loader.sourceComponent = d1Button;

                if(backend.control13Type === 2) d2Loader.sourceComponent = d2Pot;
                if(backend.control13Type === 1) d2Loader.sourceComponent = d2Button;

                if(backend.control14Type === 2) d3Loader.sourceComponent = d3Pot;
                if(backend.control14Type === 1) d3Loader.sourceComponent = d3Button;

                if(backend.control15Type === 2) d4Loader.sourceComponent = d4Pot;
                if(backend.control15Type === 1) d4Loader.sourceComponent = d4Button;

                a3Loader.sourceComponent = potSelected;
            }
        }

    }

    Component{
        id: a3Button
        Button{
            autoExclusive: false
            //display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: a3Button.down ? "#17a81a" : "transparent"
                Image { source: "content/images/button.svg"}
            }
            onClicked:{
                comp_name.text = qsTr("button a3")
                backend.selectComponent(2)

                if(backend.control0Type === 2) a1Loader.sourceComponent = a1Pot;
                if(backend.control0Type === 1) a1Loader.sourceComponent = a1Button;

                if(backend.control1Type === 2) a2Loader.sourceComponent = a2Pot;
                if(backend.control1Type === 1) a2Loader.sourceComponent = a2Button;

                if(backend.control3Type === 2) a4Loader.sourceComponent = a4Pot;
                if(backend.control3Type === 1) a4Loader.sourceComponent = a4Button;

                if(backend.control4Type === 2) b1Loader.sourceComponent = b1Pot;
                if(backend.control4Type === 1) b1Loader.sourceComponent = b1Button;

                if(backend.control5Type === 2) b2Loader.sourceComponent = b2Pot;
                if(backend.control5Type === 1) b2Loader.sourceComponent = b2Button;

                if(backend.control6Type === 2) b3Loader.sourceComponent = b3Pot;
                if(backend.control6Type === 1) b3Loader.sourceComponent = b3Button;

                if(backend.control7Type === 2) b4Loader.sourceComponent = b4Pot;
                if(backend.control7Type === 1) b4Loader.sourceComponent = b4Button;

                if(backend.control8Type === 2) c1Loader.sourceComponent = c1Pot;
                if(backend.control8Type === 1) c1Loader.sourceComponent = c1Button;

                if(backend.control9Type === 2) c2Loader.sourceComponent = c2Pot;
                if(backend.control9Type === 1) c2Loader.sourceComponent = c2Button;

                if(backend.control10Type === 2) c3Loader.sourceComponent = c3Pot;
                if(backend.control10Type === 1) c3Loader.sourceComponent = c3Button;

                if(backend.control11Type === 2) c4Loader.sourceComponent = c4Pot;
                if(backend.control11Type === 1) c4Loader.sourceComponent = c4Button;

                if(backend.control12Type === 2) d1Loader.sourceComponent = d1Pot;
                if(backend.control12Type === 1) d1Loader.sourceComponent = d1Button;

                if(backend.control13Type === 2) d2Loader.sourceComponent = d2Pot;
                if(backend.control13Type === 1) d2Loader.sourceComponent = d2Button;

                if(backend.control14Type === 2) d3Loader.sourceComponent = d3Pot;
                if(backend.control14Type === 1) d3Loader.sourceComponent = d3Button;

                if(backend.control15Type === 2) d4Loader.sourceComponent = d4Pot;
                if(backend.control15Type === 1) d4Loader.sourceComponent = d4Button;

                a3Loader.sourceComponent = buttonSelected;
            }
        }
    }

    /*Component{
        id: a4Back
        Image { source: "content/images/Knob-w-back.svg"}
    }*/

    Component{
        id: a4Pot
        Button{
            autoExclusive: false
            //display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: a4Pot.down ? "#17a81a" : "transparent"
                Image { source: "content/images/knob.svg" }
            }
            onClicked:{
                comp_name.text = qsTr("knob a4")
                backend.selectComponent(3)

                if(backend.control0Type === 2) a1Loader.sourceComponent = a1Pot;
                if(backend.control0Type === 1) a1Loader.sourceComponent = a1Button;

                if(backend.control1Type === 2) a2Loader.sourceComponent = a2Pot;
                if(backend.control1Type === 1) a2Loader.sourceComponent = a2Button;

                if(backend.control2Type === 2) a3Loader.sourceComponent = a3Pot;
                if(backend.control2Type === 1) a3Loader.sourceComponent = a3Button;

                if(backend.control4Type === 2) b1Loader.sourceComponent = b1Pot;
                if(backend.control4Type === 1) b1Loader.sourceComponent = b1Button;

                if(backend.control5Type === 2) b2Loader.sourceComponent = b2Pot;
                if(backend.control5Type === 1) b2Loader.sourceComponent = b2Button;

                if(backend.control6Type === 2) b3Loader.sourceComponent = b3Pot;
                if(backend.control6Type === 1) b3Loader.sourceComponent = b3Button;

                if(backend.control7Type === 2) b4Loader.sourceComponent = b4Pot;
                if(backend.control7Type === 1) b4Loader.sourceComponent = b4Button;

                if(backend.control8Type === 2) c1Loader.sourceComponent = c1Pot;
                if(backend.control8Type === 1) c1Loader.sourceComponent = c1Button;

                if(backend.control9Type === 2) c2Loader.sourceComponent = c2Pot;
                if(backend.control9Type === 1) c2Loader.sourceComponent = c2Button;

                if(backend.control10Type === 2) c3Loader.sourceComponent = c3Pot;
                if(backend.control10Type === 1) c3Loader.sourceComponent = c3Button;

                if(backend.control11Type === 2) c4Loader.sourceComponent = c4Pot;
                if(backend.control11Type === 1) c4Loader.sourceComponent = c4Button;

                if(backend.control12Type === 2) d1Loader.sourceComponent = d1Pot;
                if(backend.control12Type === 1) d1Loader.sourceComponent = d1Button;

                if(backend.control13Type === 2) d2Loader.sourceComponent = d2Pot;
                if(backend.control13Type === 1) d2Loader.sourceComponent = d2Button;

                if(backend.control14Type === 2) d3Loader.sourceComponent = d3Pot;
                if(backend.control14Type === 1) d3Loader.sourceComponent = d3Button;

                if(backend.control15Type === 2) d4Loader.sourceComponent = d4Pot;
                if(backend.control15Type === 1) d4Loader.sourceComponent = d4Button;

                a4Loader.sourceComponent = potSelected;
            }
        }

    }

    Component{
        id: a4Button
        Button{
            autoExclusive: false
            //display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: a4Button.down ? "#17a81a" : "transparent"
                Image { source: "content/images/button.svg"}
            }
            onClicked:{
                comp_name.text = qsTr("button a4")
                backend.selectComponent(3)

                if(backend.control0Type === 2) a1Loader.sourceComponent = a1Pot;
                if(backend.control0Type === 1) a1Loader.sourceComponent = a1Button;

                if(backend.control1Type === 2) a2Loader.sourceComponent = a2Pot;
                if(backend.control1Type === 1) a2Loader.sourceComponent = a2Button;

                if(backend.control2Type === 2) a3Loader.sourceComponent = a3Pot;
                if(backend.control2Type === 1) a3Loader.sourceComponent = a3Button;

                if(backend.control4Type === 2) b1Loader.sourceComponent = b1Pot;
                if(backend.control4Type === 1) b1Loader.sourceComponent = b1Button;

                if(backend.control5Type === 2) b2Loader.sourceComponent = b2Pot;
                if(backend.control5Type === 1) b2Loader.sourceComponent = b2Button;

                if(backend.control6Type === 2) b3Loader.sourceComponent = b3Pot;
                if(backend.control6Type === 1) b3Loader.sourceComponent = b3Button;

                if(backend.control7Type === 2) b4Loader.sourceComponent = b4Pot;
                if(backend.control7Type === 1) b4Loader.sourceComponent = b4Button;

                if(backend.control8Type === 2) c1Loader.sourceComponent = c1Pot;
                if(backend.control8Type === 1) c1Loader.sourceComponent = c1Button;

                if(backend.control9Type === 2) c2Loader.sourceComponent = c2Pot;
                if(backend.control9Type === 1) c2Loader.sourceComponent = c2Button;

                if(backend.control10Type === 2) c3Loader.sourceComponent = c3Pot;
                if(backend.control10Type === 1) c3Loader.sourceComponent = c3Button;

                if(backend.control11Type === 2) c4Loader.sourceComponent = c4Pot;
                if(backend.control11Type === 1) c4Loader.sourceComponent = c4Button;

                if(backend.control12Type === 2) d1Loader.sourceComponent = d1Pot;
                if(backend.control12Type === 1) d1Loader.sourceComponent = d1Button;

                if(backend.control13Type === 2) d2Loader.sourceComponent = d2Pot;
                if(backend.control13Type === 1) d2Loader.sourceComponent = d2Button;

                if(backend.control14Type === 2) d3Loader.sourceComponent = d3Pot;
                if(backend.control14Type === 1) d3Loader.sourceComponent = d3Button;

                if(backend.control15Type === 2) d4Loader.sourceComponent = d4Pot;
                if(backend.control15Type === 1) d4Loader.sourceComponent = d4Button;

                a4Loader.sourceComponent = buttonSelected;
            }
        }
    }

    /*Component{
        id: b1Back
        Image { source: "content/images/Knob-w-back.svg"}
    }*/

    Component{
        id: b1Pot
        Button{
            autoExclusive: false
            //display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: b1Pot.down ? "#17a81a" : "transparent"
                Image { source: "content/images/knob.svg" }
            }
            onClicked:{
                comp_name.text = qsTr("knob b1")
                backend.selectComponent(4)

                if(backend.control0Type === 2) a1Loader.sourceComponent = a1Pot;
                if(backend.control0Type === 1) a1Loader.sourceComponent = a1Button;

                if(backend.control1Type === 2) a2Loader.sourceComponent = a2Pot;
                if(backend.control1Type === 1) a2Loader.sourceComponent = a2Button;

                if(backend.control2Type === 2) a3Loader.sourceComponent = a3Pot;
                if(backend.control2Type === 1) a3Loader.sourceComponent = a3Button;

                if(backend.control3Type === 2) a4Loader.sourceComponent = a4Pot;
                if(backend.control3Type === 1) a4Loader.sourceComponent = a4Button;

                if(backend.control5Type === 2) b2Loader.sourceComponent = b2Pot;
                if(backend.control5Type === 1) b2Loader.sourceComponent = b2Button;

                if(backend.control6Type === 2) b3Loader.sourceComponent = b3Pot;
                if(backend.control6Type === 1) b3Loader.sourceComponent = b3Button;

                if(backend.control7Type === 2) b4Loader.sourceComponent = b4Pot;
                if(backend.control7Type === 1) b4Loader.sourceComponent = b4Button;

                if(backend.control8Type === 2) c1Loader.sourceComponent = c1Pot;
                if(backend.control8Type === 1) c1Loader.sourceComponent = c1Button;

                if(backend.control9Type === 2) c2Loader.sourceComponent = c2Pot;
                if(backend.control9Type === 1) c2Loader.sourceComponent = c2Button;

                if(backend.control10Type === 2) c3Loader.sourceComponent = c3Pot;
                if(backend.control10Type === 1) c3Loader.sourceComponent = c3Button;

                if(backend.control11Type === 2) c4Loader.sourceComponent = c4Pot;
                if(backend.control11Type === 1) c4Loader.sourceComponent = c4Button;

                if(backend.control12Type === 2) d1Loader.sourceComponent = d1Pot;
                if(backend.control12Type === 1) d1Loader.sourceComponent = d1Button;

                if(backend.control13Type === 2) d2Loader.sourceComponent = d2Pot;
                if(backend.control13Type === 1) d2Loader.sourceComponent = d2Button;

                if(backend.control14Type === 2) d3Loader.sourceComponent = d3Pot;
                if(backend.control14Type === 1) d3Loader.sourceComponent = d3Button;

                if(backend.control15Type === 2) d4Loader.sourceComponent = d4Pot;
                if(backend.control15Type === 1) d4Loader.sourceComponent = d4Button;

                b1Loader.sourceComponent = potSelected;
            }
        }

    }

    Component{
        id: b1Button
        Button{
            autoExclusive: false
            //display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: b1Button.down ? "#17a81a" : "transparent"
                Image { source: "content/images/button.svg"}
            }
            onClicked:{
                comp_name.text = qsTr("button b1")
                backend.selectComponent(4)

                if(backend.control0Type === 2) a1Loader.sourceComponent = a1Pot;
                if(backend.control0Type === 1) a1Loader.sourceComponent = a1Button;

                if(backend.control1Type === 2) a2Loader.sourceComponent = a2Pot;
                if(backend.control1Type === 1) a2Loader.sourceComponent = a2Button;

                if(backend.control2Type === 2) a3Loader.sourceComponent = a3Pot;
                if(backend.control2Type === 1) a3Loader.sourceComponent = a3Button;

                if(backend.control3Type === 2) a4Loader.sourceComponent = a4Pot;
                if(backend.control3Type === 1) a4Loader.sourceComponent = a4Button;

                if(backend.control5Type === 2) b2Loader.sourceComponent = b2Pot;
                if(backend.control5Type === 1) b2Loader.sourceComponent = b2Button;

                if(backend.control6Type === 2) b3Loader.sourceComponent = b3Pot;
                if(backend.control6Type === 1) b3Loader.sourceComponent = b3Button;

                if(backend.control7Type === 2) b4Loader.sourceComponent = b4Pot;
                if(backend.control7Type === 1) b4Loader.sourceComponent = b4Button;

                if(backend.control8Type === 2) c1Loader.sourceComponent = c1Pot;
                if(backend.control8Type === 1) c1Loader.sourceComponent = c1Button;

                if(backend.control9Type === 2) c2Loader.sourceComponent = c2Pot;
                if(backend.control9Type === 1) c2Loader.sourceComponent = c2Button;

                if(backend.control10Type === 2) c3Loader.sourceComponent = c3Pot;
                if(backend.control10Type === 1) c3Loader.sourceComponent = c3Button;

                if(backend.control11Type === 2) c4Loader.sourceComponent = c4Pot;
                if(backend.control11Type === 1) c4Loader.sourceComponent = c4Button;

                if(backend.control12Type === 2) d1Loader.sourceComponent = d1Pot;
                if(backend.control12Type === 1) d1Loader.sourceComponent = d1Button;

                if(backend.control13Type === 2) d2Loader.sourceComponent = d2Pot;
                if(backend.control13Type === 1) d2Loader.sourceComponent = d2Button;

                if(backend.control14Type === 2) d3Loader.sourceComponent = d3Pot;
                if(backend.control14Type === 1) d3Loader.sourceComponent = d3Button;

                if(backend.control15Type === 2) d4Loader.sourceComponent = d4Pot;
                if(backend.control15Type === 1) d4Loader.sourceComponent = d4Button;

                b1Loader.sourceComponent = buttonSelected;
            }
        }
    }

    /*Component{
        id: b2Back
        Image { source: "content/images/Knob-w-back.svg"}
    }*/

    Component{
        id: b2Pot
        Button{
            autoExclusive: false
            //display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: b2Pot.down ? "#17a81a" : "transparent"
                Image { source: "content/images/knob.svg" }
            }
            onClicked:{
                comp_name.text = qsTr("knob b2")
                backend.selectComponent(5)

                if(backend.control0Type === 2) a1Loader.sourceComponent = a1Pot;
                if(backend.control0Type === 1) a1Loader.sourceComponent = a1Button;

                if(backend.control1Type === 2) a2Loader.sourceComponent = a2Pot;
                if(backend.control1Type === 1) a2Loader.sourceComponent = a2Button;

                if(backend.control2Type === 2) a3Loader.sourceComponent = a3Pot;
                if(backend.control2Type === 1) a3Loader.sourceComponent = a3Button;

                if(backend.control3Type === 2) a4Loader.sourceComponent = a4Pot;
                if(backend.control3Type === 1) a4Loader.sourceComponent = a4Button;

                if(backend.control4Type === 2) b1Loader.sourceComponent = b1Pot;
                if(backend.control4Type === 1) b1Loader.sourceComponent = b1Button;

                if(backend.control6Type === 2) b3Loader.sourceComponent = b3Pot;
                if(backend.control6Type === 1) b3Loader.sourceComponent = b3Button;

                if(backend.control7Type === 2) b4Loader.sourceComponent = b4Pot;
                if(backend.control7Type === 1) b4Loader.sourceComponent = b4Button;

                if(backend.control8Type === 2) c1Loader.sourceComponent = c1Pot;
                if(backend.control8Type === 1) c1Loader.sourceComponent = c1Button;

                if(backend.control9Type === 2) c2Loader.sourceComponent = c2Pot;
                if(backend.control9Type === 1) c2Loader.sourceComponent = c2Button;

                if(backend.control10Type === 2) c3Loader.sourceComponent = c3Pot;
                if(backend.control10Type === 1) c3Loader.sourceComponent = c3Button;

                if(backend.control11Type === 2) c4Loader.sourceComponent = c4Pot;
                if(backend.control11Type === 1) c4Loader.sourceComponent = c4Button;

                if(backend.control12Type === 2) d1Loader.sourceComponent = d1Pot;
                if(backend.control12Type === 1) d1Loader.sourceComponent = d1Button;

                if(backend.control13Type === 2) d2Loader.sourceComponent = d2Pot;
                if(backend.control13Type === 1) d2Loader.sourceComponent = d2Button;

                if(backend.control14Type === 2) d3Loader.sourceComponent = d3Pot;
                if(backend.control14Type === 1) d3Loader.sourceComponent = d3Button;

                if(backend.control15Type === 2) d4Loader.sourceComponent = d4Pot;
                if(backend.control15Type === 1) d4Loader.sourceComponent = d4Button;

                b2Loader.sourceComponent = potSelected;
            }
        }

    }

    Component{
        id: b2Button
        Button{
            autoExclusive: false
            //display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: b2Button.down ? "#17a81a" : "transparent"
                Image { source: "content/images/button.svg"}
            }
            onClicked:{
                comp_name.text = qsTr("button b2")
                backend.selectComponent(5)

                if(backend.control0Type === 2) a1Loader.sourceComponent = a1Pot;
                if(backend.control0Type === 1) a1Loader.sourceComponent = a1Button;

                if(backend.control1Type === 2) a2Loader.sourceComponent = a2Pot;
                if(backend.control1Type === 1) a2Loader.sourceComponent = a2Button;

                if(backend.control2Type === 2) a3Loader.sourceComponent = a3Pot;
                if(backend.control2Type === 1) a3Loader.sourceComponent = a3Button;

                if(backend.control3Type === 2) a4Loader.sourceComponent = a4Pot;
                if(backend.control3Type === 1) a4Loader.sourceComponent = a4Button;

                if(backend.control4Type === 2) b1Loader.sourceComponent = b1Pot;
                if(backend.control4Type === 1) b1Loader.sourceComponent = b1Button;

                if(backend.control6Type === 2) b3Loader.sourceComponent = b3Pot;
                if(backend.control6Type === 1) b3Loader.sourceComponent = b3Button;

                if(backend.control7Type === 2) b4Loader.sourceComponent = b4Pot;
                if(backend.control7Type === 1) b4Loader.sourceComponent = b4Button;

                if(backend.control8Type === 2) c1Loader.sourceComponent = c1Pot;
                if(backend.control8Type === 1) c1Loader.sourceComponent = c1Button;

                if(backend.control9Type === 2) c2Loader.sourceComponent = c2Pot;
                if(backend.control9Type === 1) c2Loader.sourceComponent = c2Button;

                if(backend.control10Type === 2) c3Loader.sourceComponent = c3Pot;
                if(backend.control10Type === 1) c3Loader.sourceComponent = c3Button;

                if(backend.control11Type === 2) c4Loader.sourceComponent = c4Pot;
                if(backend.control11Type === 1) c4Loader.sourceComponent = c4Button;

                if(backend.control12Type === 2) d1Loader.sourceComponent = d1Pot;
                if(backend.control12Type === 1) d1Loader.sourceComponent = d1Button;

                if(backend.control13Type === 2) d2Loader.sourceComponent = d2Pot;
                if(backend.control13Type === 1) d2Loader.sourceComponent = d2Button;

                if(backend.control14Type === 2) d3Loader.sourceComponent = d3Pot;
                if(backend.control14Type === 1) d3Loader.sourceComponent = d3Button;

                if(backend.control15Type === 2) d4Loader.sourceComponent = d4Pot;
                if(backend.control15Type === 1) d4Loader.sourceComponent = d4Button;

                b2Loader.sourceComponent = buttonSelected;
            }
        }
    }

    /*Component{
        id: b3Back
        Image { source: "content/images/Knob-w-back.svg"}
    }*/

    Component{
        id: b3Pot
        Button{
            autoExclusive: false
            //display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: b3Pot.down ? "#17a81a" : "transparent"
                Image { source: "content/images/knob.svg" }
            }
            onClicked:{
                comp_name.text = qsTr("knob b3")
                backend.selectComponent(6)

                if(backend.control0Type === 2) a1Loader.sourceComponent = a1Pot;
                if(backend.control0Type === 1) a1Loader.sourceComponent = a1Button;

                if(backend.control1Type === 2) a2Loader.sourceComponent = a2Pot;
                if(backend.control1Type === 1) a2Loader.sourceComponent = a2Button;

                if(backend.control2Type === 2) a3Loader.sourceComponent = a3Pot;
                if(backend.control2Type === 1) a3Loader.sourceComponent = a3Button;

                if(backend.control3Type === 2) a4Loader.sourceComponent = a4Pot;
                if(backend.control3Type === 1) a4Loader.sourceComponent = a4Button;

                if(backend.control4Type === 2) b1Loader.sourceComponent = b1Pot;
                if(backend.control4Type === 1) b1Loader.sourceComponent = b1Button;

                if(backend.control5Type === 2) b2Loader.sourceComponent = b2Pot;
                if(backend.control5Type === 1) b2Loader.sourceComponent = b2Button;

                if(backend.control7Type === 2) b4Loader.sourceComponent = b4Pot;
                if(backend.control7Type === 1) b4Loader.sourceComponent = b4Button;

                if(backend.control8Type === 2) c1Loader.sourceComponent = c1Pot;
                if(backend.control8Type === 1) c1Loader.sourceComponent = c1Button;

                if(backend.control9Type === 2) c2Loader.sourceComponent = c2Pot;
                if(backend.control9Type === 1) c2Loader.sourceComponent = c2Button;

                if(backend.control10Type === 2) c3Loader.sourceComponent = c3Pot;
                if(backend.control10Type === 1) c3Loader.sourceComponent = c3Button;

                if(backend.control11Type === 2) c4Loader.sourceComponent = c4Pot;
                if(backend.control11Type === 1) c4Loader.sourceComponent = c4Button;

                if(backend.control12Type === 2) d1Loader.sourceComponent = d1Pot;
                if(backend.control12Type === 1) d1Loader.sourceComponent = d1Button;

                if(backend.control13Type === 2) d2Loader.sourceComponent = d2Pot;
                if(backend.control13Type === 1) d2Loader.sourceComponent = d2Button;

                if(backend.control14Type === 2) d3Loader.sourceComponent = d3Pot;
                if(backend.control14Type === 1) d3Loader.sourceComponent = d3Button;

                if(backend.control15Type === 2) d4Loader.sourceComponent = d4Pot;
                if(backend.control15Type === 1) d4Loader.sourceComponent = d4Button;

                b3Loader.sourceComponent = potSelected;
            }
        }

    }

    Component{
        id: b3Button
        Button{
            autoExclusive: false
            //display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: b3Button.down ? "#17a81a" : "transparent"
                Image { source: "content/images/button.svg"}
            }
            onClicked:{
                comp_name.text = qsTr("button b3")
                backend.selectComponent(6)

                if(backend.control0Type === 2) a1Loader.sourceComponent = a1Pot;
                if(backend.control0Type === 1) a1Loader.sourceComponent = a1Button;

                if(backend.control1Type === 2) a2Loader.sourceComponent = a2Pot;
                if(backend.control1Type === 1) a2Loader.sourceComponent = a2Button;

                if(backend.control2Type === 2) a3Loader.sourceComponent = a3Pot;
                if(backend.control2Type === 1) a3Loader.sourceComponent = a3Button;

                if(backend.control3Type === 2) a4Loader.sourceComponent = a4Pot;
                if(backend.control3Type === 1) a4Loader.sourceComponent = a4Button;

                if(backend.control4Type === 2) b1Loader.sourceComponent = b1Pot;
                if(backend.control4Type === 1) b1Loader.sourceComponent = b1Button;

                if(backend.control5Type === 2) b2Loader.sourceComponent = b2Pot;
                if(backend.control5Type === 1) b2Loader.sourceComponent = b2Button;

                if(backend.control7Type === 2) b4Loader.sourceComponent = b4Pot;
                if(backend.control7Type === 1) b4Loader.sourceComponent = b4Button;

                if(backend.control8Type === 2) c1Loader.sourceComponent = c1Pot;
                if(backend.control8Type === 1) c1Loader.sourceComponent = c1Button;

                if(backend.control9Type === 2) c2Loader.sourceComponent = c2Pot;
                if(backend.control9Type === 1) c2Loader.sourceComponent = c2Button;

                if(backend.control10Type === 2) c3Loader.sourceComponent = c3Pot;
                if(backend.control10Type === 1) c3Loader.sourceComponent = c3Button;

                if(backend.control11Type === 2) c4Loader.sourceComponent = c4Pot;
                if(backend.control11Type === 1) c4Loader.sourceComponent = c4Button;

                if(backend.control12Type === 2) d1Loader.sourceComponent = d1Pot;
                if(backend.control12Type === 1) d1Loader.sourceComponent = d1Button;

                if(backend.control13Type === 2) d2Loader.sourceComponent = d2Pot;
                if(backend.control13Type === 1) d2Loader.sourceComponent = d2Button;

                if(backend.control14Type === 2) d3Loader.sourceComponent = d3Pot;
                if(backend.control14Type === 1) d3Loader.sourceComponent = d3Button;

                if(backend.control15Type === 2) d4Loader.sourceComponent = d4Pot;
                if(backend.control15Type === 1) d4Loader.sourceComponent = d4Button;

                b3Loader.sourceComponent = buttonSelected;
            }
        }
    }

    /*Component{
        id: b4Back
        Image { source: "content/images/Knob-w-back.svg"}
    }*/

    Component{
        id: b4Pot
        Button{
            autoExclusive: false
            //display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: b4Pot.down ? "#17a81a" : "transparent"
                Image { source: "content/images/knob.svg" }
            }
            onClicked:{
                comp_name.text = qsTr("knob b4")
                backend.selectComponent(7)

                if(backend.control0Type === 2) a1Loader.sourceComponent = a1Pot;
                if(backend.control0Type === 1) a1Loader.sourceComponent = a1Button;

                if(backend.control1Type === 2) a2Loader.sourceComponent = a2Pot;
                if(backend.control1Type === 1) a2Loader.sourceComponent = a2Button;

                if(backend.control2Type === 2) a3Loader.sourceComponent = a3Pot;
                if(backend.control2Type === 1) a3Loader.sourceComponent = a3Button;

                if(backend.control3Type === 2) a4Loader.sourceComponent = a4Pot;
                if(backend.control3Type === 1) a4Loader.sourceComponent = a4Button;

                if(backend.control4Type === 2) b1Loader.sourceComponent = b1Pot;
                if(backend.control4Type === 1) b1Loader.sourceComponent = b1Button;

                if(backend.control5Type === 2) b2Loader.sourceComponent = b2Pot;
                if(backend.control5Type === 1) b2Loader.sourceComponent = b2Button;

                if(backend.control6Type === 2) b3Loader.sourceComponent = b3Pot;
                if(backend.control6Type === 1) b3Loader.sourceComponent = b3Button;

                if(backend.control8Type === 2) c1Loader.sourceComponent = c1Pot;
                if(backend.control8Type === 1) c1Loader.sourceComponent = c1Button;

                if(backend.control9Type === 2) c2Loader.sourceComponent = c2Pot;
                if(backend.control9Type === 1) c2Loader.sourceComponent = c2Button;

                if(backend.control10Type === 2) c3Loader.sourceComponent = c3Pot;
                if(backend.control10Type === 1) c3Loader.sourceComponent = c3Button;

                if(backend.control11Type === 2) c4Loader.sourceComponent = c4Pot;
                if(backend.control11Type === 1) c4Loader.sourceComponent = c4Button;

                if(backend.control12Type === 2) d1Loader.sourceComponent = d1Pot;
                if(backend.control12Type === 1) d1Loader.sourceComponent = d1Button;

                if(backend.control13Type === 2) d2Loader.sourceComponent = d2Pot;
                if(backend.control13Type === 1) d2Loader.sourceComponent = d2Button;

                if(backend.control14Type === 2) d3Loader.sourceComponent = d3Pot;
                if(backend.control14Type === 1) d3Loader.sourceComponent = d3Button;

                if(backend.control15Type === 2) d4Loader.sourceComponent = d4Pot;
                if(backend.control15Type === 1) d4Loader.sourceComponent = d4Button;

                b4Loader.sourceComponent = potSelected;
            }
        }

    }

    Component{
        id: b4Button
        Button{
            autoExclusive: false
            //display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: b4Button.down ? "#17a81a" : "transparent"
                Image { source: "content/images/button.svg"}
            }
            onClicked:{
                comp_name.text = qsTr("button b4")
                backend.selectComponent(7)

                if(backend.control0Type === 2) a1Loader.sourceComponent = a1Pot;
                if(backend.control0Type === 1) a1Loader.sourceComponent = a1Button;

                if(backend.control1Type === 2) a2Loader.sourceComponent = a2Pot;
                if(backend.control1Type === 1) a2Loader.sourceComponent = a2Button;

                if(backend.control2Type === 2) a3Loader.sourceComponent = a3Pot;
                if(backend.control2Type === 1) a3Loader.sourceComponent = a3Button;

                if(backend.control3Type === 2) a4Loader.sourceComponent = a4Pot;
                if(backend.control3Type === 1) a4Loader.sourceComponent = a4Button;

                if(backend.control4Type === 2) b1Loader.sourceComponent = b1Pot;
                if(backend.control4Type === 1) b1Loader.sourceComponent = b1Button;

                if(backend.control5Type === 2) b2Loader.sourceComponent = b2Pot;
                if(backend.control5Type === 1) b2Loader.sourceComponent = b2Button;

                if(backend.control6Type === 2) b3Loader.sourceComponent = b3Pot;
                if(backend.control6Type === 1) b3Loader.sourceComponent = b3Button;

                if(backend.control8Type === 2) c1Loader.sourceComponent = c1Pot;
                if(backend.control8Type === 1) c1Loader.sourceComponent = c1Button;

                if(backend.control9Type === 2) c2Loader.sourceComponent = c2Pot;
                if(backend.control9Type === 1) c2Loader.sourceComponent = c2Button;

                if(backend.control10Type === 2) c3Loader.sourceComponent = c3Pot;
                if(backend.control10Type === 1) c3Loader.sourceComponent = c3Button;

                if(backend.control11Type === 2) c4Loader.sourceComponent = c4Pot;
                if(backend.control11Type === 1) c4Loader.sourceComponent = c4Button;

                if(backend.control12Type === 2) d1Loader.sourceComponent = d1Pot;
                if(backend.control12Type === 1) d1Loader.sourceComponent = d1Button;

                if(backend.control13Type === 2) d2Loader.sourceComponent = d2Pot;
                if(backend.control13Type === 1) d2Loader.sourceComponent = d2Button;

                if(backend.control14Type === 2) d3Loader.sourceComponent = d3Pot;
                if(backend.control14Type === 1) d3Loader.sourceComponent = d3Button;

                if(backend.control15Type === 2) d4Loader.sourceComponent = d4Pot;
                if(backend.control15Type === 1) d4Loader.sourceComponent = d4Button;

                b4Loader.sourceComponent = buttonSelected;
            }
        }
    }

    /*Component{
        id: c1Back
        Image { source: "content/images/Knob-w-back.svg"}
    }*/

    Component{
        id: c1Pot
        Button{
            autoExclusive: false
            //display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: c1Pot.down ? "#17a81a" : "transparent"
                Image { source: "content/images/knob.svg" }
            }
            onClicked:{
                comp_name.text = qsTr("knob c1")
                backend.selectComponent(8)

                if(backend.control0Type === 2) a1Loader.sourceComponent = a1Pot;
                if(backend.control0Type === 1) a1Loader.sourceComponent = a1Button;

                if(backend.control1Type === 2) a2Loader.sourceComponent = a2Pot;
                if(backend.control1Type === 1) a2Loader.sourceComponent = a2Button;

                if(backend.control2Type === 2) a3Loader.sourceComponent = a3Pot;
                if(backend.control2Type === 1) a3Loader.sourceComponent = a3Button;

                if(backend.control3Type === 2) a4Loader.sourceComponent = a4Pot;
                if(backend.control3Type === 1) a4Loader.sourceComponent = a4Button;

                if(backend.control4Type === 2) b1Loader.sourceComponent = b1Pot;
                if(backend.control4Type === 1) b1Loader.sourceComponent = b1Button;

                if(backend.control5Type === 2) b2Loader.sourceComponent = b2Pot;
                if(backend.control5Type === 1) b2Loader.sourceComponent = b2Button;

                if(backend.control6Type === 2) b3Loader.sourceComponent = b3Pot;
                if(backend.control6Type === 1) b3Loader.sourceComponent = b3Button;

                if(backend.control7Type === 2) b4Loader.sourceComponent = b4Pot;
                if(backend.control7Type === 1) b4Loader.sourceComponent = b4Button;

                if(backend.control9Type === 2) c2Loader.sourceComponent = c2Pot;
                if(backend.control9Type === 1) c2Loader.sourceComponent = c2Button;

                if(backend.control10Type === 2) c3Loader.sourceComponent = c3Pot;
                if(backend.control10Type === 1) c3Loader.sourceComponent = c3Button;

                if(backend.control11Type === 2) c4Loader.sourceComponent = c4Pot;
                if(backend.control11Type === 1) c4Loader.sourceComponent = c4Button;

                if(backend.control12Type === 2) d1Loader.sourceComponent = d1Pot;
                if(backend.control12Type === 1) d1Loader.sourceComponent = d1Button;

                if(backend.control13Type === 2) d2Loader.sourceComponent = d2Pot;
                if(backend.control13Type === 1) d2Loader.sourceComponent = d2Button;

                if(backend.control14Type === 2) d3Loader.sourceComponent = d3Pot;
                if(backend.control14Type === 1) d3Loader.sourceComponent = d3Button;

                if(backend.control15Type === 2) d4Loader.sourceComponent = d4Pot;
                if(backend.control15Type === 1) d4Loader.sourceComponent = d4Button;

                c1Loader.sourceComponent = potSelected;
            }
        }

    }

    Component{
        id: c1Button
        Button{
            autoExclusive: false
            //display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: c1Button.down ? "#17a81a" : "transparent"
                Image { source: "content/images/button.svg"}
            }
            onClicked:{
                comp_name.text = qsTr("button c1")
                backend.selectComponent(8)

                if(backend.control0Type === 2) a1Loader.sourceComponent = a1Pot;
                if(backend.control0Type === 1) a1Loader.sourceComponent = a1Button;

                if(backend.control1Type === 2) a2Loader.sourceComponent = a2Pot;
                if(backend.control1Type === 1) a2Loader.sourceComponent = a2Button;

                if(backend.control2Type === 2) a3Loader.sourceComponent = a3Pot;
                if(backend.control2Type === 1) a3Loader.sourceComponent = a3Button;

                if(backend.control3Type === 2) a4Loader.sourceComponent = a4Pot;
                if(backend.control3Type === 1) a4Loader.sourceComponent = a4Button;

                if(backend.control4Type === 2) b1Loader.sourceComponent = b1Pot;
                if(backend.control4Type === 1) b1Loader.sourceComponent = b1Button;

                if(backend.control5Type === 2) b2Loader.sourceComponent = b2Pot;
                if(backend.control5Type === 1) b2Loader.sourceComponent = b2Button;

                if(backend.control6Type === 2) b3Loader.sourceComponent = b3Pot;
                if(backend.control6Type === 1) b3Loader.sourceComponent = b3Button;

                if(backend.control7Type === 2) b4Loader.sourceComponent = b4Pot;
                if(backend.control7Type === 1) b4Loader.sourceComponent = b4Button;

                if(backend.control9Type === 2) c2Loader.sourceComponent = c2Pot;
                if(backend.control9Type === 1) c2Loader.sourceComponent = c2Button;

                if(backend.control10Type === 2) c3Loader.sourceComponent = c3Pot;
                if(backend.control10Type === 1) c3Loader.sourceComponent = c3Button;

                if(backend.control11Type === 2) c4Loader.sourceComponent = c4Pot;
                if(backend.control11Type === 1) c4Loader.sourceComponent = c4Button;

                if(backend.control12Type === 2) d1Loader.sourceComponent = d1Pot;
                if(backend.control12Type === 1) d1Loader.sourceComponent = d1Button;

                if(backend.control13Type === 2) d2Loader.sourceComponent = d2Pot;
                if(backend.control13Type === 1) d2Loader.sourceComponent = d2Button;

                if(backend.control14Type === 2) d3Loader.sourceComponent = d3Pot;
                if(backend.control14Type === 1) d3Loader.sourceComponent = d3Button;

                if(backend.control15Type === 2) d4Loader.sourceComponent = d4Pot;
                if(backend.control15Type === 1) d4Loader.sourceComponent = d4Button;

                c1Loader.sourceComponent = buttonSelected;
            }
        }
    }

    /*Component{
        id: c2Back
        Image { source: "content/images/Knob-w-back.svg"}
    }*/

    Component{
        id: c2Pot
        Button{
            autoExclusive: false
            //display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: c2Pot.down ? "#17a81a" : "transparent"
                Image { source: "content/images/knob.svg" }
            }
            onClicked:{
                comp_name.text = qsTr("knob c2")
                backend.selectComponent(9)

                if(backend.control0Type === 2) a1Loader.sourceComponent = a1Pot;
                if(backend.control0Type === 1) a1Loader.sourceComponent = a1Button;

                if(backend.control1Type === 2) a2Loader.sourceComponent = a2Pot;
                if(backend.control1Type === 1) a2Loader.sourceComponent = a2Button;

                if(backend.control2Type === 2) a3Loader.sourceComponent = a3Pot;
                if(backend.control2Type === 1) a3Loader.sourceComponent = a3Button;

                if(backend.control3Type === 2) a4Loader.sourceComponent = a4Pot;
                if(backend.control3Type === 1) a4Loader.sourceComponent = a4Button;

                if(backend.control4Type === 2) b1Loader.sourceComponent = b1Pot;
                if(backend.control4Type === 1) b1Loader.sourceComponent = b1Button;

                if(backend.control5Type === 2) b2Loader.sourceComponent = b2Pot;
                if(backend.control5Type === 1) b2Loader.sourceComponent = b2Button;

                if(backend.control6Type === 2) b3Loader.sourceComponent = b3Pot;
                if(backend.control6Type === 1) b3Loader.sourceComponent = b3Button;

                if(backend.control7Type === 2) b4Loader.sourceComponent = b4Pot;
                if(backend.control7Type === 1) b4Loader.sourceComponent = b4Button;

                if(backend.control8Type === 2) c1Loader.sourceComponent = c1Pot;
                if(backend.control8Type === 1) c1Loader.sourceComponent = c1Button;

                if(backend.control10Type === 2) c3Loader.sourceComponent = c3Pot;
                if(backend.control10Type === 1) c3Loader.sourceComponent = c3Button;

                if(backend.control11Type === 2) c4Loader.sourceComponent = c4Pot;
                if(backend.control11Type === 1) c4Loader.sourceComponent = c4Button;

                if(backend.control12Type === 2) d1Loader.sourceComponent = d1Pot;
                if(backend.control12Type === 1) d1Loader.sourceComponent = d1Button;

                if(backend.control13Type === 2) d2Loader.sourceComponent = d2Pot;
                if(backend.control13Type === 1) d2Loader.sourceComponent = d2Button;

                if(backend.control14Type === 2) d3Loader.sourceComponent = d3Pot;
                if(backend.control14Type === 1) d3Loader.sourceComponent = d3Button;

                if(backend.control15Type === 2) d4Loader.sourceComponent = d4Pot;
                if(backend.control15Type === 1) d4Loader.sourceComponent = d4Button;

                c2Loader.sourceComponent = potSelected;
            }
        }

    }

    Component{
        id: c2Button
        Button{
            autoExclusive: false
            //display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: c1Button.down ? "#17a81a" : "transparent"
                Image { source: "content/images/button.svg"}
            }
            onClicked:{
                comp_name.text = qsTr("button c2")
                backend.selectComponent(9)

                if(backend.control0Type === 2) a1Loader.sourceComponent = a1Pot;
                if(backend.control0Type === 1) a1Loader.sourceComponent = a1Button;

                if(backend.control1Type === 2) a2Loader.sourceComponent = a2Pot;
                if(backend.control1Type === 1) a2Loader.sourceComponent = a2Button;

                if(backend.control2Type === 2) a3Loader.sourceComponent = a3Pot;
                if(backend.control2Type === 1) a3Loader.sourceComponent = a3Button;

                if(backend.control3Type === 2) a4Loader.sourceComponent = a4Pot;
                if(backend.control3Type === 1) a4Loader.sourceComponent = a4Button;

                if(backend.control4Type === 2) b1Loader.sourceComponent = b1Pot;
                if(backend.control4Type === 1) b1Loader.sourceComponent = b1Button;

                if(backend.control5Type === 2) b2Loader.sourceComponent = b2Pot;
                if(backend.control5Type === 1) b2Loader.sourceComponent = b2Button;

                if(backend.control6Type === 2) b3Loader.sourceComponent = b3Pot;
                if(backend.control6Type === 1) b3Loader.sourceComponent = b3Button;

                if(backend.control7Type === 2) b4Loader.sourceComponent = b4Pot;
                if(backend.control7Type === 1) b4Loader.sourceComponent = b4Button;

                if(backend.control8Type === 2) c1Loader.sourceComponent = c1Pot;
                if(backend.control8Type === 1) c1Loader.sourceComponent = c1Button;

                if(backend.control10Type === 2) c3Loader.sourceComponent = c3Pot;
                if(backend.control10Type === 1) c3Loader.sourceComponent = c3Button;

                if(backend.control11Type === 2) c4Loader.sourceComponent = c4Pot;
                if(backend.control11Type === 1) c4Loader.sourceComponent = c4Button;

                if(backend.control12Type === 2) d1Loader.sourceComponent = d1Pot;
                if(backend.control12Type === 1) d1Loader.sourceComponent = d1Button;

                if(backend.control13Type === 2) d2Loader.sourceComponent = d2Pot;
                if(backend.control13Type === 1) d2Loader.sourceComponent = d2Button;

                if(backend.control14Type === 2) d3Loader.sourceComponent = d3Pot;
                if(backend.control14Type === 1) d3Loader.sourceComponent = d3Button;

                if(backend.control15Type === 2) d4Loader.sourceComponent = d4Pot;
                if(backend.control15Type === 1) d4Loader.sourceComponent = d4Button;

                c2Loader.sourceComponent = buttonSelected;
            }
        }
    }

    /*Component{
        id: c3Back
        Image { source: "content/images/Knob-w-back.svg"}
    }*/

    Component{
        id: c3Pot
        Button{
            autoExclusive: false
            //display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: c3Pot.down ? "#17a81a" : "transparent"
                Image { source: "content/images/knob.svg" }
            }
            onClicked:{
                comp_name.text = qsTr("knob c3")
                backend.selectComponent(10)

                if(backend.control0Type === 2) a1Loader.sourceComponent = a1Pot;
                if(backend.control0Type === 1) a1Loader.sourceComponent = a1Button;

                if(backend.control1Type === 2) a2Loader.sourceComponent = a2Pot;
                if(backend.control1Type === 1) a2Loader.sourceComponent = a2Button;

                if(backend.control2Type === 2) a3Loader.sourceComponent = a3Pot;
                if(backend.control2Type === 1) a3Loader.sourceComponent = a3Button;

                if(backend.control3Type === 2) a4Loader.sourceComponent = a4Pot;
                if(backend.control3Type === 1) a4Loader.sourceComponent = a4Button;

                if(backend.control4Type === 2) b1Loader.sourceComponent = b1Pot;
                if(backend.control4Type === 1) b1Loader.sourceComponent = b1Button;

                if(backend.control5Type === 2) b2Loader.sourceComponent = b2Pot;
                if(backend.control5Type === 1) b2Loader.sourceComponent = b2Button;

                if(backend.control6Type === 2) b3Loader.sourceComponent = b3Pot;
                if(backend.control6Type === 1) b3Loader.sourceComponent = b3Button;

                if(backend.control7Type === 2) b4Loader.sourceComponent = b4Pot;
                if(backend.control7Type === 1) b4Loader.sourceComponent = b4Button;

                if(backend.control8Type === 2) c1Loader.sourceComponent = c1Pot;
                if(backend.control8Type === 1) c1Loader.sourceComponent = c1Button;

                if(backend.control9Type === 2) c2Loader.sourceComponent = c2Pot;
                if(backend.control9Type === 1) c2Loader.sourceComponent = c2Button;

                if(backend.control11Type === 2) c4Loader.sourceComponent = c4Pot;
                if(backend.control11Type === 1) c4Loader.sourceComponent = c4Button;

                if(backend.control12Type === 2) d1Loader.sourceComponent = d1Pot;
                if(backend.control12Type === 1) d1Loader.sourceComponent = d1Button;

                if(backend.control13Type === 2) d2Loader.sourceComponent = d2Pot;
                if(backend.control13Type === 1) d2Loader.sourceComponent = d2Button;

                if(backend.control14Type === 2) d3Loader.sourceComponent = d3Pot;
                if(backend.control14Type === 1) d3Loader.sourceComponent = d3Button;

                if(backend.control15Type === 2) d4Loader.sourceComponent = d4Pot;
                if(backend.control15Type === 1) d4Loader.sourceComponent = d4Button;

                c3Loader.sourceComponent = potSelected;
            }
        }

    }

    Component{
        id: c3Button
        Button{
            autoExclusive: false
            //display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: c3Button.down ? "#17a81a" : "transparent"
                Image { source: "content/images/button.svg"}
            }
            onClicked:{
                comp_name.text = qsTr("button c3")
                backend.selectComponent(10)

                if(backend.control0Type === 2) a1Loader.sourceComponent = a1Pot;
                if(backend.control0Type === 1) a1Loader.sourceComponent = a1Button;

                if(backend.control1Type === 2) a2Loader.sourceComponent = a2Pot;
                if(backend.control1Type === 1) a2Loader.sourceComponent = a2Button;

                if(backend.control2Type === 2) a3Loader.sourceComponent = a3Pot;
                if(backend.control2Type === 1) a3Loader.sourceComponent = a3Button;

                if(backend.control3Type === 2) a4Loader.sourceComponent = a4Pot;
                if(backend.control3Type === 1) a4Loader.sourceComponent = a4Button;

                if(backend.control4Type === 2) b1Loader.sourceComponent = b1Pot;
                if(backend.control4Type === 1) b1Loader.sourceComponent = b1Button;

                if(backend.control5Type === 2) b2Loader.sourceComponent = b2Pot;
                if(backend.control5Type === 1) b2Loader.sourceComponent = b2Button;

                if(backend.control6Type === 2) b3Loader.sourceComponent = b3Pot;
                if(backend.control6Type === 1) b3Loader.sourceComponent = b3Button;

                if(backend.control7Type === 2) b4Loader.sourceComponent = b4Pot;
                if(backend.control7Type === 1) b4Loader.sourceComponent = b4Button;

                if(backend.control8Type === 2) c1Loader.sourceComponent = c1Pot;
                if(backend.control8Type === 1) c1Loader.sourceComponent = c1Button;

                if(backend.control9Type === 2) c2Loader.sourceComponent = c2Pot;
                if(backend.control9Type === 1) c2Loader.sourceComponent = c2Button;

                if(backend.control10Type === 2) c4Loader.sourceComponent = c4Pot;
                if(backend.control10Type === 1) c4Loader.sourceComponent = c4Button;

                if(backend.control12Type === 2) d1Loader.sourceComponent = d1Pot;
                if(backend.control12Type === 1) d1Loader.sourceComponent = d1Button;

                if(backend.control13Type === 2) d2Loader.sourceComponent = d2Pot;
                if(backend.control13Type === 1) d2Loader.sourceComponent = d2Button;

                if(backend.control14Type === 2) d3Loader.sourceComponent = d3Pot;
                if(backend.control14Type === 1) d3Loader.sourceComponent = d3Button;

                if(backend.control15Type === 2) d4Loader.sourceComponent = d4Pot;
                if(backend.control15Type === 1) d4Loader.sourceComponent = d4Button;

                c3Loader.sourceComponent = buttonSelected;
            }
        }
    }

    /*Component{
        id: c4Back
        Image { source: "content/images/Knob-w-back.svg"}
    }*/

    Component{
        id: c4Pot
        Button{
            autoExclusive: false
            //display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: c4Pot.down ? "#17a81a" : "transparent"
                Image { source: "content/images/knob.svg" }
            }
            onClicked:{
                comp_name.text = qsTr("knob c4")
                backend.selectComponent(11)

                if(backend.control0Type === 2) a1Loader.sourceComponent = a1Pot;
                if(backend.control0Type === 1) a1Loader.sourceComponent = a1Button;

                if(backend.control1Type === 2) a2Loader.sourceComponent = a2Pot;
                if(backend.control1Type === 1) a2Loader.sourceComponent = a2Button;

                if(backend.control2Type === 2) a3Loader.sourceComponent = a3Pot;
                if(backend.control2Type === 1) a3Loader.sourceComponent = a3Button;

                if(backend.control3Type === 2) a4Loader.sourceComponent = a4Pot;
                if(backend.control3Type === 1) a4Loader.sourceComponent = a4Button;

                if(backend.control4Type === 2) b1Loader.sourceComponent = b1Pot;
                if(backend.control4Type === 1) b1Loader.sourceComponent = b1Button;

                if(backend.control5Type === 2) b2Loader.sourceComponent = b2Pot;
                if(backend.control5Type === 1) b2Loader.sourceComponent = b2Button;

                if(backend.control6Type === 2) b3Loader.sourceComponent = b3Pot;
                if(backend.control6Type === 1) b3Loader.sourceComponent = b3Button;

                if(backend.control7Type === 2) b4Loader.sourceComponent = b4Pot;
                if(backend.control7Type === 1) b4Loader.sourceComponent = b4Button;

                if(backend.control8Type === 2) c1Loader.sourceComponent = c1Pot;
                if(backend.control8Type === 1) c1Loader.sourceComponent = c1Button;

                if(backend.control9Type === 2) c2Loader.sourceComponent = c2Pot;
                if(backend.control9Type === 1) c2Loader.sourceComponent = c2Button;

                if(backend.control10Type === 2) c3Loader.sourceComponent = c3Pot;
                if(backend.control10Type === 1) c3Loader.sourceComponent = c3Button;

                if(backend.control12Type === 2) d1Loader.sourceComponent = d1Pot;
                if(backend.control12Type === 1) d1Loader.sourceComponent = d1Button;

                if(backend.control13Type === 2) d2Loader.sourceComponent = d2Pot;
                if(backend.control13Type === 1) d2Loader.sourceComponent = d2Button;

                if(backend.control14Type === 2) d3Loader.sourceComponent = d3Pot;
                if(backend.control14Type === 1) d3Loader.sourceComponent = d3Button;

                if(backend.control15Type === 2) d4Loader.sourceComponent = d4Pot;
                if(backend.control15Type === 1) d4Loader.sourceComponent = d4Button;

                c4Loader.sourceComponent = potSelected;
            }
        }

    }

    Component{
        id: c4Button
        Button{
            autoExclusive: false
            //display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: c4Button.down ? "#17a81a" : "transparent"
                Image { source: "content/images/button.svg"}
            }
            onClicked:{
                comp_name.text = qsTr("button c4")
                backend.selectComponent(11)

                if(backend.control0Type === 2) a1Loader.sourceComponent = a1Pot;
                if(backend.control0Type === 1) a1Loader.sourceComponent = a1Button;

                if(backend.control1Type === 2) a2Loader.sourceComponent = a2Pot;
                if(backend.control1Type === 1) a2Loader.sourceComponent = a2Button;

                if(backend.control2Type === 2) a3Loader.sourceComponent = a3Pot;
                if(backend.control2Type === 1) a3Loader.sourceComponent = a3Button;

                if(backend.control3Type === 2) a4Loader.sourceComponent = a4Pot;
                if(backend.control3Type === 1) a4Loader.sourceComponent = a4Button;

                if(backend.control4Type === 2) b1Loader.sourceComponent = b1Pot;
                if(backend.control4Type === 1) b1Loader.sourceComponent = b1Button;

                if(backend.control5Type === 2) b2Loader.sourceComponent = b2Pot;
                if(backend.control5Type === 1) b2Loader.sourceComponent = b2Button;

                if(backend.control6Type === 2) b3Loader.sourceComponent = b3Pot;
                if(backend.control6Type === 1) b3Loader.sourceComponent = b3Button;

                if(backend.control7Type === 2) b4Loader.sourceComponent = b4Pot;
                if(backend.control7Type === 1) b4Loader.sourceComponent = b4Button;

                if(backend.control8Type === 2) c1Loader.sourceComponent = c1Pot;
                if(backend.control8Type === 1) c1Loader.sourceComponent = c1Button;

                if(backend.control9Type === 2) c2Loader.sourceComponent = c2Pot;
                if(backend.control9Type === 1) c2Loader.sourceComponent = c2Button;

                if(backend.control10Type === 2) c3Loader.sourceComponent = c3Pot;
                if(backend.control10Type === 1) c3Loader.sourceComponent = c3Button;

                if(backend.control12Type === 2) d1Loader.sourceComponent = d1Pot;
                if(backend.control12Type === 1) d1Loader.sourceComponent = d1Button;

                if(backend.control13Type === 2) d2Loader.sourceComponent = d2Pot;
                if(backend.control13Type === 1) d2Loader.sourceComponent = d2Button;

                if(backend.control14Type === 2) d3Loader.sourceComponent = d3Pot;
                if(backend.control14Type === 1) d3Loader.sourceComponent = d3Button;

                if(backend.control15Type === 2) d4Loader.sourceComponent = d4Pot;
                if(backend.control15Type === 1) d4Loader.sourceComponent = d4Button;

                c4Loader.sourceComponent = buttonSelected;
            }
        }
    }

    /*Component{
        id: d1Back
        Image { source: "content/images/Knob-w-back.svg"}
    }*/

    Component{
        id: d1Pot
        Button{
            autoExclusive: false
            //display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: d1Pot.down ? "#17a81a" : "transparent"
                Image { source: "content/images/knob.svg" }
            }
            onClicked:{
                comp_name.text = qsTr("knob d1")
                backend.selectComponent(12)

                if(backend.control0Type === 2) a1Loader.sourceComponent = a1Pot;
                if(backend.control0Type === 1) a1Loader.sourceComponent = a1Button;

                if(backend.control1Type === 2) a2Loader.sourceComponent = a2Pot;
                if(backend.control1Type === 1) a2Loader.sourceComponent = a2Button;

                if(backend.control2Type === 2) a3Loader.sourceComponent = a3Pot;
                if(backend.control2Type === 1) a3Loader.sourceComponent = a3Button;

                if(backend.control3Type === 2) a4Loader.sourceComponent = a4Pot;
                if(backend.control3Type === 1) a4Loader.sourceComponent = a4Button;

                if(backend.control4Type === 2) b1Loader.sourceComponent = b1Pot;
                if(backend.control4Type === 1) b1Loader.sourceComponent = b1Button;

                if(backend.control5Type === 2) b2Loader.sourceComponent = b2Pot;
                if(backend.control5Type === 1) b2Loader.sourceComponent = b2Button;

                if(backend.control6Type === 2) b3Loader.sourceComponent = b3Pot;
                if(backend.control6Type === 1) b3Loader.sourceComponent = b3Button;

                if(backend.control7Type === 2) b4Loader.sourceComponent = b4Pot;
                if(backend.control7Type === 1) b4Loader.sourceComponent = b4Button;

                if(backend.control8Type === 2) c1Loader.sourceComponent = c1Pot;
                if(backend.control8Type === 1) c1Loader.sourceComponent = c1Button;

                if(backend.control9Type === 2) c2Loader.sourceComponent = c2Pot;
                if(backend.control9Type === 1) c2Loader.sourceComponent = c2Button;

                if(backend.control10Type === 2) c3Loader.sourceComponent = c3Pot;
                if(backend.control10Type === 1) c3Loader.sourceComponent = c3Button;

                if(backend.control11Type === 2) c4Loader.sourceComponent = c4Pot;
                if(backend.control11Type === 1) c4Loader.sourceComponent = c4Button;

                if(backend.control13Type === 2) d2Loader.sourceComponent = d2Pot;
                if(backend.control13Type === 1) d2Loader.sourceComponent = d2Button;

                if(backend.control14Type === 2) d3Loader.sourceComponent = d3Pot;
                if(backend.control14Type === 1) d3Loader.sourceComponent = d3Button;

                if(backend.control15Type === 2) d4Loader.sourceComponent = d4Pot;
                if(backend.control15Type === 1) d4Loader.sourceComponent = d4Button;

                d1Loader.sourceComponent = potSelected;
            }
        }

    }

    Component{
        id: d1Button
        Button{
            autoExclusive: false
            //display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: c1Button.down ? "#17a81a" : "transparent"
                Image { source: "content/images/button.svg"}
            }
            onClicked:{
                comp_name.text = qsTr("button d1")
                backend.selectComponent(12)

                if(backend.control0Type === 2) a1Loader.sourceComponent = a1Pot;
                if(backend.control0Type === 1) a1Loader.sourceComponent = a1Button;

                if(backend.control1Type === 2) a2Loader.sourceComponent = a2Pot;
                if(backend.control1Type === 1) a2Loader.sourceComponent = a2Button;

                if(backend.control2Type === 2) a3Loader.sourceComponent = a3Pot;
                if(backend.control2Type === 1) a3Loader.sourceComponent = a3Button;

                if(backend.control3Type === 2) a4Loader.sourceComponent = a4Pot;
                if(backend.control3Type === 1) a4Loader.sourceComponent = a4Button;

                if(backend.control4Type === 2) b1Loader.sourceComponent = b1Pot;
                if(backend.control4Type === 1) b1Loader.sourceComponent = b1Button;

                if(backend.control5Type === 2) b2Loader.sourceComponent = b2Pot;
                if(backend.control5Type === 1) b2Loader.sourceComponent = b2Button;

                if(backend.control6Type === 2) b3Loader.sourceComponent = b3Pot;
                if(backend.control6Type === 1) b3Loader.sourceComponent = b3Button;

                if(backend.control7Type === 2) b4Loader.sourceComponent = b4Pot;
                if(backend.control7Type === 1) b4Loader.sourceComponent = b4Button;

                if(backend.control8Type === 2) c1Loader.sourceComponent = c1Pot;
                if(backend.control8Type === 1) c1Loader.sourceComponent = c1Button;

                if(backend.control9Type === 2) c2Loader.sourceComponent = c2Pot;
                if(backend.control9Type === 1) c2Loader.sourceComponent = c2Button;

                if(backend.control10Type === 2) c3Loader.sourceComponent = c3Pot;
                if(backend.control10Type === 1) c3Loader.sourceComponent = c3Button;

                if(backend.control11Type === 2) c4Loader.sourceComponent = c4Pot;
                if(backend.control11Type === 1) c4Loader.sourceComponent = c4Button;

                if(backend.control13Type === 2) d2Loader.sourceComponent = d2Pot;
                if(backend.control13Type === 1) d2Loader.sourceComponent = d2Button;

                if(backend.control14Type === 2) d3Loader.sourceComponent = d3Pot;
                if(backend.control14Type === 1) d3Loader.sourceComponent = d3Button;

                if(backend.control15Type === 2) d4Loader.sourceComponent = d4Pot;
                if(backend.control15Type === 1) d4Loader.sourceComponent = d4Button;

                d1Loader.sourceComponent = buttonSelected;
            }
        }
    }

    /*Component{
        id: d2Back
        Image { source: "content/images/Knob-w-back.svg"}
    }*/

    Component{
        id: d2Pot
        Button{
            autoExclusive: false
            //display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: d2Pot.down ? "#17a81a" : "transparent"
                Image { source: "content/images/knob.svg" }
            }
            onClicked:{
                comp_name.text = qsTr("knob d2")
                backend.selectComponent(13)

                if(backend.control0Type === 2) a1Loader.sourceComponent = a1Pot;
                if(backend.control0Type === 1) a1Loader.sourceComponent = a1Button;

                if(backend.control1Type === 2) a2Loader.sourceComponent = a2Pot;
                if(backend.control1Type === 1) a2Loader.sourceComponent = a2Button;

                if(backend.control2Type === 2) a3Loader.sourceComponent = a3Pot;
                if(backend.control2Type === 1) a3Loader.sourceComponent = a3Button;

                if(backend.control3Type === 2) a4Loader.sourceComponent = a4Pot;
                if(backend.control3Type === 1) a4Loader.sourceComponent = a4Button;

                if(backend.control4Type === 2) b1Loader.sourceComponent = b1Pot;
                if(backend.control4Type === 1) b1Loader.sourceComponent = b1Button;

                if(backend.control5Type === 2) b2Loader.sourceComponent = b2Pot;
                if(backend.control5Type === 1) b2Loader.sourceComponent = b2Button;

                if(backend.control6Type === 2) b3Loader.sourceComponent = b3Pot;
                if(backend.control6Type === 1) b3Loader.sourceComponent = b3Button;

                if(backend.control7Type === 2) b4Loader.sourceComponent = b4Pot;
                if(backend.control7Type === 1) b4Loader.sourceComponent = b4Button;

                if(backend.control8Type === 2) c1Loader.sourceComponent = c1Pot;
                if(backend.control8Type === 1) c1Loader.sourceComponent = c1Button;

                if(backend.control9Type === 2) c2Loader.sourceComponent = c2Pot;
                if(backend.control9Type === 1) c2Loader.sourceComponent = c2Button;

                if(backend.control10Type === 2) c3Loader.sourceComponent = c3Pot;
                if(backend.control10Type === 1) c3Loader.sourceComponent = c3Button;

                if(backend.control11Type === 2) c4Loader.sourceComponent = c4Pot;
                if(backend.control11Type === 1) c4Loader.sourceComponent = c4Button;

                if(backend.control12Type === 2) d1Loader.sourceComponent = d1Pot;
                if(backend.control12Type === 1) d1Loader.sourceComponent = d1Button;

                if(backend.control14Type === 2) d3Loader.sourceComponent = d3Pot;
                if(backend.control14Type === 1) d3Loader.sourceComponent = d3Button;

                if(backend.control15Type === 2) d4Loader.sourceComponent = d4Pot;
                if(backend.control15Type === 1) d4Loader.sourceComponent = d4Button;

                d2Loader.sourceComponent = potSelected;
            }
        }

    }

    Component{
        id: d2Button
        Button{
            autoExclusive: false
            //display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: d2Button.down ? "#17a81a" : "transparent"
                Image { source: "content/images/button.svg"}
            }
            onClicked:{
                comp_name.text = qsTr("button d2")
                backend.selectComponent(13)

                if(backend.control0Type === 2) a1Loader.sourceComponent = a1Pot;
                if(backend.control0Type === 1) a1Loader.sourceComponent = a1Button;

                if(backend.control1Type === 2) a2Loader.sourceComponent = a2Pot;
                if(backend.control1Type === 1) a2Loader.sourceComponent = a2Button;

                if(backend.control2Type === 2) a3Loader.sourceComponent = a3Pot;
                if(backend.control2Type === 1) a3Loader.sourceComponent = a3Button;

                if(backend.control3Type === 2) a4Loader.sourceComponent = a4Pot;
                if(backend.control3Type === 1) a4Loader.sourceComponent = a4Button;

                if(backend.control4Type === 2) b1Loader.sourceComponent = b1Pot;
                if(backend.control4Type === 1) b1Loader.sourceComponent = b1Button;

                if(backend.control5Type === 2) b2Loader.sourceComponent = b2Pot;
                if(backend.control5Type === 1) b2Loader.sourceComponent = b2Button;

                if(backend.control6Type === 2) b3Loader.sourceComponent = b3Pot;
                if(backend.control6Type === 1) b3Loader.sourceComponent = b3Button;

                if(backend.control7Type === 2) b4Loader.sourceComponent = b4Pot;
                if(backend.control7Type === 1) b4Loader.sourceComponent = b4Button;

                if(backend.control8Type === 2) c1Loader.sourceComponent = c1Pot;
                if(backend.control8Type === 1) c1Loader.sourceComponent = c1Button;

                if(backend.control9Type === 2) c2Loader.sourceComponent = c2Pot;
                if(backend.control9Type === 1) c2Loader.sourceComponent = c2Button;

                if(backend.control10Type === 2) c3Loader.sourceComponent = c3Pot;
                if(backend.control10Type === 1) c3Loader.sourceComponent = c3Button;

                if(backend.control11Type === 2) c4Loader.sourceComponent = c4Pot;
                if(backend.control11Type === 1) c4Loader.sourceComponent = c4Button;

                if(backend.control12Type === 2) d1Loader.sourceComponent = d1Pot;
                if(backend.control12Type === 1) d1Loader.sourceComponent = d1Button;

                if(backend.control14Type === 2) d3Loader.sourceComponent = d3Pot;
                if(backend.control14Type === 1) d3Loader.sourceComponent = d3Button;

                if(backend.control15Type === 2) d4Loader.sourceComponent = d4Pot;
                if(backend.control15Type === 1) d4Loader.sourceComponent = d4Button;

                d2Loader.sourceComponent = buttonSelected;
            }
        }
    }

    /*Component{
        id: d3Back
        Image { source: "content/images/Knob-w-back.svg"}
    }*/

    Component{
        id: d3Pot
        Button{
            autoExclusive: false
            //display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: d3Pot.down ? "#17a81a" : "transparent"
                Image { source: "content/images/knob.svg" }
            }
            onClicked:{
                comp_name.text = qsTr("knob d3")
                backend.selectComponent(14)

                if(backend.control0Type === 2) a1Loader.sourceComponent = a1Pot;
                if(backend.control0Type === 1) a1Loader.sourceComponent = a1Button;

                if(backend.control1Type === 2) a2Loader.sourceComponent = a2Pot;
                if(backend.control1Type === 1) a2Loader.sourceComponent = a2Button;

                if(backend.control2Type === 2) a3Loader.sourceComponent = a3Pot;
                if(backend.control2Type === 1) a3Loader.sourceComponent = a3Button;

                if(backend.control3Type === 2) a4Loader.sourceComponent = a4Pot;
                if(backend.control3Type === 1) a4Loader.sourceComponent = a4Button;

                if(backend.control4Type === 2) b1Loader.sourceComponent = b1Pot;
                if(backend.control4Type === 1) b1Loader.sourceComponent = b1Button;

                if(backend.control5Type === 2) b2Loader.sourceComponent = b2Pot;
                if(backend.control5Type === 1) b2Loader.sourceComponent = b2Button;

                if(backend.control6Type === 2) b3Loader.sourceComponent = b3Pot;
                if(backend.control6Type === 1) b3Loader.sourceComponent = b3Button;

                if(backend.control7Type === 2) b4Loader.sourceComponent = b4Pot;
                if(backend.control7Type === 1) b4Loader.sourceComponent = b4Button;

                if(backend.control8Type === 2) c1Loader.sourceComponent = c1Pot;
                if(backend.control8Type === 1) c1Loader.sourceComponent = c1Button;

                if(backend.control9Type === 2) c2Loader.sourceComponent = c2Pot;
                if(backend.control9Type === 1) c2Loader.sourceComponent = c2Button;

                if(backend.control10Type === 2) c3Loader.sourceComponent = c3Pot;
                if(backend.control10Type === 1) c3Loader.sourceComponent = c3Button;

                if(backend.control11Type === 2) c4Loader.sourceComponent = c4Pot;
                if(backend.control11Type === 1) c4Loader.sourceComponent = c4Button;

                if(backend.control12Type === 2) d1Loader.sourceComponent = d1Pot;
                if(backend.control12Type === 1) d1Loader.sourceComponent = d1Button;

                if(backend.control13Type === 2) d2Loader.sourceComponent = d2Pot;
                if(backend.control13Type === 1) d2Loader.sourceComponent = d2Button;

                if(backend.control15Type === 2) d4Loader.sourceComponent = d4Pot;
                if(backend.control15Type === 1) d4Loader.sourceComponent = d4Button;

                d3Loader.sourceComponent = potSelected;
            }
        }

    }

    Component{
        id: d3Button
        Button{
            autoExclusive: false
            //display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: d3Button.down ? "#17a81a" : "transparent"
                Image { source: "content/images/button.svg"}
            }
            onClicked:{
                comp_name.text = qsTr("button d3")
                backend.selectComponent(14)

                if(backend.control0Type === 2) a1Loader.sourceComponent = a1Pot;
                if(backend.control0Type === 1) a1Loader.sourceComponent = a1Button;

                if(backend.control1Type === 2) a2Loader.sourceComponent = a2Pot;
                if(backend.control1Type === 1) a2Loader.sourceComponent = a2Button;

                if(backend.control2Type === 2) a3Loader.sourceComponent = a3Pot;
                if(backend.control2Type === 1) a3Loader.sourceComponent = a3Button;

                if(backend.control3Type === 2) a4Loader.sourceComponent = a4Pot;
                if(backend.control3Type === 1) a4Loader.sourceComponent = a4Button;

                if(backend.control4Type === 2) b1Loader.sourceComponent = b1Pot;
                if(backend.control4Type === 1) b1Loader.sourceComponent = b1Button;

                if(backend.control5Type === 2) b2Loader.sourceComponent = b2Pot;
                if(backend.control5Type === 1) b2Loader.sourceComponent = b2Button;

                if(backend.control6Type === 2) b3Loader.sourceComponent = b3Pot;
                if(backend.control6Type === 1) b3Loader.sourceComponent = b3Button;

                if(backend.control7Type === 2) b4Loader.sourceComponent = b4Pot;
                if(backend.control7Type === 1) b4Loader.sourceComponent = b4Button;

                if(backend.control8Type === 2) c1Loader.sourceComponent = c1Pot;
                if(backend.control8Type === 1) c1Loader.sourceComponent = c1Button;

                if(backend.control9Type === 2) c2Loader.sourceComponent = c2Pot;
                if(backend.control9Type === 1) c2Loader.sourceComponent = c2Button;

                if(backend.control10Type === 2) c3Loader.sourceComponent = c3Pot;
                if(backend.control10Type === 1) c3Loader.sourceComponent = c3Button;

                if(backend.control11Type === 2) c4Loader.sourceComponent = c4Pot;
                if(backend.control11Type === 1) c4Loader.sourceComponent = c4Button;

                if(backend.control12Type === 2) d1Loader.sourceComponent = d1Pot;
                if(backend.control12Type === 1) d1Loader.sourceComponent = d1Button;

                if(backend.control13Type === 2) d2Loader.sourceComponent = d2Pot;
                if(backend.control13Type === 1) d2Loader.sourceComponent = d2Button;

                if(backend.control15Type === 2) d4Loader.sourceComponent = d4Pot;
                if(backend.control15Type === 1) d4Loader.sourceComponent = d4Button;

                d3Loader.sourceComponent = buttonSelected;
            }
        }
    }

    /*Component{
        id: d4Back
        Image { source: "content/images/Knob-w-back.svg"}
    }*/

    Component{
        id: d4Pot
        Button{
            autoExclusive: false
            //display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: d4Pot.down ? "#17a81a" : "transparent"
                Image { source: "content/images/knob.svg" }
            }
            onClicked:{
                comp_name.text = qsTr("knob d4")
                backend.selectComponent(15)

                if(backend.control0Type === 2) a1Loader.sourceComponent = a1Pot;
                if(backend.control0Type === 1) a1Loader.sourceComponent = a1Button;

                if(backend.control1Type === 2) a2Loader.sourceComponent = a2Pot;
                if(backend.control1Type === 1) a2Loader.sourceComponent = a2Button;

                if(backend.control2Type === 2) a3Loader.sourceComponent = a3Pot;
                if(backend.control2Type === 1) a3Loader.sourceComponent = a3Button;

                if(backend.control3Type === 2) a4Loader.sourceComponent = a4Pot;
                if(backend.control3Type === 1) a4Loader.sourceComponent = a4Button;

                if(backend.control4Type === 2) b1Loader.sourceComponent = b1Pot;
                if(backend.control4Type === 1) b1Loader.sourceComponent = b1Button;

                if(backend.control5Type === 2) b2Loader.sourceComponent = b2Pot;
                if(backend.control5Type === 1) b2Loader.sourceComponent = b2Button;

                if(backend.control6Type === 2) b3Loader.sourceComponent = b3Pot;
                if(backend.control6Type === 1) b3Loader.sourceComponent = b3Button;

                if(backend.control7Type === 2) b4Loader.sourceComponent = b4Pot;
                if(backend.control7Type === 1) b4Loader.sourceComponent = b4Button;

                if(backend.control8Type === 2) c1Loader.sourceComponent = c1Pot;
                if(backend.control8Type === 1) c1Loader.sourceComponent = c1Button;

                if(backend.control9Type === 2) c2Loader.sourceComponent = c2Pot;
                if(backend.control9Type === 1) c2Loader.sourceComponent = c2Button;

                if(backend.control10Type === 2) c3Loader.sourceComponent = c3Pot;
                if(backend.control10Type === 1) c3Loader.sourceComponent = c3Button;

                if(backend.control11Type === 2) c4Loader.sourceComponent = c4Pot;
                if(backend.control11Type === 1) c4Loader.sourceComponent = c4Button;

                if(backend.control12Type === 2) d1Loader.sourceComponent = d1Pot;
                if(backend.control12Type === 1) d1Loader.sourceComponent = d1Button;

                if(backend.control13Type === 2) d2Loader.sourceComponent = d2Pot;
                if(backend.control13Type === 1) d2Loader.sourceComponent = d2Button;

                if(backend.control14Type === 2) d3Loader.sourceComponent = d3Pot;
                if(backend.control14Type === 1) d3Loader.sourceComponent = d3Button;

                d4Loader.sourceComponent = potSelected;
            }
        }

    }

    Component{
        id: d4Button
        Button{
            autoExclusive: false
            //display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: d4Button.down ? "#17a81a" : "transparent"
                Image { source: "content/images/button.svg"}
            }
            onClicked:{
                comp_name.text = qsTr("button d4")
                backend.selectComponent(15)

                if(backend.control0Type === 2) a1Loader.sourceComponent = a1Pot;
                if(backend.control0Type === 1) a1Loader.sourceComponent = a1Button;

                if(backend.control1Type === 2) a2Loader.sourceComponent = a2Pot;
                if(backend.control1Type === 1) a2Loader.sourceComponent = a2Button;

                if(backend.control2Type === 2) a3Loader.sourceComponent = a3Pot;
                if(backend.control2Type === 1) a3Loader.sourceComponent = a3Button;

                if(backend.control3Type === 2) a4Loader.sourceComponent = a4Pot;
                if(backend.control3Type === 1) a4Loader.sourceComponent = a4Button;

                if(backend.control4Type === 2) b1Loader.sourceComponent = b1Pot;
                if(backend.control4Type === 1) b1Loader.sourceComponent = b1Button;

                if(backend.control5Type === 2) b2Loader.sourceComponent = b2Pot;
                if(backend.control5Type === 1) b2Loader.sourceComponent = b2Button;

                if(backend.control6Type === 2) b3Loader.sourceComponent = b3Pot;
                if(backend.control6Type === 1) b3Loader.sourceComponent = b3Button;

                if(backend.control7Type === 2) b4Loader.sourceComponent = b4Pot;
                if(backend.control7Type === 1) b4Loader.sourceComponent = b4Button;

                if(backend.control8Type === 2) c1Loader.sourceComponent = c1Pot;
                if(backend.control8Type === 1) c1Loader.sourceComponent = c1Button;

                if(backend.control9Type === 2) c2Loader.sourceComponent = c2Pot;
                if(backend.control9Type === 1) c2Loader.sourceComponent = c2Button;

                if(backend.control10Type === 2) c3Loader.sourceComponent = c3Pot;
                if(backend.control10Type === 1) c3Loader.sourceComponent = c3Button;

                if(backend.control11Type === 2) c4Loader.sourceComponent = c4Pot;
                if(backend.control11Type === 1) c4Loader.sourceComponent = c4Button;

                if(backend.control12Type === 2) d1Loader.sourceComponent = d1Pot;
                if(backend.control12Type === 1) d1Loader.sourceComponent = d1Button;

                if(backend.control13Type === 2) d2Loader.sourceComponent = d2Pot;
                if(backend.control13Type === 1) d2Loader.sourceComponent = d2Button;

                if(backend.control14Type === 2) d3Loader.sourceComponent = d3Pot;
                if(backend.control14Type === 1) d3Loader.sourceComponent = d3Button;

                d4Loader.sourceComponent = buttonSelected;
            }
        }
    }


    Image {
        id: image
        x: 0
        y: 0
        width: 1024
        height: 768
        source: "content/images/background.png"

        Rectangle {
            id: rectangle
            x: 579
            y: 0
            width: 445
            height: 768
            color: "#1e1e1e"
            border.color: "#00000000"

            Image {
                id: image1
                x: 144
                y: 48
                width: 169
                height: 64
                source: "content/images/Logo-MD1BP.svg"
            }

            Text {
                id: comp_name
                x: 60
                y: 165
                color: "#e8ac5b"
                text: qsTr("knob a1")
                font.bold: true
                font.pixelSize: 36
                font.family: "Arial"
            }

            Text {
                id: mode_txt
                x: 123
                y: 237
                color: "#e8ac5b"
                text: qsTr("mode")
                horizontalAlignment: Text.AlignRight
                font.bold: true
                font.pixelSize: 18
                font.family: "Arial"
            }

            ComboBox {
                id: componentMode_combo
                x: 186
                y: 232
                wheelEnabled: false
                focusPolicy: Qt.StrongFocus
                enabled: true
                font.family: "HelveticaNeueLTStd-Bd"
                font.pixelSize: 14
                textRole: "key"
                background: Rectangle {
                    implicitWidth: 200
                    implicitHeight: 30
                    color: "#d8d9d1"
                }
                model: ListModel{
                    ListElement{ key: "Voice Note"; value: 0 }
                    ListElement{ key: "CC"; value: 2 }
                }

                onCurrentTextChanged: {
                    if(currentIndex === 0){
                        backend.setComponentMode(0)
                    } else if (currentIndex === 1){
                        backend.setComponentMode(2)
                    }
                }
            }

            Text {
                id: cc_txt
                x: 80
                y: 287
                color: "#e8ac5b"
                text: qsTr("cc number")
                horizontalAlignment: Text.AlignRight
                font.bold: true
                font.pixelSize: 18
                font.family: "Arial"
            }

            ComboBox {
                id: componentData_combo
                x: 186
                y: 282
                wheelEnabled: false
                focusPolicy: Qt.StrongFocus
                enabled: true
                font.family: "HelveticaNeueLTStd-Bd"
                font.pixelSize: 14
                background: Rectangle {
                    implicitWidth: 200
                    implicitHeight: 30
                    color: "#d8d9d1"
                }

                model: ListModel{
                    ListElement{text: "0"}
                    ListElement{text: "1"}
                    ListElement{text: "2"}
                    ListElement{text: "3"}
                    ListElement{text: "4"}
                    ListElement{text: "5"}
                    ListElement{text: "6"}
                    ListElement{text: "7"}
                    ListElement{text: "8"}
                    ListElement{text: "9"}
                    ListElement{text: "10"}
                    ListElement{text: "11"}
                    ListElement{text: "12"}
                    ListElement{text: "13"}
                    ListElement{text: "14"}
                    ListElement{text: "15"}
                    ListElement{text: "16"}
                    ListElement{text: "17"}
                    ListElement{text: "18"}
                    ListElement{text: "19"}
                    ListElement{text: "20"}
                    ListElement{text: "21"}
                    ListElement{text: "22"}
                    ListElement{text: "23"}
                    ListElement{text: "24"}
                    ListElement{text: "25"}
                    ListElement{text: "26"}
                    ListElement{text: "27"}
                    ListElement{text: "28"}
                    ListElement{text: "29"}
                    ListElement{text: "30"}
                    ListElement{text: "31"}
                    ListElement{text: "32"}
                    ListElement{text: "33"}
                    ListElement{text: "34"}
                    ListElement{text: "35"}
                    ListElement{text: "36"}
                    ListElement{text: "37"}
                    ListElement{text: "38"}
                    ListElement{text: "39"}
                    ListElement{text: "40"}
                    ListElement{text: "41"}
                    ListElement{text: "42"}
                    ListElement{text: "43"}
                    ListElement{text: "44"}
                    ListElement{text: "45"}
                    ListElement{text: "46"}
                    ListElement{text: "47"}
                    ListElement{text: "48"}
                    ListElement{text: "49"}
                    ListElement{text: "50"}
                    ListElement{text: "51"}
                    ListElement{text: "52"}
                    ListElement{text: "53"}
                    ListElement{text: "54"}
                    ListElement{text: "55"}
                    ListElement{text: "56"}
                    ListElement{text: "57"}
                    ListElement{text: "58"}
                    ListElement{text: "59"}
                    ListElement{text: "60"}
                    ListElement{text: "61"}
                    ListElement{text: "62"}
                    ListElement{text: "63"}
                    ListElement{text: "64"}
                    ListElement{text: "65"}
                    ListElement{text: "66"}
                    ListElement{text: "67"}
                    ListElement{text: "68"}
                    ListElement{text: "69"}
                    ListElement{text: "70"}
                    ListElement{text: "71"}
                    ListElement{text: "72"}
                    ListElement{text: "73"}
                    ListElement{text: "74"}
                    ListElement{text: "75"}
                    ListElement{text: "76"}
                    ListElement{text: "77"}
                    ListElement{text: "78"}
                    ListElement{text: "79"}
                    ListElement{text: "80"}
                    ListElement{text: "81"}
                    ListElement{text: "82"}
                    ListElement{text: "83"}
                    ListElement{text: "84"}
                    ListElement{text: "85"}
                    ListElement{text: "86"}
                    ListElement{text: "87"}
                    ListElement{text: "88"}
                    ListElement{text: "89"}
                    ListElement{text: "90"}
                    ListElement{text: "91"}
                    ListElement{text: "92"}
                    ListElement{text: "93"}
                    ListElement{text: "94"}
                    ListElement{text: "95"}
                    ListElement{text: "96"}
                    ListElement{text: "97"}
                    ListElement{text: "98"}
                    ListElement{text: "99"}
                    ListElement{text: "100"}
                    ListElement{text: "101"}
                    ListElement{text: "102"}
                    ListElement{text: "103"}
                    ListElement{text: "104"}
                    ListElement{text: "105"}
                    ListElement{text: "106"}
                    ListElement{text: "107"}
                    ListElement{text: "108"}
                    ListElement{text: "109"}
                    ListElement{text: "110"}
                    ListElement{text: "111"}
                    ListElement{text: "112"}
                    ListElement{text: "113"}
                    ListElement{text: "114"}
                    ListElement{text: "115"}
                    ListElement{text: "116"}
                    ListElement{text: "117"}
                    ListElement{text: "118"}
                    ListElement{text: "119"}
                    ListElement{text: "120"}
                    ListElement{text: "121"}
                    ListElement{text: "122"}
                    ListElement{text: "123"}
                    ListElement{text: "124"}
                    ListElement{text: "125"}
                    ListElement{text: "126"}
                    ListElement{text: "127"}
                }
                onCurrentTextChanged: {
                    backend.setComponentData(currentIndex)
                }
            }
            /*TextInput{
                id: cc_txtInput
                x: 186
                y: 288
                width: 200
                height: 30
                color: "#d9d1d1"
                font.pixelSize: 14
                font.family: "Arial"
                text: backend.ccNumber
                font.bold: true
                topPadding: 6
                inputMask: qsTr("")
                inputMethodHints: Qt.ImhFormattedNumbersOnly
                onTextChanged: {
                    backend.setCcNumber(text)
                }
            }*/

            Text {
                id: channel_txt
                x: 104
                y: 337
                color: "#e8ac5b"
                text: qsTr("channel")
                horizontalAlignment: Text.AlignRight
                font.bold: true
                font.pixelSize: 18
                font.family: "Arial"
            }

            ComboBox {
                id: componentChannel_combo
                x: 186
                y: 332
                wheelEnabled: false
                focusPolicy: Qt.StrongFocus
                enabled: true
                font.family: "HelveticaNeueLTStd-Bd"
                font.pixelSize: 14
                background: Rectangle {
                    implicitWidth: 200
                    implicitHeight: 30
                    color: "#d8d9d1"
                }
                model: ListModel{
                    ListElement{text: "Global"}
                    ListElement{text: "1"}
                    ListElement{text: "2"}
                    ListElement{text: "3"}
                    ListElement{text: "4"}
                    ListElement{text: "5"}
                    ListElement{text: "6"}
                    ListElement{text: "7"}
                    ListElement{text: "8"}
                    ListElement{text: "9"}
                    ListElement{text: "10"}
                    ListElement{text: "11"}
                    ListElement{text: "12"}
                    ListElement{text: "13"}
                    ListElement{text: "14"}
                    ListElement{text: "15"}
                    ListElement{text: "16"}
                }
                onCurrentTextChanged: {
                    backend.setComponentChannel(currentIndex)
                }
            }

            Text {
                id: minval_txt
                x: 104
                y: 387
                width: 68
                color: "#e8ac5b"
                text: qsTr("min value")
                horizontalAlignment: Text.AlignRight
                font.bold: true
                font.pixelSize: 18
                font.family: "Arial"
            }

            TextField {
                id: componentMinValue_textInput
                x: 186
                y: 385
                color: "#d9d1d1"
                text: backend.componentMinValue //text: rango.first.value
                inputMask: qsTr("")
                topPadding: 10
                bottomPadding: 9
                leftPadding: 12
                rightPadding: 30
                font.bold: true
                selectionColor: "#d1d5d9"
                font.pixelSize: 14
                font.family: "Arial"
                inputMethodHints: Qt.ImhFormattedNumbersOnly
                background: Rectangle {
                    implicitWidth: 200
                    implicitHeight: 30
                    color: "transparent"
                    border.color: "#d8d9d1"
                    border.width: 0.5
                }

                onTextChanged:{
                    backend.setComponentMinValue(text)
                    rango.first.value = text
                }
            }

            Text {
                id: maxval_txt
                x: 104
                y: 437
                width: 68
                color: "#e8ac5b"
                text: qsTr("max value")
                horizontalAlignment: Text.AlignRight
                font.bold: true
                font.pixelSize: 18
                font.family: "Arial"
            }

            TextField {
                id: componentMaxValue_textInput
                x: 186
                y: 435
                color: "#d9d1d1"
                text: backend.componentMaxValue//text: rango.second.value
                inputMask: qsTr("")
                topPadding: 6
                font.bold: true
                selectionColor: "#d1d5d9"
                font.pixelSize: 14
                font.family: "Arial"
                inputMethodHints: Qt.ImhFormattedNumbersOnly
                background: Rectangle {
                    implicitWidth: 200
                    implicitHeight: 30
                    color: "transparent"
                    border.color: "#d8d9d1"
                    border.width: 0.5
                }

                onTextChanged:{
                    backend.setComponentMaxValue(text)
                    rango.second.value = text
                }
            }

            Text {
                id: button_behaviour_txt
                x: 104
                y: 544
                width: 68
                color: "#e8ac5b"
                text: qsTr("button behaviour")
                horizontalAlignment: Text.AlignRight
                font.bold: true
                font.pixelSize: 18
                font.family: "Arial"
            }

            ComboBox {
                id: componentButtonBehaviour_combo
                x: 186
                y: 542
                wheelEnabled: false
                focusPolicy: Qt.StrongFocus
                enabled: true
                font.family: "HelveticaNeueLTStd-Bd"
                font.pixelSize: 14
                textRole: "key"
                background: Rectangle {
                    implicitWidth: 200
                    implicitHeight: 30
                    color: "#d8d9d1"
                }
                model: ListModel{
                    ListElement{ key: "momentary"; value: 1 }
                    ListElement{ key: "toggle"; value: 2 }
                }
                onCurrentTextChanged: {
                    backend.setComponentButtonBehaviour(currentIndex + 1)
                }
            }

            Button {
                id: syncButton
                x: 160
                y: 628
                text: qsTr("sync")
                focusPolicy: Qt.TabFocus
                font.family: "HelveticaNeueLTStd-Bd"
                font.pixelSize: 14

                contentItem: Text {
                    text: syncButton.text
                    color: "#1e1e1e"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }

                background: Rectangle {
                    implicitWidth: 125
                    implicitHeight: 40
                    color: "#e8ac5b"
                }

                onClicked: {
                    backend.syncHost2Device();
                }
            }

            Image {
                id: clock
                x: 160
                y: 620

                source: "content/images/clock.svg"
                visible: false
            }

            RangeSlider {
                id: rango
                x: 129
                y: 482
                orientation: Qt.Horizontal
                stepSize: 1
                to: 127
                first.onValueChanged: {
                    backend.setComponentMinValue(componentMinValue_textInput.text)
                    componentMinValue_textInput.text = first.value.toFixed(0)
                }
                second.onValueChanged:{
                    backend.setComponentMaxValue(componentMaxValue_textInput.text)
                    componentMaxValue_textInput.text = second.value.toFixed(0)
                }
            }
        }

        Image {
            id: back_controler
            x: 90
            y: 60
            width: 400
            height: 393
            source: "content/images/back.svg"

            Loader{
                id: a1BackLoader
                x: 34
                y: 47
                width: 81
                height: 81
            }

            Loader{
                id: a1Loader
                x: 34
                y: 50
                width: 81
                height: 81
            }

            Loader{
                id: a2BackLoader
                x: 115
                y: 47
                width: 81
                height: 81
            }

            Loader{
                id: a2Loader
                x: 115
                y: 50
                width: 81
                height: 81
            }

            Loader{
                id: a3BackLoader
                x: 196
                y: 47
                width: 81
                height: 81
            }

            Loader{
                id: a3Loader
                x: 196
                y: 50
                width: 81
                height: 81
            }

            Loader{
                id: a4BackLoader
                x: 277
                y: 47
                width: 81
                height: 81
            }

            Loader{
                id: a4Loader
                x: 277
                y: 50
                width: 81
                height: 81
            }

            Loader{
                id: b1BackLoader
                x: 34
                y: 128
                width: 81
                height: 81
            }

            Loader{
                id: b1Loader
                x: 34
                y: 131
                width: 81
                height: 81
            }

            Loader{
                id: b2BackLoader
                x: 115
                y: 128
                width: 81
                height: 81
            }

            Loader{
                id: b2Loader
                x: 115
                y: 131
                width: 81
                height: 81
            }

            Loader{
                id: b3BackLoader
                x: 196
                y: 128
                width: 81
                height: 81
            }

            Loader{
                id: b3Loader
                x: 196
                y: 131
                width: 81
                height: 81
            }

            Loader{
                id: b4BackLoader
                x: 277
                y: 128
                width: 81
                height: 81
            }

            Loader{
                id: b4Loader
                x: 277
                y: 131
                width: 81
                height: 81
            }

            Loader{
                id: c1BackLoader
                x: 34
                y: 209
                width: 81
                height: 81
            }

            Loader{
                id: c1Loader
                x: 34
                y: 212
                width: 81
                height: 81
            }

            Loader{
                id: c2BackLoader
                x: 115
                y: 209
                width: 81
                height: 81
            }

            Loader{
                id: c2Loader
                x: 115
                y: 212
                width: 81
                height: 81
            }

            Loader{
                id: c3BackLoader
                x: 196
                y: 209
                width: 81
                height: 81
            }

            Loader{
                id: c3Loader
                x: 196
                y: 212
                width: 81
                height: 81
            }

            Loader{
                id: c4BackLoader
                x: 277
                y: 209
                width: 81
                height: 81
            }

            Loader{
                id: c4Loader
                x: 277
                y: 212
                width: 81
                height: 81
            }

            Loader{
                id: d1BackLoader
                x: 34
                y: 290
                width: 81
                height: 81
            }

            Loader{
                id: d1Loader
                x: 34
                y: 293
                width: 81
                height: 81
            }

            Loader{
                id: d2BackLoader
                x: 115
                y: 290
                width: 81
                height: 81
            }

            Loader{
                id: d2Loader
                x: 115
                y: 293
                width: 81
                height: 81
            }

            Loader{
                id: d3BackLoader
                x: 196
                y: 290
                width: 81
                height: 81
            }

            Loader{
                id: d3Loader
                x: 196
                y: 293
                width: 81
                height: 81
            }

            Loader{
                id: d4BackLoader
                x: 277
                y: 290
                width: 81
                height: 81
            }

            Loader{
                id: d4Loader
                x: 277
                y: 293
                width: 81
                height: 81
            }
        }

        Text {
            id: preset_txt
            visible: true
            x: 107
            y: 486
            color: "#e8ac5b"
            text: qsTr("preset")
            horizontalAlignment: Text.AlignRight
            font.bold: true
            font.pixelSize: 18
            font.family: "Arial"
        }

        ComboBox {
            id: global_combo
            visible: true
            x: 244
            y: 638
            wheelEnabled: true
            focusPolicy: Qt.StrongFocus
            enabled: true
            font.family: "HelveticaNeueLTStd-Bd"
            font.pixelSize: 14

            background: Rectangle {
                implicitWidth: 200
                implicitHeight: 30
                color: "#d8d9d1"
            }
            model: ListModel{
                ListElement{text: "1"}
                ListElement{text: "2"}
                ListElement{text: "3"}
                ListElement{text: "4"}
                ListElement{text: "5"}
                ListElement{text: "6"}
                ListElement{text: "7"}
                ListElement{text: "8"}
                ListElement{text: "9"}
                ListElement{text: "10"}
                ListElement{text: "11"}
                ListElement{text: "12"}
                ListElement{text: "13"}
                ListElement{text: "14"}
                ListElement{text: "15"}
                ListElement{text: "16"}
            }
            //onCurrentTextChanged: backend.setDeviceMode(currentIndex)
        }

        Text {
            id: global_txt
            visible: true
            x: 104
            y: 644
            color: "#e8ac5b"
            text: qsTr("global channel")
            horizontalAlignment: Text.AlignRight
            font.bold: true
            font.pixelSize: 18
            font.family: "Arial"
        }
        Rectangle {
            id:presets
            PresetButton {
                id: p1
                visible: true
                x: 107
                y: 517
                checkable: true
                autoExclusive: true
                checked: true
                text: qsTr("1")
                font.family: "Arial"
                onClicked: backend.setPreset(0)
            }

            PresetButton {
                id: p2
                visible: true
                x: 155
                y: 517
                checkable: true
                autoExclusive: true
                text: qsTr("2")
                font.family: "Arial"
                onClicked: backend.setPreset(1)
            }

            PresetButton {
                id: p3
                visible: true
                x: 203
                y: 517
                checkable: true
                autoExclusive: true
                text: qsTr("3")
                font.family: "Arial"
                onClicked: backend.setPreset(2)
            }

            PresetButton {
                id: p4
                visible: true
                x: 251
                y: 517
                checkable: true
                autoExclusive: true
                text: qsTr("4")
                font.family: "Arial"
                onClicked: backend.setPreset(3)
            }

            PresetButton {
                id: p5
                visible: true
                x: 299
                y: 517
                checkable: true
                autoExclusive: true
                text: qsTr("5")
                font.family: "Arial"
                onClicked: backend.setPreset(4)
            }

            PresetButton {
                id: p6
                visible: true
                x: 347
                y: 517
                checkable: true
                autoExclusive: true
                text: qsTr("6")
                font.family: "Arial"
                onClicked: backend.setPreset(5)
            }

            PresetButton {
                id: p7
                visible: true
                x: 395
                y: 517
                checkable: true
                autoExclusive: true
                text: qsTr("7")
                font.family: "Arial"
                onClicked: backend.setPreset(6)
            }

            PresetButton {
                id: p8
                visible: true
                x: 443
                y: 517
                checkable: true
                autoExclusive: true
                text: qsTr("8")
                font.family: "Arial"
                onClicked: backend.setPreset(7)
            }

            PresetButton {
                id: p9
                visible: true
                x: 107
                y: 570
                checkable: true
                autoExclusive: true
                text: qsTr("9")
                font.family: "Arial"
                onClicked: backend.setPreset(8)
            }

            PresetButton {
                id: p10
                visible: true
                x: 155
                y: 570
                checkable: true
                autoExclusive: true
                text: qsTr("10")
                font.family: "Arial"
                onClicked: backend.setPreset(9)
            }

            PresetButton {
                id: p11
                visible: true
                x: 203
                y: 570
                checkable: true
                autoExclusive: true
                text: qsTr("11")
                font.family: "Arial"
                onClicked: backend.setPreset(10)
            }

            PresetButton {
                id: p12
                visible: true
                x: 251
                y: 570
                checkable: true
                autoExclusive: true
                text: qsTr("12")
                font.family: "Arial"
                onClicked: backend.setPreset(11)
            }

            PresetButton {
                id: p13
                visible: true
                x: 299
                y: 570
                checkable: true
                autoExclusive: true
                text: qsTr("13")
                font.family: "Arial"
                onClicked: backend.setPreset(12)
            }

            PresetButton {
                id: p14
                visible: true
                x: 347
                y: 570
                checkable: true
                autoExclusive: true
                text: qsTr("14")
                font.family: "Arial"
                onClicked: backend.setPreset(13)
            }

            PresetButton {
                id: p15
                visible: true
                x: 395
                y: 570
                checkable: true
                autoExclusive: true
                text: qsTr("15")
                font.family: "Arial"
                onClicked: backend.setPreset(14)
            }

            PresetButton {
                id: p16
                visible: true
                x: 443
                y: 570
                checkable: true
                autoExclusive: true
                text: qsTr("16")
                font.family: "Arial"
                onClicked: backend.setPreset(15)
            }
        }

        Rectangle {
            id: rectangle1
            x: 0
            y: 728
            width: 1024
            height: 40
            color: "#000000"
            visible: true
        }

        Text {
            id: deviceStatusLabel
            x: 25
            y: 12
            color: "#e8ac5b"
            //            text: backend.deviceStatus //qsTr("Ready!")
            font.pixelSize: 14
            font.bold: true
            font.family: "Arial"

            onTextChanged: {
                if (text !== "unplugged"){
                    deviceBar.value = 1
                }else {
                    comp_name.text = "knob a1"
                    deviceBar.value = 0
                }
            }
        }

        ProgressBar {
            id: deviceBar
            x: 799
            y: 17
            Behavior on value {
                NumberAnimation { duration: 1250 }
            }
        }
    }
}
