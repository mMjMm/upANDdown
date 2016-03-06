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
                text: "delete all"
                onClicked: {
                    reset()
                }
            }
        }

        ListModel {
            id:mycounts
        }

        //The SilicaListView type provides a ListView with Sailfish-specific behaviors and additional properties.

        SilicaListView {

            id:listView
            spacing:30
            anchors.fill: parent
            //  width: 480; height: 800
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
                text: "so far nothing counted"
                hintText: "count something, please!"
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
                    Text{
                        id:mylabel
                        x:10
                        font.pointSize: 24
                        font.bold: true
                        text:counterer
                        color: delegate.highlighted ? Theme.highlightColor : Theme.primaryColor


                    }
                    Text{

                        id:nametext
                        width: Screen.width
                        x:10
                        wrapMode: "WordWrap"
                        text: name
                        color: delegate.highlighted ? Theme.highlightColor : Theme.primaryColor

                    }


                    //CONTEXT MENÜ
                    Component {
                        id: contextMenuComponent
                        ContextMenu {
                            id:contextMenu

                            MenuItem {

                                text: "Resume"

                                onClicked:resume();


                            }

                            MenuItem {

                                text: "Delete"

                                onClicked:remove()

                            }
                        }
                    }
                }
            }
        }
    }
}








