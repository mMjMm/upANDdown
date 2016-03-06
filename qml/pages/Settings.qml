

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

    property double step
    property double stepperr:1

    property double startvalue

    property var  lockhaptic
    property  int  lockhaptics

    property var locksound
    property int locksoundd

    //Emitted after component "startup" has completed. This can be used to execute script code at startup, once the full QML environment has been established.

    Component.onCompleted: {
        // Initialize the database
        DB.initialize();

        lockhaptic= DB.getselecthaptic()
        locksound=DB.getselectSOUND();
        lockhaptics=lockhaptic;
        locksoundd=locksound
    }

    function hapticswitched(){

        if(hapticswitch.checked == true )
        {
           // console.log("gedrückt und gecheckt")
            lockhaptics=1;

        }
        if(hapticswitch.checked == false )
        {
            //console.log("nicht eins sondern null")
            lockhaptics=0;
        }

    }

    function soundlockswitched(){

        if(soundlockswitch.checked == true )
        {
            //console.log("gedrückt und gecheckt")
            locksoundd=1;
        }
        if(soundlockswitch.checked == false )
        {
           // console.log("nicht eins sondern null")
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
                    minimumValue:0.1
                    maximumValue:10
                    stepSize: 0.1
                    width: parent.width+10
                    valueText: value.toFixed(1)

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
                  //  automaticCheck:false
                    checked:lockhaptic
                    text: "Haptic Feedback"
                    description: "Enable/disable haptic feedback"

                    onClicked: {

                            hapticswitched();

                    }

                }

                TextSwitch {
                    id:soundlockswitch
                    //  automaticCheck:false
                    checked:locksound
                    text: "Audio Feedback"
                    description: "Enable/disable Audio feedback"

                    onClicked: {

                        soundlockswitched();
                    }

                }

            }
        }

    }

    onAccepted: {
        mainPage.step =stepperr;
        mainPage.count =startvalue;
        mainPage.lockhaptics=lockhaptics;
        mainPage.locksoundd=locksoundd;


            if(hapticswitch.checked == true )
            {
                //console.log("gedrückt und gecheckt")
                lockhaptics=1;
                DB.sethapticseins();

            };
            if(hapticswitch.checked == false )
             {
                //console.log("nicht eins sondern null")
                lockhaptics=0;
                DB.unsethaptics();
            };


        if (soundlockswitch.checked == true )
        {
            locksoundd=1;
            DB.setlocksoundeins();
        };
        if(soundlockswitch.checked == false )
        {
            locksoundd=0;
            DB.setlocksoundnull();
        };
    }

    onRejected:
    {

    }
}







