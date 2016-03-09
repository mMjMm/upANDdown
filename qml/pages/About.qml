
/*


* Copyright 2014 Michael Johannes Muik

* This program is free software: you can redistribute it and/or modify it under
* the terms of the GNU General Public License version 3 as published by the
* Free Software Foundation. See http://www.gnu.org/copyleft/gpl.html the full
* text of the license.

*/


import QtQuick 2.2
import Sailfish.Silica 1.0

Page {

    id: page

    Rectangle{
        color:"#841773"
        opacity: 0.4
        width: Screen.width
        height: Screen.height
    }



    Item {
        id:root //it's a good idea to name it always root so I'm able to remember it everytime ;)
        width: Screen.width ; height: logo.height+column2.height

        Column {
            id: column2
            width: page.width
            spacing:Theme.paddingMedium
            PageHeader {
                title: qsTr("about upanddown")
            }
            Label {
                id:upanddownvers
                x: Theme.paddingLarge
                text: qsTr("upanddown ver.0.9.1 ")
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeExtraLarge
            }

        }

        Image {
            id: logo
            width: 120; height: 120
            source: "upanddown.png"
            anchors.top:column2.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin:Theme.paddingLarge
        }

    }

    Item{
        id:myitem
        width: Screen.width ; height: Screen.height
        anchors.top:root.bottom
        anchors.topMargin: Theme.paddingLarge+30

        Label {
            id:describtion0
            font.pixelSize: Theme.fontSizeMedium
            text:qsTr("Simple up and down counter by Michael Johannes Muik. With outstanding features like acoustic feedback, reset and save function. Count whatever you want (for example yellow binbags!) ")
            color: "white"
            horizontalAlignment:Text.AlignHCenter
            wrapMode: Text.WordWrap
            anchors {
                left: parent.left
                right:parent.right
                margins: Theme.paddingLarge
            }
        }
        Text {
            id:describtion1
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: describtion0.bottom
            anchors.topMargin: Theme.paddingLarge
            font.pixelSize: Theme.fontSizeLarge
            text: "source code"
            color: Theme.highlightColor
            MouseArea {
                id : buttonMouseArea2
                anchors.fill : parent
                onClicked: Qt.openUrlExternally("https://github.com/mMjMm/upANDdown")
            }
        }
        Label {
            id:describtion3
            anchors.top: describtion1.bottom
            anchors.topMargin: Theme.paddingLarge
            font.pixelSize: Theme.fontSizeExtraSmall-3
            text:qsTr( "For feedback, bugreports, feature requests or donations please use the email-adress below or press the flattr-button:")
            horizontalAlignment:Text.AlignHCenter
            color: "white"
            wrapMode: Text.WordWrap
            anchors {
                left: parent.left
                right:parent.right
                margins: Theme.paddingLarge
            }
        }


        Text {
            id:mailto
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: Theme.fontSizeLarge
            anchors.top: describtion3.bottom
            anchors.topMargin: Theme.paddingLarge
            text:qsTr("muiki@mur.at") //myEMAIL
            color: Theme.highlightColor

            MouseArea {
                id : buttonMouseArea
                anchors.fill : parent
                onClicked: Qt.openUrlExternally("mailto:muiki@mur.at?subject=Johannes, about your upanddown application...")
            }
        }


        Image {
            id: flattr
            anchors.top: mailto.bottom
            anchors.topMargin: Theme.paddingLarge
            source: "flattr.png"
            anchors.horizontalCenter: parent.horizontalCenter
            MouseArea {
                id : flattrbutton
                anchors.fill : flattr
                onClicked: Qt.openUrlExternally("https://flattr.com/profile/m_j_m")
            }
        }
    }
}




//color:"#841773"
//opacity: 0.4

