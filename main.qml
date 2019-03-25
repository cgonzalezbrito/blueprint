import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 2.2
import QtQuick.Controls 1.4 as QQC1
import QtQuick.Controls.Styles 1.4
import QtQml 2.1
//import QtQuick.Dialogs 1.1

//Our modele
import io.qt.examples.backend 1.0
//import io.qt.examples.controller 1.0

Window {

    visible: true
    width: 1024
    height: 768
    title: qsTr("Tinami")

    BackEnd {
        id: backend
        onDeviceModeChanged: {
            if (backend.deviceMode ==="CC")
                mode_combo.currentIndex = 1
            else if (backend.deviceMode === "Voice Note")
                mode_combo.currentIndex = 2
            else
                mode_combo.currentIndex = 0
        }

        onCcNumberChanged: {
            cc_txtInput.text = ccNumber
        }

        onMinValueChanged: {
            minval_txtinput.text = minValue
        }
        onMaxValueChanged: {
            maxval_txtinput.text = maxValue
        }

        onControl0TypeChanged:{
            if(backend.control0Type === 3){
                a1BackLoader.sourceComponent = a1Back;
                a1Loader.sourceComponent = a1Pot;
            }
            if(backend.control0Type === 2)
                a1Loader.sourceComponent = a1Button;
            if(backend.control0Type === 1)
                a1Loader.sourceComponent = a1Button;
            /*if(backend.control0Type === 0)
                a1Loader.sourceComponent = a1Button;*/
        }
        onControl1TypeChanged:{
            if(backend.control1Type === 3){
                a2BackLoader.sourceComponent = a2Back;
                a2Loader.sourceComponent = a2Pot;
            }
            if(backend.control1Type === 2)
                a2Loader.sourceComponent = a2Button;
            if(backend.control1Type === 1)
                a2Loader.sourceComponent = a2Button;
            /*if(backend.control1Type === 0)
                a2Loader.sourceComponent = a2Button;*/
        }
        onControl2TypeChanged:{
            if(backend.control2Type === 3){
                a3BackLoader.sourceComponent = a3Back;
                a3Loader.sourceComponent = a3Pot;
            }
            if(backend.control2Type === 2)
                a3Loader.sourceComponent = a3Button;
            if(backend.control2Type === 1)
                a3Loader.sourceComponent = a3Button;
            /*if(backend.control2Type === 0)
                a3Loader.sourceComponent = a3Button;*/
        }
        onControl3TypeChanged:{
            if(backend.control3Type === 3){
                a4BackLoader.sourceComponent = a4Back;
                a4Loader.sourceComponent = a4Pot;
            }
            if(backend.control3Type === 2)
                a4Loader.sourceComponent = a4Button;
            if(backend.control3Type === 1)
                a4Loader.sourceComponent = a4Button;
            /*if(backend.control3Type === 0)
                a4Loader.sourceComponent = a4Button;*/
        }
        onControl4TypeChanged:{
            if(backend.control4Type === 3){
                b1BackLoader.sourceComponent = b1Back;
                b1Loader.sourceComponent = b1Pot;
            }
            if(backend.control4Type === 2)
                b1Loader.sourceComponent = b1Button;
            if(backend.control4Type === 1)
                b1Loader.sourceComponent = b1Button;
        /*    if(backend.control4Type === 0)
                b1Loader.sourceComponent = b1Button;*/
        }
        onControl5TypeChanged:{
            if(backend.control5Type === 3){
                b2BackLoader.sourceComponent = b2Back;
                b2Loader.sourceComponent = b2Pot;
            }
            if(backend.control5Type === 2)
                b2Loader.sourceComponent = b2Button;
            if(backend.control5Type === 1)
                b2Loader.sourceComponent = b2Button;
           /* if(backend.control5Type === 0)
                b2Loader.sourceComponent = b2Button;*/
        }
        onControl6TypeChanged:{
            if(backend.control6Type === 3){
                b3BackLoader.sourceComponent = b3Back;
                b3Loader.sourceComponent = b3Pot;
            }
            if(backend.control6Type === 2)
                b3Loader.sourceComponent = b3Button;
            if(backend.control6Type === 1)
                b3Loader.sourceComponent = b3Button;
         /*   if(backend.control6Type === 0)
                b3Loader.sourceComponent = b3Button;*/
        }
        onControl7TypeChanged:{
            if(backend.control7Type === 3){
                b4BackLoader.sourceComponent = b4Back;
                b4Loader.sourceComponent = b4Pot;
            }
            if(backend.control7Type === 2)
                b4Loader.sourceComponent = b4Button;
            if(backend.control7Type === 1)
                b4Loader.sourceComponent = b4Button;
          /*  if(backend.control7Type === 0)
                b4Loader.sourceComponent = b4Button;*/
        }
        onControl8TypeChanged:{
            if(backend.control8Type === 3){
                c1BackLoader.sourceComponent = c1Back;
                c1Loader.sourceComponent = c1Pot;
            }
            if(backend.control8Type === 2)
                c1Loader.sourceComponent = c1Button;
            if(backend.control8Type === 1)
                c1Loader.sourceComponent = c1Button;
          /*  if(backend.control8Type === 0)
                c1Loader.sourceComponent = c1Button;*/
        }
        onControl9TypeChanged:{
            if(backend.control9Type === 3){
                c2BackLoader.sourceComponent = c2Back;
                c2Loader.sourceComponent = c2Pot;
            }
            if(backend.control9Type === 2)
                c2Loader.sourceComponent = c2Button;
            if(backend.control9Type === 1)
                c2Loader.sourceComponent = c2Button;
          /*  if(backend.control9Type === 0)
                c2Loader.sourceComponent = c2Button;*/
        }
        onControl10TypeChanged:{
            if(backend.control10Type === 3){
                c3BackLoader.sourceComponent = c3Back;
                c3Loader.sourceComponent = c3Pot;
            }
            if(backend.control10Type === 2)
                c3Loader.sourceComponent = c3Button;
            if(backend.control10Type === 1)
                c3Loader.sourceComponent = c3Button;
           /* if(backend.control10Type === 0)
                c3Loader.sourceComponent = c3Button;*/
        }
        onControl11TypeChanged:{
            if(backend.control11Type === 3){
                c4BackLoader.sourceComponent = c4Back;
                c4Loader.sourceComponent = c4Pot;
            }
            if(backend.control11Type === 2)
                c4Loader.sourceComponent = c4Button;
            if(backend.control11Type === 1)
                c4Loader.sourceComponent = c4Button;
        /*    if(backend.control11Type === 0)
                c4Loader.sourceComponent = c4Button;*/
        }
        onControl12TypeChanged:{
            if(backend.control12Type === 3){
                d1BackLoader.sourceComponent = d1Back;
                d1Loader.sourceComponent = d1Pot;
            }
            if(backend.control12Type === 2)
                d1Loader.sourceComponent = d1Button;
            if(backend.control12Type === 1)
                d1Loader.sourceComponent = d1Button;
         /*   if(backend.control12Type === 0)
                d1Loader.sourceComponent = d1Button;*/
        }
        onControl13TypeChanged:{
            if(backend.control13Type === 3){
                d2BackLoader.sourceComponent = d2Back;
                d2Loader.sourceComponent = d2Pot;
            }
            if(backend.control13Type === 2)
                d2Loader.sourceComponent = d2Button;
            if(backend.control13Type === 1)
                d2Loader.sourceComponent = d2Button;
        /*    if(backend.control13Type === 0)
                d2Loader.sourceComponent = d2Button;*/
        }
        onControl14TypeChanged:{
            if(backend.control14Type === 3){
                d3BackLoader.sourceComponent = d3Back;
                d3Loader.sourceComponent = d3Pot;
            }
            if(backend.control14Type === 2)
                d3Loader.sourceComponent = d3Button;
            if(backend.control14Type === 1)
                d3Loader.sourceComponent = d3Button;
       /*     if(backend.control14Type === 0)
                d3Loader.sourceComponent = d3Button;*/
        }
        onControl15TypeChanged:{
            if(backend.control15Type === 3){
                d4BackLoader.sourceComponent = d4Back;
                d4Loader.sourceComponent = d4Pot;
            }
            if(backend.control15Type === 2)
                d4Loader.sourceComponent = d4Button;
            if(backend.control15Type === 1)
                d4Loader.sourceComponent = d4Button;
           /* if(backend.control15Type === 0)
                d4Loader.sourceComponent = d4Button;*/
        }

        onValue0Changed: a1Loader.rotation = backend.value0
        onValue1Changed: a2Loader.rotation = backend.value1
        onValue2Changed: a3Loader.rotation = backend.value2
        onValue3Changed: a4Loader.rotation = backend.value3
        onValue4Changed: b1Loader.rotation = backend.value4
        onValue5Changed: b2Loader.rotation = backend.value5
        onValue6Changed: b3Loader.rotation = backend.value6
        onValue7Changed: b4Loader.rotation = backend.value7
        onValue8Changed: c1Loader.rotation = backend.value8
        onValue9Changed: c2Loader.rotation = backend.value9
        onValue10Changed: c3Loader.rotation = backend.value10
        onValue11Changed: c4Loader.rotation = backend.value11
        onValue12Changed: d1Loader.rotation = backend.value12
        onValue13Changed: d2Loader.rotation = backend.value13
        onValue14Changed: d3Loader.rotation = backend.value14
        onValue15Changed: d4Loader.rotation = backend.value15
    }

    Component{
        id: a1Back
        Image { source: "images/Knob-w-back.svg"}
    }

    Component{
        id: a1Pot
        Button{
            autoExclusive: false
            display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: a1Pot.down ? "#17a81a" : "transparent"
                Image { source: "images/Knob-w-animation.svg"}
            }
            onClicked:{
                comp_name.text = qsTr("knob a1")
                backend.selectComponent(0)
            }
        }
    }

    Component{
        id: a1Button
        Button{
            autoExclusive: false
            display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: a1Button.down ? "#17a81a" : "transparent"
                Image { source: "images/Button-w.svg"}
            }
            onClicked:{
                comp_name.text = qsTr("button a1")
                backend.selectComponent(0)
            }
        }
    }

    Component{
        id: a2Back
        Image { source: "images/Knob-w-back.svg"}
    }

    Component{
        id: a2Pot
        Button{
            autoExclusive: false
            display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: a2Pot.down ? "#17a81a" : "transparent"
                Image { source: "images/Knob-w-animation.svg"}
            }
            onClicked:{
                comp_name.text = qsTr("knob a2")
                backend.selectComponent(1)
            }
        }
    }

    Component{
        id: a2Button
        Button{
            autoExclusive: false
            display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: a2Button.down ? "#17a81a" : "transparent"
                Image { source: "images/Button-w.svg"}
            }
            onClicked:{
                comp_name.text = qsTr("button a2")
                backend.selectComponent(1)
            }
        }
    }

    Component{
        id: a3Back
        Image { source: "images/Knob-w-back.svg"}
    }

    Component{
        id: a3Pot
        Button{
            autoExclusive: false
            display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: a3Pot.down ? "#17a81a" : "transparent"
                Image { source: "images/Knob-w-animation.svg" }
            }
            onClicked:{
                comp_name.text = qsTr("knob a3")
                backend.selectComponent(2)
            }
        }

    }

    Component{
        id: a3Button
        Button{
            autoExclusive: false
            display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: a3Button.down ? "#17a81a" : "transparent"
                Image { source: "images/Button-w.svg"}
            }
            onClicked:{
                comp_name.text = qsTr("button a3")
                backend.selectComponent(2)
            }
        }
    }

    Component{
        id: a4Back
        Image { source: "images/Knob-w-back.svg"}
    }

    Component{
        id: a4Pot
        Button{
            autoExclusive: false
            display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: a4Pot.down ? "#17a81a" : "transparent"
                Image { source: "images/Knob-w-animation.svg" }
            }
            onClicked:{
                comp_name.text = qsTr("knob a4")
                backend.selectComponent(3)
            }
        }

    }

    Component{
        id: a4Button
        Button{
            autoExclusive: false
            display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: a4Button.down ? "#17a81a" : "transparent"
                Image { source: "images/Button-w.svg"}
            }
            onClicked:{
                comp_name.text = qsTr("button a4")
                backend.selectComponent(3)
            }
        }
    }

    Component{
        id: b1Back
        Image { source: "images/Knob-w-back.svg"}
    }

    Component{
        id: b1Pot
        Button{
            autoExclusive: false
            display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: b1Pot.down ? "#17a81a" : "transparent"
                Image { source: "images/Knob-w-animation.svg" }
            }
            onClicked:{
                comp_name.text = qsTr("knob b1")
                backend.selectComponent(4)
            }
        }

    }

    Component{
        id: b1Button
        Button{
            autoExclusive: false
            display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: b1Button.down ? "#17a81a" : "transparent"
                Image { source: "images/Button-w.svg"}
            }
            onClicked:{
                comp_name.text = qsTr("button b1")
                backend.selectComponent(4)
            }
        }
    }

    Component{
        id: b2Back
        Image { source: "images/Knob-w-back.svg"}
    }

    Component{
        id: b2Pot
        Button{
            autoExclusive: false
            display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: b2Pot.down ? "#17a81a" : "transparent"
                Image { source: "images/Knob-w-animation.svg" }
            }
            onClicked:{
                comp_name.text = qsTr("knob b2")
                backend.selectComponent(5)
            }
        }

    }

    Component{
        id: b2Button
        Button{
            autoExclusive: false
            display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: b2Button.down ? "#17a81a" : "transparent"
                Image { source: "images/Button-w.svg"}
            }
            onClicked:{
                comp_name.text = qsTr("button b2")
                backend.selectComponent(5)
            }
        }
    }

    Component{
        id: b3Back
        Image { source: "images/Knob-w-back.svg"}
    }

    Component{
        id: b3Pot
        Button{
            autoExclusive: false
            display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: b3Pot.down ? "#17a81a" : "transparent"
                Image { source: "images/Knob-w-animation.svg" }
            }
            onClicked:{
                comp_name.text = qsTr("knob b3")
                backend.selectComponent(6)
            }
        }

    }

    Component{
        id: b3Button
        Button{
            autoExclusive: false
            display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: b3Button.down ? "#17a81a" : "transparent"
                Image { source: "images/Button-w.svg"}
            }
            onClicked:{
                comp_name.text = qsTr("button b3")
                backend.selectComponent(6)
            }
        }
    }

    Component{
        id: b4Back
        Image { source: "images/Knob-w-back.svg"}
    }

    Component{
        id: b4Pot
        Button{
            autoExclusive: false
            display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: b4Pot.down ? "#17a81a" : "transparent"
                Image { source: "images/Knob-w-animation.svg" }
            }
            onClicked:{
                comp_name.text = qsTr("knob b4")
                backend.selectComponent(7)
            }
        }

    }

    Component{
        id: b4Button
        Button{
            autoExclusive: false
            display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: b4Button.down ? "#17a81a" : "transparent"
                Image { source: "images/Button-w.svg"}
            }
            onClicked:{
                comp_name.text = qsTr("button b4")
                backend.selectComponent(7)
            }
        }
    }

    Component{
        id: c1Back
        Image { source: "images/Knob-w-back.svg"}
    }

    Component{
        id: c1Pot
        Button{
            autoExclusive: false
            display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: c1Pot.down ? "#17a81a" : "transparent"
                Image { source: "images/Knob-w-animation.svg" }
            }
            onClicked:{
                comp_name.text = qsTr("knob c1")
                backend.selectComponent(8)
            }
        }

    }

    Component{
        id: c1Button
        Button{
            autoExclusive: false
            display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: c1Button.down ? "#17a81a" : "transparent"
                Image { source: "images/Button-w.svg"}
            }
            onClicked:{
                comp_name.text = qsTr("button c1")
                backend.selectComponent(8)
            }
        }
    }

    Component{
        id: c2Back
        Image { source: "images/Knob-w-back.svg"}
    }

    Component{
        id: c2Pot
        Button{
            autoExclusive: false
            display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: c2Pot.down ? "#17a81a" : "transparent"
                Image { source: "images/Knob-w-animation.svg" }
            }
            onClicked:{
                comp_name.text = qsTr("knob c2")
                backend.selectComponent(9)
            }
        }

    }

    Component{
        id: c2Button
        Button{
            autoExclusive: false
            display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: c1Button.down ? "#17a81a" : "transparent"
                Image { source: "images/Button-w.svg"}
            }
            onClicked:{
                comp_name.text = qsTr("button c2")
                backend.selectComponent(9)
            }
        }
    }

    Component{
        id: c3Back
        Image { source: "images/Knob-w-back.svg"}
    }

    Component{
        id: c3Pot
        Button{
            autoExclusive: false
            display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: c3Pot.down ? "#17a81a" : "transparent"
                Image { source: "images/Knob-w-animation.svg" }
            }
            onClicked:{
                comp_name.text = qsTr("knob c3")
                backend.selectComponent(10)
            }
        }

    }

    Component{
        id: c3Button
        Button{
            autoExclusive: false
            display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: c3Button.down ? "#17a81a" : "transparent"
                Image { source: "images/Button-w.svg"}
            }
            onClicked:{
                comp_name.text = qsTr("button c3")
                backend.selectComponent(10)
            }
        }
    }

    Component{
        id: c4Back
        Image { source: "images/Knob-w-back.svg"}
    }

    Component{
        id: c4Pot
        Button{
            autoExclusive: false
            display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: c4Pot.down ? "#17a81a" : "transparent"
                Image { source: "images/Knob-w-animation.svg" }
            }
            onClicked:{
                comp_name.text = qsTr("knob c4")
                backend.selectComponent(11)
            }
        }

    }

    Component{
        id: c4Button
        Button{
            autoExclusive: false
            display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: c4Button.down ? "#17a81a" : "transparent"
                Image { source: "images/Button-w.svg"}
            }
            onClicked:{
                comp_name.text = qsTr("button c4")
                backend.selectComponent(11)
            }
        }
    }

    Component{
        id: d1Back
        Image { source: "images/Knob-w-back.svg"}
    }

    Component{
        id: d1Pot
        Button{
            autoExclusive: false
            display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: d1Pot.down ? "#17a81a" : "transparent"
                Image { source: "images/Knob-w-animation.svg" }
            }
            onClicked:{
                comp_name.text = qsTr("knob d1")
                backend.selectComponent(12)
            }
        }

    }

    Component{
        id: d1Button
        Button{
            autoExclusive: false
            display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: c1Button.down ? "#17a81a" : "transparent"
                Image { source: "images/Button-w.svg"}
            }
            onClicked:{
                comp_name.text = qsTr("button d1")
                backend.selectComponent(12)
            }
        }
    }

    Component{
        id: d2Back
        Image { source: "images/Knob-w-back.svg"}
    }

    Component{
        id: d2Pot
        Button{
            autoExclusive: false
            display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: d2Pot.down ? "#17a81a" : "transparent"
                Image { source: "images/Knob-w-animation.svg" }
            }
            onClicked:{
                comp_name.text = qsTr("knob d2")
                backend.selectComponent(13)
            }
        }

    }

    Component{
        id: d2Button
        Button{
            autoExclusive: false
            display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: d2Button.down ? "#17a81a" : "transparent"
                Image { source: "images/Button-w.svg"}
            }
            onClicked:{
                comp_name.text = qsTr("button d2")
                backend.selectComponent(13)
            }
        }
    }

    Component{
        id: d3Back
        Image { source: "images/Knob-w-back.svg"}
    }

    Component{
        id: d3Pot
        Button{
            autoExclusive: false
            display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: d3Pot.down ? "#17a81a" : "transparent"
                Image { source: "images/Knob-w-animation.svg" }
            }
            onClicked:{
                comp_name.text = qsTr("knob d3")
                backend.selectComponent(14)
            }
        }

    }

    Component{
        id: d3Button
        Button{
            autoExclusive: false
            display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: d3Button.down ? "#17a81a" : "transparent"
                Image { source: "images/Button-w.svg"}
            }
            onClicked:{
                comp_name.text = qsTr("button d3")
                backend.selectComponent(14)
            }
        }
    }

    Component{
        id: d4Back
        Image { source: "images/Knob-w-back.svg"}
    }

    Component{
        id: d4Pot
        Button{
            autoExclusive: false
            display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: d4Pot.down ? "#17a81a" : "transparent"
                Image { source: "images/Knob-w-animation.svg" }
            }
            onClicked:{
                comp_name.text = qsTr("knob d4")
                backend.selectComponent(15)
            }
        }

    }

    Component{
        id: d4Button
        Button{
            autoExclusive: false
            display: AbstractButton.IconOnly
            checkable: true
            background: Rectangle {
                implicitWidth: 81
                implicitHeight: 81
                color: d4Button.down ? "#17a81a" : "transparent"
                Image { source: "images/Button-w.svg"}
            }
            onClicked:{
                comp_name.text = qsTr("button d4")
                backend.selectComponent(15)
            }
        }
    }


    Image {
        id: image
        x: 0
        y: 0
        width: 1024
        height: 768
        source: "images/background.png"

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
                source: "images/Logo-MD1BP.svg"
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
                id: mode_combo
                x: 186
                y: 232
                width: 200
                height: 30
                wheelEnabled: false
                focusPolicy: Qt.StrongFocus
                enabled: true
                font.family: "Arial"
                model: ListModel{
                    ListElement{text: "Not Implemented"}
                    ListElement{text: "CC"}
                    ListElement{text: "Voice Note"}
                }
                onCurrentTextChanged: {
                    backend.setDeviceMode(currentText)
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

       /*     ComboBox {
                id: cc_combo
                x: 186
                y: 282
                width: 200
                height: 30
                wheelEnabled: false
                focusPolicy: Qt.StrongFocus
                enabled: true
                editable: true
                font.family: "Arial"
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
                    backend.setCcNumber(currentIndex)
                }
            }*/
            TextInput{
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
            }

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
                id: channel_combo
                x: 186
                y: 332
                width: 200
                height: 30
                wheelEnabled: false
                focusPolicy: Qt.StrongFocus
                enabled: true
                font.family: "Arial"
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

            TextInput {
                id: minval_txtinput
                x: 186
                y: 385
                width: 200
                height: 30
                color: "#d9d1d1"
                text: backend.minValue //text: rango.first.value
                inputMask: qsTr("")
                topPadding: 6
                font.bold: true
                selectionColor: "#d1d5d9"
                font.pixelSize: 14
                font.family: "Arial"
                inputMethodHints: Qt.ImhFormattedNumbersOnly

                onTextChanged:{
                    backend.setMinValue(text)
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

            TextInput {
                id: maxval_txtinput
                x: 186
                y: 435
                width: 200
                height: 30
                color: "#d9d1d1"
                text: backend.maxValue //text: rango.second.value
                inputMask: qsTr("")
                topPadding: 6
                font.bold: true
                selectionColor: "#d1d5d9"
                font.pixelSize: 14
                font.family: "Arial"
                inputMethodHints: Qt.ImhFormattedNumbersOnly

                onTextChanged:{
                    backend.setMaxValue(text)
                    rango.second.value = text
                }
            }

            Text {
                id: devicecode_txt
                x: 104
                y: 544
                width: 68
                color: "#e8ac5b"
                text: qsTr("device code")
                horizontalAlignment: Text.AlignRight
                font.bold: true
                font.pixelSize: 18
                font.family: "Arial"
            }

            TextInput {
                id: devicecode_txtinput
                x: 186
                y: 542
                width: 200
                height: 30
                color: "#d9d1d1"
                text: qsTr("0")
                inputMask: qsTr("")
                topPadding: 6
                font.bold: true
                selectionColor: "#d1d5d9"
                font.pixelSize: 14
                font.family: "Arial"
            }

            Button {
                id: button
                x: 160
                y: 628
                width: 125
                text: qsTr("sync")
                focusPolicy: Qt.TabFocus
                font.family: "Arial"

                onClicked: {
                    backend.syncHost2Device();
                }
            }

            RangeSlider {
                id: rango
                x: 129
                y: 482
                orientation: Qt.Horizontal
                stepSize: 1
                to: 127
                first.onValueChanged: {
                    backend.setMinValue(minval_txtinput.text)
                    minval_txtinput.text = first.value.toFixed(0)
                }
                second.onValueChanged:{
                    backend.setMaxValue(maxval_txtinput.text)
                    maxval_txtinput.text = second.value.toFixed(0)
                }
            }
        }

        Image {
            id: back_controler
            x: 90
            y: 60
            width: 400
            height: 393
            source: "images/back.svg"

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
            x: 244
            y: 638
            width: 200
            height: 30
            wheelEnabled: false
            focusPolicy: Qt.StrongFocus
            enabled: true
            font.family: "Arial"
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
        }

        Text {
            id: global_txt
            x: 104
            y: 644
            color: "#e8ac5b"
            text: qsTr("global channel")
            horizontalAlignment: Text.AlignRight
            font.bold: true
            font.pixelSize: 18
            font.family: "Arial"
        }

        Button {
            id: p1
            x: 107
            y: 517
            width: 33
            height: 43
            text: qsTr("1")
            checkable: false
            font.family: "Arial"
        }

        Button {
            id: p2
            x: 155
            y: 517
            width: 33
            height: 43
            text: qsTr("2")
            checkable: false
            font.family: "Arial"
        }

        Button {
            id: p3
            x: 203
            y: 517
            width: 33
            height: 43
            text: qsTr("3")
            checkable: false
            font.family: "Arial"
        }

        Button {
            id: p4
            x: 251
            y: 517
            width: 33
            height: 43
            text: qsTr("4")
            checkable: false
            font.family: "Arial"
        }

        Button {
            id: p5
            x: 299
            y: 517
            width: 33
            height: 43
            text: qsTr("5")
            checkable: false
            font.family: "Arial"
        }

        Button {
            id: p6
            x: 347
            y: 517
            width: 33
            height: 43
            text: qsTr("6")
            checkable: false
            font.family: "Arial"
        }

        Button {
            id: p7
            x: 395
            y: 517
            width: 33
            height: 43
            text: qsTr("7")
            checkable: false
            font.family: "Arial"
        }

        Button {
            id: p8
            x: 443
            y: 517
            width: 33
            height: 43
            text: qsTr("8")
            checkable: false
            font.family: "Arial"
        }

        Button {
            id: p9
            x: 107
            y: 570
            width: 33
            height: 43
            text: qsTr("9")
            checkable: false
            font.family: "Arial"
        }

        Button {
            id: p10
            x: 155
            y: 570
            width: 33
            height: 43
            text: qsTr("10")
            checkable: false
            font.family: "Arial"
        }

        Button {
            id: p11
            x: 203
            y: 570
            width: 33
            height: 43
            text: qsTr("11")
            checkable: false
            font.family: "Arial"
        }

        Button {
            id: p12
            x: 251
            y: 570
            width: 33
            height: 43
            text: qsTr("12")
            checkable: false
            font.family: "Arial"
        }

        Button {
            id: p13
            x: 299
            y: 570
            width: 33
            height: 43
            text: qsTr("13")
            checkable: false
            font.family: "Arial"
        }

        Button {
            id: p14
            x: 347
            y: 570
            width: 33
            height: 43
            text: qsTr("14")
            checkable: false
            font.family: "Arial"
        }

        Button {
            id: p15
            x: 395
            y: 570
            width: 33
            height: 43
            text: qsTr("15")
            checkable: false
            font.family: "Arial"
        }

        Button {
            id: p16
            x: 443
            y: 570
            width: 33
            height: 43
            text: qsTr("16")
            checkable: false
            font.family: "Arial"
        }

        /*Rectangle {
            id: rectangle1
            x: 0
            y: 728
            width: 1024
            height: 40
            color: "#000000"
            visible: true*/

            Text {
                id: text1
                x: 25
                y: 12
                color: "#e8ac5b"
                text: backend.deviceStatus //qsTr("Ready!")
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
       // }
    }
}
