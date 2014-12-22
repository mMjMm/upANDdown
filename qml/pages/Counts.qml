
/*


* Copyright 2014 Michael Johannes Muik

* This program is free software: you can redistribute it and/or modify it under
* the terms of the GNU General Public License version 3 as published by the
* Free Software Foundation. See http://www.gnu.org/copyleft/gpl.html the full
* text of the license.

*/


import QtQuick 2.1
import Sailfish.Silica 1.0



Page{

    id: page

    Rectangle {

        id:root //it's a good idea to name it always root so I'm able to remember it everytime ;)
        width: Screen.width ; height: Screen.height
        color:"#841773"
        opacity: 0.5

    }


Column
{
    id: column
    width: page.width
    spacing: Theme.paddingLarge
    PageHeader
    {
        title: qsTr("counted")
    }
}
}
