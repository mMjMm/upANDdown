import QtQuick 2.1
import Sailfish.Silica 1.0

Item
{
    id:textcount


    Text
    {
        id:labelshadow
        opacity: 0.2
        font.family: Theme.fontFamily
        color:"black"
        font.pixelSize: 180
        text:count

}

    Text
    {
        id:label
        anchors.centerIn: labelshadow
        anchors.horizontalCenterOffset: -8
        anchors.verticalCenterOffset: -8
        font.family: Theme.fontFamily
        color:"white"
        font.pixelSize: 180
        text:count

    }





}
