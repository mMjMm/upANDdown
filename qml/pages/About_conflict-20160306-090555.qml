
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
    SilicaFlickable {
        anchors.fill: parent
        contentHeight: parent.height
    Column {
        id: column
        width: page.width
        spacing:Theme.paddingLarge
        PageHeader {
            title: qsTr("about upanddown")
        }

        Label {
            id:upanddownvers
            x: Theme.paddingLarge
            anchors.topMargin: Theme.paddingLarge
            text: qsTr("upanddown ver.0.8.1 ")
            color: Theme.secondaryHighlightColor
            font.pixelSize: Theme.fontSizeExtraLarge
        }

        Image {
            id: logo
            anchors.topMargin: Theme.paddingLarge
            source: "upanddown.png"
            anchors.horizontalCenter: parent.horizontalCenter
            //anchors.top:column.baseline
        }

        Column {
            spacing:3
            anchors.horizontalCenter: parent.horizontalCenter

        Text {
            id: appName
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 18
            color: "white"
        }

        Text {
            id:describtion0
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: Theme.fontSizeLarge
            text: "Simple up and down counter by "
            color: "white"

        }

        Text {
            id:describtion1
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: Theme.fontSizeExtraSmall-3
            text: "michael johannes muik"
            color: "white"

        }
        Text {
            id:describtion2
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: Theme.fontSizeExtraSmall-3
            text: "with acoustic feedback reset and save function "
            color: "white"

        }



        Text {
            id:describtion4
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: Theme.fontSizeExtraSmall-3
            text: "Count whatever you want (for example yellow binbags!)"
            color: "white"

        }

        Text {
            id:describtion5
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: Theme.fontSizeLarge
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
            font.pixelSize: Theme.fontSizeExtraSmall-3
            anchors.topMargin: 10
            text: "For feedback, bugreports, feature requests or <br> donations please use the email-adress below:"
            color: "white"

        }

        Text {
            id:mailto
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: Theme.fontSizeLarge
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


        Image {
            id: flattr
            anchors.topMargin: Theme.paddingLarge
            source: "flattr.png"
            anchors.horizontalCenter: parent.horizontalCenter
            //anchors.top:column.baseline

            MouseArea {
                id : flattrMouseArea
                anchors.fill : parent
                onClicked: Qt.openUrlExternally("flattr.com/profile/m_j_m")
            }
        }
    }
    }




}




