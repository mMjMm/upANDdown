
/*


* Copyright 2014 Michael Johannes Muik

* This program is free software: you can redistribute it and/or modify it under
* the terms of the GNU General Public License version 3 as published by the
* Free Software Foundation. See http://www.gnu.org/copyleft/gpl.html the full
* text of the license.

*/


import QtQuick 2.1
import Sailfish.Silica 1.0


Page {

    id: page

    Rectangle {

        id:root //it's a good idea to name it always root so I'm able to remember it everytime ;)
        width: Screen.width ; height: Screen.height
        color:"#841773"
        opacity: 0.4
    }


    Column {
        id: column
        width: page.width
        spacing: Theme.paddingLarge
        PageHeader {
            title: qsTr("about upanddown")
        }

        Label {
            x: Theme.paddingLarge
            anchors.topMargin: 30
            text: qsTr("upanddown ver.0.8.5 ")
            color: Theme.secondaryHighlightColor
            font.pixelSize: Theme.fontSizeExtraLarge
        }
    }

    Image {
        id: logo
        source: "upanddown.png"
        anchors.horizontalCenter: parent.horizontalCenter
        y: 215
    }

    Text {
        id: appName
        anchors.horizontalCenter: parent.horizontalCenter
        y: 415
        font.pointSize: 18
        color: "white"

    }


    Text {
        id:describtion0
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: appName.bottom
        font.pointSize: 20
        anchors.topMargin: 160
        text: "Simple up and down counter by "
        color: "white"

    }

    Text {
        id:describtion1
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: describtion0.bottom
        font.pointSize: 12
        anchors.topMargin: 15
        text: "michael johannes muik"
        color: "white"

    }
    Text {
        id:describtion2
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: describtion1.bottom
        font.pointSize: 12
        anchors.topMargin: 5
        text: "with haptic and acoustic feedback"
        color: "white"

    }

    Text {
        id:describtion3
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: describtion2.bottom
        font.pointSize: 12
        anchors.topMargin: 5
        text: " reset and save function "
        color: "white"

    }

    Text {
        id:describtion4
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: describtion3.bottom
        font.pointSize: 12
        anchors.topMargin: 5
        text: " Count whatever you want (for example yellow binbags ;-) )"
        color: "white"

    }

    Text {
        id:describtion5
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: describtion4.bottom
        font.pointSize: 20
        anchors.topMargin: 5
        text: "source code"
        color: Theme.highlightColor

        MouseArea {
            id : buttonMouseArea2
            anchors.fill : parent
            onClicked: Qt.openUrlExternally("https://github.com/mMjMm/upANDdown")
        }

    }
    Text {
        id:describtion6
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: describtion5.bottom
        font.pointSize: 12
        anchors.topMargin: 10
        text: "For feedback, bugreports, feature requests or <br> donations please use the email-adress below:"
        color: "white"

    }

    Text {
        id:mailto
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: describtion6.bottom
        font.pointSize: 12
        anchors.topMargin: 5
        text:"muiki@mur.at"
        color: Theme.highlightColor

        MouseArea {
            id : buttonMouseArea
            anchors.fill : parent
            onClicked: Qt.openUrlExternally("mailto:muiki@mur.at?subject=Johannes, about your upanddown application...")
        }
    }

}





