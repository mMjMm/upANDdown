
/*


* Copyright 2014 Michael Johannes Muik

* This program is free software: you can redistribute it and/or modify it under
* the terms of the GNU General Public License version 3 as published by the
* Free Software Foundation. See http://www.gnu.org/copyleft/gpl.html the full
* text of the license.

*/


import QtQuick 2.1
import Sailfish.Silica 1.0
import "config.js" as DB

Dialog{


id:page

 property string placehodertext
 property string edittext



    Component.onCompleted: {
        // Initialize the database
        DB.initialize();


        if (mainPage.namecounterer===" ")
        {
            placehodertext= "name what ever you counted"
        }

        else{
            edittext=mainPage.namecounterer
        }
    }







    Rectangle {
//it's a good idea to name it always root so I'm able to remember it everytime ;)
        id:root
        width: Screen.width ; height: Screen.height
        color:"#841773"
        opacity: 0.5

    }





    Column {
        id: column

        width: root.width
        spacing: 35

        DialogHeader {
            acceptText: "Save as"
        }
    }

    Text{
        id:label
        anchors.top: parent.top
        anchors.topMargin: 100
        anchors.horizontalCenter: root.horizontalCenter
        font.family: Theme.fontFamily
        color:"white"
        font.pixelSize: mainPage.fontsize
        text:mainPage.count
    }



    TextField {


        id: namecount

        anchors.top: parent.top
        anchors.topMargin: 350
        width: parent.width


        implicitWidth: _editor.implicitWidth + Theme.paddingSmall
                           + Theme.itemSizeSmall*2  // width of two icons
            height: Math.max(Theme.itemSizeMedium, _editor.height + Theme.paddingMedium + Theme.paddingSmall)

            focusOutBehavior: FocusBehavior.ClearPageFocus

            font {
                pixelSize: Theme.fontSizeSmall
                family:    Theme.fontFamily

            }

            textLeftMargin: Theme.itemSizeSmall + Theme.paddingMedium
            textRightMargin: Theme.itemSizeSmall + Theme.paddingMedium
            textTopMargin: height/2 - _editor.implicitHeight/2
            labelVisible: false




        placeholderText:placehodertext
        text:edittext
        focus: true




    //    inputMethodHints: Qt.ImhNoPredictiveText

            background: Component {
                Item {
                    anchors.fill: parent
                    IconButton {
                                  id: clearButton
                                  anchors {
                                      right: parent.right
                                      rightMargin: Theme.paddingLarge
                                  }
                                  width: icon.width
                                  height: parent.height
                                  icon.source: "image://theme/icon-m-clear"

                                  enabled: namecount.enabled

                                //  opacity: namecount.text.length > 0 ? 1 : 0
                                  Behavior on opacity {
                                      FadeAnimation {}
                                  }

                                  onClicked: {
                                      namecount.text = ""
                                      namecount._editor.forceActiveFocus()
                                  }
                              }
                          }





}

    }




    onAccepted: {
        DB.insertCOUNTNAME(namecount.text, mainPage.count);
        mainPage.namecounterer=namecount.text

    }


}
