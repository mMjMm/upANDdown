
/*

  known bugs:
  :)font size in the cover view (only refresh when you change from app to cover view...)


* Copyright 2014 Michael Johannes Muik

* This program is free software: you can redistribute it and/or modify it under
* the terms of the GNU General Public License version 3 as published by the
* Free Software Foundation. See http://www.gnu.org/copyleft/gpl.html the full
* text of the license.

*/


import QtQuick 2.1
import Sailfish.Silica 1.0
import "config.js" as DB

Page{

    id: mainPage

    property double count
    property double step:1
    property string namecounterer: " "

    property  var lockhaptic
    property  var lockhaptics

    property  var lockport
    property  var locksound
    property  var locksoundd


    property int fontsize:200
    property int coverfontsize:180
    property string laenge

    property var orientat: Orientation.All

    allowedOrientations : Orientation.Portrait

    //  Function to change to Portrait mode only
    function lockTOport() {
        orientat = Orientation.Portrait
    }
    //  States for Portrait and Landscape mode (and place the buttons accordingly
    //  remember PropertyChanges vs AnchorChanges!
    // state: (Orientation.Portrait = isPortrait) ? "portrait" : "landscape"
    state: "portrait"
    states: [
        State {
            name: "landscape"
            PropertyChanges { target: root; width:Screen.height; height:Screen.width }

            AnchorChanges{
                target:buttons; anchors.horizontalCenter: root.horizontalCenter;  anchors.verticalCenter: root.verticalCenter;
            }

            PropertyChanges {
                target: buttons;  anchors.verticalCenterOffset: -Screen.width/3

            }

            AnchorChanges { target: label;    anchors.horizontalCenter: root.horizontalCenter   }

            PropertyChanges{
                target: label; anchors.horizontalCenterOffset:-240          }

        },

        State {

            name: "portrait"
            PropertyChanges {
                target: root; width:Screen.width; height:Screen.height
            }

            AnchorChanges{
                target:buttons; anchors.horizontalCenter: root.horizontalCenter;  anchors.verticalCenter: root.verticalCenter;
            }

            PropertyChanges {
                target: buttons; anchors.horizontalCenterOffset: (-Screen.width/2)*0.9; anchors.verticalCenterOffset: -Screen.height/8
                //target: buttons; anchors.horizontalCenterOffset: -450/2; anchors.verticalCenterOffset: -Screen.height/8
            }

            AnchorChanges { target: label; anchors.horizontalCenter: root.horizontalCenter; anchors.bottom: buttons.top;

            }
        }
    ]



    Component.onCompleted: {
        // Initialize the database
        DB.initialize();
        DB.fontsizer();
        lockhaptic= DB.getselecthaptic();
        lockport=DB.getselectPORT();
        locksound=DB.getselectSOUND();

        //check if haptic, sound, and port is selected (or for the first start of the app give it a value

        if (lockhaptic===undefined)
        {

            //console.debug("select ist undefiend")
            DB.sethapticseins();
            lockhaptic=1
        }

        if (lockport===undefined)
        {
            //   console.debug("lockport ist undefiend")
            DB.setlockportnull();
        }

        //   lockhaptic= DB.getselecthaptic();
        lockport=DB.getselectPORT();
        lockhaptics=lockhaptic;

        if(lockport===1)
        {
            lockTOport();

        }

        if (locksound===undefined)
        {

            //  console.debug("soundport ist undefiend")
            DB.setlocksoundnull();

        }

        locksoundd=DB.getselectSOUND();
    }

    //count functions:
    function increment() {
        if (step % 1 != 0) //check if it is a decimal number
        {
            count = count + step
            count= count.toFixed(1);
        }

        else
        {
            count = count + step
        }
    }

    function decrement() {


        if (step % 1 != 0)
        {

            count = count - step
            count= count.toFixed(1);
        }
        else
        {
            count = count - step
        }

    }

    //Reset counter function
    function reset() {
        remorse.execute("Reset Counter", function() { count=0 ;fontsize=200; namecounterer=" "})
    }

    //reset counter animation?
    RemorsePopup { id: remorse }

    SilicaFlickable {

        anchors.fill: parent
        contentHeight: parent.height

        PullDownMenu {

            MenuItem {
                text: qsTr("save as")
                onClicked: {
                    pageStack.push(Qt.resolvedUrl("SaveAs.qml"))
                }
            }

            MenuItem {
                text: qsTr("counted")
                onClicked: {
                    pageStack.push(Qt.resolvedUrl("Counts.qml"))
                }
            }

            MenuItem {
                text: "settings"
                onClicked: {

                    pageStack.push(Qt.resolvedUrl("Settings.qml"))
                }
            }
            //reset COUNTER menu
            MenuItem {
                text: qsTr("reset counter")
                onClicked: {
                    //rufe reset funktion auf!
                    reset()
                }
            }
        }
        Rectangle {

            id:root //it's a good idea to name it always root so I'm able to remember it everytime ;)
            color:"#841773"
            border.color: "black"
            opacity: 0.6
        }

        Column
        {
            id: column
            width: root.width
            spacing:10

            PageHeader
            {
                title: qsTr("upanddown")
            }
        }

        Label {
            id:textfade
            anchors.top: column.bottom
            anchors.left: root.left
            anchors.leftMargin: Theme.paddingLarge
            text:namecounterer.substring(0,22);
            //text: qsTr(namecounterer)
            color: Theme.secondaryHighlightColor
            font.pixelSize: Theme.fontSizeLarge
        }

        OpacityRampEffect {
            sourceItem: textfade
            direction: OpacityRamp.LeftToRight
            offset:0.7
        }

        Text{
            id:label
            font.family: Theme.fontFamily
            color:"white"
            font.pixelSize: fontsize
            text:count//.toFixed(1)
        }

        //import from Buttons.qml
        Buttons{
            id:buttons
            soundanonn:locksoundd
            hapticson: lockhaptics
        }
    }
}










