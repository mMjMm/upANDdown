/*


* Copyright 2014 Michael Johannes Muik

* This program is free software: you can redistribute it and/or modify it under
* the terms of the GNU General Public License version 3 as published by the
* Free Software Foundation. See http://www.gnu.org/copyleft/gpl.html the full
* text of the license.

*/

import QtQuick 2.1
import Sailfish.Silica 1.0
//import QtFeedback 5.0
import "config.js" as DB




Dialog{

    property int step
    property int stepperr:1

    property int startvalue

    property var lockhaptic
    property int lockhaptics


    property var lockport

    property var locksound
    property var locksoundd



    //Emitted after component "startup" has completed. This can be used to execute script code at startup, once the full QML environment has been established.
    Component.onCompleted: {
        // Initialize the database
        DB.initialize();

        lockhaptic= DB.getselecthaptic();


        lockhaptics= DB.getselecthaptic();

        lockport=DB.getselectPORT();

        locksound=DB.getselectSOUND();
        locksoundd=locksound;
    }


    function hapticswitched(){

        if(hapticswitch.checked == true)
        {
           // console.log("gedrückt und gecheckt")
            DB.sethaptics();
            lockhaptics=1;
        }
        else{
            //console.log("nicht eins sondern null")
            DB.unsethaptics();
            lockhaptics=0;
        }
    }





    function lockswitched(){


        if(lockswitch.checked == true)
        {
            //console.log("gedrückt und gecheckt")

            DB.setlockporteins();
            mainPage.orientat = Orientation.Portrait

        }
        else{

            //console.log("nicht eins sondern null")


            DB.setlockportnull();
            mainPage.orientat = Orientation.All


        }

    }


    function soundlockswitched(){


        if(soundlockswitch.checked == true)
        {
            //console.log("gedrückt und gecheckt")


            DB.setlocksoundeins();

            locksoundd=1;

        }
        else{

            //console.log("nicht eins sondern null")
            DB.setlocksoundnull();
            locksoundd=0;


        }

    }



    SilicaFlickable {


        anchors.fill: parent
        contentHeight: parent.height

        Rectangle {

            id:root //it's a good idea to name it always root so I'm able to remember it everytime ;)
            width: Screen.width ; height: Screen.height
            color:"#841773"
            opacity: 0.5

        }


        PullDownMenu {


            MenuItem {
                text: "about"
                onClicked: {    pageStack.push(Qt.resolvedUrl("About.qml"), {dataContainer: root})
                }

            }

        }




        Column {
            id: column

            width: root.width
            spacing: 35

            DialogHeader {
                acceptText: "Settings"
            }

            Column {
                id:colummm


                // No spacing in this column
                width: parent.width

                Label{
                    anchors.horizontalCenter:colummm.horizontalCenter
                    anchors.horizontalCenterOffset: -140
                    font.family: Theme.fontFamily
                    color:"white"
                    font.pixelSize: Theme.fontSizeMedium
                    text:"Change step size:"
                }

                Slider {
                    id: sliderer
                    value: mainPage.step
                    minimumValue:1
                    maximumValue:10
                    stepSize: 1
                    width: parent.width+10
                    valueText: value.toFixed(0)

                    onValueChanged: {
                        stepperr = value
                    }

                    label: "Step Size"
                }


                Label{
                    anchors.horizontalCenter:colummm.horizontalCenter
                    anchors.horizontalCenterOffset: -140
                    font.family: Theme.fontFamily
                    color:"white"
                    font.pixelSize: Theme.fontSizeMedium
                    text:"Set start value:"
                }

                Slider {
                    id: slider_start
                    value:mainPage.count
                    minimumValue:-1000
                    maximumValue:1000
                    stepSize: 10
                    width: parent.width+10
                    valueText: value.toFixed(0)

                    onValueChanged: {
                    startvalue = value
                    }

                    label: "Start Value"
                }

                TextSwitch {
                    id:hapticswitch
                    checked:lockhaptic
                    text: "Haptic Feedback"
                    description: "Enable/disable haptic feedback"

                    onCheckedChanged: {

                        hapticswitched();
                    }

                }

                TextSwitch {
                    id:soundlockswitch
                    checked:locksound
                    text: "Audio Feedback"
                    description: "Enable/disable Audio feedback"
                    onCheckedChanged: {
                        soundlockswitched();
                   //     setze eine var true... und unten bei on acceptet frageich ob das hier...

                    }
                }

                TextSwitch {
                    id:lockswitch
                    checked:lockport
                    text: "Lock Portrait"
                    description: "Force portrait mode"
                    onCheckedChanged: {
                        lockswitched();

                    }
                }
            }
        }
    }

    onAccepted: {
        mainPage.step =stepperr;mainPage.count =startvalue; mainPage.locksoundd=locksoundd; mainPage.lockhaptics=lockhaptics


    }

onRejected:
{


}
}








