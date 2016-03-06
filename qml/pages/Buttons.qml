/*


* Copyright 2014 Michael Johannes Muik

* This program is free software: you can redistribute it and/or modify it under
* the terms of the GNU General Public License version 3 as published by the
* Free Software Foundation. See http://www.gnu.org/copyleft/gpl.html the full
* text of the license.

*/

import QtQuick 2.1
import QtFeedback 5.0
import Sailfish.Silica 1.0
import QtMultimedia 5.0

import "config.js" as DB

Item{


id:control

smooth:true
property int soundanonn
property int hapticson //hapticsquestion

SoundEffect {
           id: soundUp
            source: "/usr/share/sounds/jolla-ambient/stereo/keyboard_letter.wav"
            muted : false
}

SoundEffect {
           id: soundDown
           source: "/usr/share/sounds/jolla-ambient/stereo/keyboard_option.wav"
           muted : false
       }




HapticsEffect {
      id: rumbleEffect
      attackIntensity: 0.0
      attackTime: 30
      intensity: 1
      duration: 70 // set up the duration here, in millisecond
      fadeTime: 10
      fadeIntensity: 0.0
  }

    Rectangle{
        id:schattenall
        opacity: 0.1
      //width: 450
      //height: 440
       width: screen.width*0.9
       height: screen.height*0.52

      color: "#000000"
    }

    Rectangle{
        id:downRECT
        width:schattenall.width/2-4
        height: schattenall.height-8
        color:"#748517"
        opacity:0.6
    }

    BackgroundItem {
        id:mousedown
        anchors.fill: downRECT;
        visible: true

        onPressed:        {
            minusshadow.color="white"
            minus.opacity=0
            minusshadow.opacity=1

            if(hapticson===1)
            {


           rumbleEffect.start();


            }

            if (soundanonn===1)
            {
            soundDown.play()
            }
            decrement()
            DB.fontsizer()

        }


onReleased:         {
            minusshadow.color="black"
            minus.opacity=1
            minusshadow.opacity=0.2

        }

    }

    Rectangle{
        id:minusshadow
        width: downRECT.width /2
        anchors.centerIn:downRECT
        height: minus.width/5
        color:"#000000"
        opacity: 0.2
        anchors.verticalCenterOffset: 8
        anchors.horizontalCenterOffset: 8
    }

    Rectangle{
        id:minus
        width: downRECT.width /2
        height: minus.width/5
        anchors.centerIn: downRECT
        color:"white"

    }

    Rectangle{
        id:upRECT
        anchors.left: downRECT.right
        width:schattenall.width/2-4
        height: schattenall.height-8
        color:"#177485"
        opacity:0.6
    }

    BackgroundItem {
        id:mouseup
        anchors.fill: upRECT;
        visible: true



        onPressed: {
            plus_mshadow.color="white"
            plusshadow.color="white"
            plus.opacity=0
            plus_m.opacity=0
            plus_mshadow.opacity=1
            plusshadow.opacity=1

            if (hapticson)
            {


            rumbleEffect.start();


            }


            if (soundanonn===1)
            {
            soundUp.play()
            }
            increment()
            DB.fontsizer()
        }

        onReleased:

        {
            plus_mshadow.color="black"
            plusshadow.color="black"
            plus.opacity=1
            plus_m.opacity=1
            plus_mshadow.opacity=0.2
            plusshadow.opacity=0.2
        }

    }


    Rectangle{
        id:plus_mshadow
        width: upRECT.width /2
        height: minus.width/5

        opacity: 0.2
        anchors.centerIn: upRECT
        color:"black"
        anchors.verticalCenterOffset: 8
        anchors.horizontalCenterOffset: 8
    }

    Rectangle{
        id:plusshadow
        height: upRECT.width /2
        width: minus.width/5


        opacity: 0.2
        anchors.centerIn: upRECT
        color:"black"
        anchors.verticalCenterOffset: 8
        anchors.horizontalCenterOffset: 8
    }

    Rectangle{
        id:plus_m
        width: upRECT.width /2
        height: minus.width/5
        anchors.centerIn: upRECT
        color:"white"
    }

    Rectangle{
        id:plus
        height: upRECT.width /2
        width: minus.width/5
        anchors.centerIn: upRECT
        color:"white"

    }

}
