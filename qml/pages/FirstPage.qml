
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

    property int count
    property int step:1

    property  var lockhaptic
    property  int lockhaptics

    property  var lockport


    property  var locksound
    property  int locksoundd


    property int fontsize:200
    property int coverfontsize:180
    property string laenge

    property var orientat: Orientation.All

    allowedOrientations : orientat

    //  Function to change to Portrait mode only
    function lockTOport() {
        orientat = Orientation.Portrait
    }

    //  States for Portrait and Landscape mode (and place the buttons accordingly
    //  remember PropertyChanges vs AnchorChanges!


    state: (Orientation.Portrait = isPortrait) ? "portrait" : "landscape"

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

                target: buttons; anchors.horizontalCenterOffset: -450/2; anchors.verticalCenterOffset: -Screen.height/10
            }

            AnchorChanges { target: label; anchors.horizontalCenter: root.horizontalCenter; anchors.bottom: buttons.top;

            }
        }
    ]



    Component.onCompleted: {

        // Initialize the database
        DB.initialize();

        lockhaptic= DB.getselecthaptic();
        lockport=DB.getselectPORT();
        locksound=DB.getselectSOUND();


        //check if haptic, sound, and port is selected (or for the first start of the app give it a value

        if (lockhaptic===undefined)
        {

            console.debug("select ist undefiend")
            DB.sethapticseins();

         //   lockhaptic=1
        }

        if (lockport===undefined)
        {

         //   console.debug("lockport ist undefiend")
            DB.setlockportnull();

        }

        lockhaptic= DB.getselecthaptic();
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

        count = count + step

    }

    function decrement() {

        count = count - step

    }


    //resize the font

    function fontsizer(){

        //convert the number count to a string to use the toString() function
        var num =count;

        var n=num.toString();


        if ( n.length == 2)

        { coverfontsize=130;  }

        if ( n.length == 3)

        { coverfontsize=100;  }

        if ( n.length == 4)

        { coverfontsize=85;  }

        if ( n.length == 5)

        { coverfontsize=80;  }

        if ( n.length == 6)

        { fontsize=160;
            coverfontsize=30;
        }

        if ( n.length == 7)

        {fontsize=140;}

        if ( n.length == 8)

        {fontsize=120;}

        if ( n.length == 9)
        {fontsize=100;}

    }


    //Reset counter function
    function reset() {
        remorse.execute("Reset Counter", function() { count=0 ;fontsize=200})
    }

    //reset counter animation?
    RemorsePopup { id: remorse }

    SilicaFlickable {


        anchors.fill: parent
        contentHeight: parent.height

        PullDownMenu {


            MenuItem {
                text: "save"
                onClicked: {

                    //
                }
            }

            MenuItem {
                text: "counted"
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
                text: "reset counter"
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
            spacing: 35
            PageHeader
            {
                title: qsTr("upanddown")
            }
        }

        Text{
            id:label
            font.family: Theme.fontFamily
            color:"white"
            font.pixelSize: fontsize
            text:count
        }

        //import from Buttons.qml
        Buttons{
            id:buttons
              soundanonn:locksoundd
              hapticson: lockhaptics
        }
    }
}











