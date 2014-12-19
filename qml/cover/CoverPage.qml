import QtQuick 2.1
import Sailfish.Silica 1.0

CoverBackground {
    id:parent


    Rectangle {
        anchors.fill: parent
        color:"#841773"
        opacity: 0.5

    }
    PageHeader{
        title:"upanddown"
    }

    Label {
    id: countLabel
    anchors.centerIn: parent
    text: mainPage.count
    font.pixelSize: mainPage.coverfontsize
    }


    CoverActionList {
        id: coverAction

        CoverAction {
            iconSource:"harbour-icon-cover-up.png"
           onTriggered: {
               mainPage.increment()
           }

        }

        CoverAction {
            iconSource: "harbour-icon-cover-down.png"

            onTriggered: {
                mainPage.decrement()
            }

        }
    }
}

