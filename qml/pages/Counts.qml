/*
players.qml


this page is used to display the players and add new

2014

*/

import QtQuick 2.1
import Sailfish.Silica 1.0
import "config.js" as DB

Page{
    id:page

    function reset() {
        remorse.execute("DELETE ALL COUNTS", function() { DB.dropTables() ;pageStack.replace(Qt.resolvedUrl("Counts.qml"))})

    }

    //reset counter animation?
    RemorsePopup { id: remorse }

    //Emitted after component "startup" has completed. This can be used to execute script code at startup, once the full QML environment has been established.
    Component.onCompleted: {
        // Initialize the database
        DB.initialize();
        DB.getCountName();

    }


    ///////////////////////////////////////////////
    //sortby functions
    ///////////////////////////////////////////////

    function sortByName(){
        mycounts.clear();
        DB.sortByName();
    }
    function sortByDate(){
        mycounts.clear();
        DB.getCountName();
    }

    Rectangle {
        //it's a good idea to name it always root so I'm able to remember it everytime ;)
        id:root
        width: Screen.width ; height: Screen.height
        color:"#841773"
        opacity: 0.5
    }

    SilicaFlickable {
        anchors.fill: parent

        PullDownMenu{
            MenuItem {
                text: qsTr("delete all")
                onClicked: {
                    reset();
                }
            }
            MenuItem {
                text: qsTr("sort by name")
                onClicked: {
                    sortByName();
                }
            }
            MenuItem {
                text: qsTr("sort by date")
                onClicked: {
                    sortByDate();
                }
            }
        }

        ListModel {
            id:mycounts
        }
        //The SilicaListView type provides a ListView with Sailfish-specific behaviors and additional properties.

        SilicaListView {
            id:listView
            spacing:8
            anchors.fill: parent

            clip: true
            boundsBehavior: Flickable.DragAndOvershootBounds
            snapMode: ListView.SnapToItem

            model: mycounts
            VerticalScrollDecorator { flickable: listView }
            HorizontalScrollDecorator { flickable: listView }

            //DISPLAY HEADER
            header: PageHeader {
                title: qsTr("Counted")
            }

            //DISPLAYED when no players added
            ViewPlaceholder {
                enabled: listView.count == 0
                text: qsTr("so far nothing counted")
                hintText: qsTr("count something, please!")
            }


            delegate:  ListItem {
                id: delegate

                contentWidth: width; // flickable content width is its own width, scroll only vertically
                contentHeight: layout.height;

                menu: contextMenuComponent

                //DELETE FUNKTION (löscht gewählten namen aus der datenbank)

                function remove() {
                    delegate.remorseAction("Deleting",function() { DB.deletecount(name) ; mycounts.remove(index)})
                }



                function resume() {
                    //  pageStack.pop( Qt.resolvedUrl("Counts.qml"),{count: counterer});
                    DB.fontsizer();
                    pageStack.navigateBack(mainPage.count=counterer, mainPage.namecounterer=name)
                }

                ListView.onRemove: animateRemoval(delegate)

                Column{
                    id:layout
                    Rectangle {
                        id:countsrect
                        width: root.width -10
                        height: mylabel.height+ nametext.height
                        color: index % 2 == 0 ?"#208d22c5" : "#308d22c5"
                        radius:3

                        Text{
                            id:mylabel
                            x: Theme.paddingLarge
                            font.pixelSize: Theme.fontSizeLarge
                            font.bold: true
                            text:counterer
                            opacity:1
                            color: delegate.highlighted ? Theme.highlightColor : Theme.primaryColor
                        }
                        Text{
                            id:nametext
                            anchors.top:mylabel.bottom
                            width: Screen.width-10
                            x: Theme.paddingLarge
                            wrapMode: "WordWrap"
                            opacity:1
                            text: name
                            color: delegate.highlighted ? Theme.highlightColor : Theme.primaryColor
                        }
                    }
                    //CONTEXT MENÜ
                    Component {
                        id: contextMenuComponent
                        ContextMenu {
                            id:contextMenu
                            width: root.width -10
                            MenuItem {
                                text: qsTr("Resume")
                                onClicked:resume();
                            }

                            MenuItem {
                                text: qsTr("Delete")
                                onClicked:remove()

                            }
                        }
                    }
                }
            }
        }
    }
}








