
/*

* Copyright 2014 Michael Johannes Muik
* This program is free software: you can redistribute it and/or modify it under
* the terms of the GNU General Public License version 3 as published by the
* Free Software Foundation. See http://www.gnu.org/copyleft/gpl.html the full
* text of the license.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR
  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

//current count mit date!
//config.js

.import QtQuick.LocalStorage 2.0 as LS


// First, let's create a short helper function to get the database connection
function getDatabase() {
    return LS.LocalStorage.openDatabaseSync("upanddown", "2.0", "StorageDatabase", 100000);}






function initialize() {
    var db = getDatabase();

    db.transaction(
                function(tx) {
                    tx.executeSql('CREATE TABLE IF NOT EXISTS settings(Haptic NUMBER, PortLock NUMBER,  SoundLock NUMBER)');
                    tx.executeSql('CREATE TABLE IF NOT EXISTS currentCount(CountName, Count NUMBER)');

                });
}




function sethapticseins(){

    var db = getDatabase();

     db.transaction(
                function(tx) {
                 var rs=   tx.executeSql("INSERT INTO settings (Haptic) VALUES (1); ");

                }
                )
}





function setLockPort(){

    var db = getDatabase();

     db.transaction(
                function(tx) {
                 var rs=   tx.executeSql("INSERT INTO settings (PortLock) VALUES (0); ");

                }
                )
}



function setLockSound(){

    var db = getDatabase();

     db.transaction(
                function(tx) {
                 var rs=   tx.executeSql("INSERT INTO settings (SoundLock) VALUES (0); ");

                }
                )
}


function sethaptics(){

    var db = getDatabase();

     db.transaction(
                function(tx) {
                    tx.executeSql("UPDATE settings SET Haptic=1");

                }
                )
}

function unsethaptics(){

    var db = getDatabase();

     db.transaction(
                function(tx) {
                    tx.executeSql("UPDATE settings SET Haptic=0");

                }
                )
}



function setlockporteins(){

    var db = getDatabase();

     db.transaction(
                function(tx) {
                    tx.executeSql("UPDATE settings SET PortLock=1");

                }
                )
}


function setlockportnull(){

    var db = getDatabase();

     db.transaction(
                function(tx) {
                    tx.executeSql("UPDATE settings SET PortLock=0");

                }
                )
}


function setlocksoundeins(){

    var db = getDatabase();

     db.transaction(
                function(tx) {
                    tx.executeSql("UPDATE settings SET SoundLock=1");

                }
                )
}


function setlocksoundnull(){

    var db = getDatabase();

     db.transaction(
                function(tx) {
                    tx.executeSql("UPDATE settings SET SoundLock=0");

                }
                )
}


function getselecthaptic() {

    var select
    var db = getDatabase();

    db.transaction(function(tx) {
        var rs = tx.executeSql('SELECT * FROM settings ;');
        for (var i = 0; i < rs.rows.length; i++) {
            //DEBUG
           console.debug(" Haptic:" + rs.rows.item(i).Haptic)
            select =  rs.rows.item(i).Haptic
        }

    })

    return select

}
function getselectPORT() {

    var selectPortLock
    var db = getDatabase();

    db.transaction(function(tx) {
        var rs = tx.executeSql('SELECT * FROM settings ;');
        for (var i = 0; i < rs.rows.length; i++) {
            //DEBUG
            //console.debug(" PortLock:" + rs.rows.item(i).PortLock)
            selectPortLock =  rs.rows.item(i).PortLock
        }

    })

    return selectPortLock

}


function getselectSOUND() {

    var selectSoundLock
    var db = getDatabase();

    db.transaction(function(tx) {
        var rs = tx.executeSql('SELECT * FROM settings ;');
        for (var i = 0; i < rs.rows.length; i++) {
            //DEBUG
           console.debug(" SoundLock:" + rs.rows.item(i).SoundLock)
            selectSoundLock =  rs.rows.item(i).SoundLock
        }

    })

    return selectSoundLock

}


//save the counts


// This function is used to write a setting into the database NAME
function insertCOUNTNAME(CountName, Count) {
    var db = getDatabase();
    var res = "";
    db.transaction(function(tx) {
        var rs = tx.executeSql('INSERT INTO currentCount (CountName, Count) VALUES (?,?);', [CountName, Count]);


        console.log(rs.rowsAffected)

    }
    );
    // The function returns “OK” if it was successful, or “Error” if it wasn't
    return res;
}



// This function is used to retrieve a name from the database


function getCountName() {

    var text
     var countnumber
    var db = getDatabase();
    var res="";

    db.transaction(function(tx) {
        var rs = tx.executeSql('SELECT * FROM currentCount');
        for (var i = 0; i < rs.rows.length; i++) {
            //DEBUG
            console.debug(" CountName:" + rs.rows.item(i).CountName + " Count:" + rs.rows.item(i).Count   )


            text =   rs.rows.item(i).CountName
            countnumber =   rs.rows.item(i).Count

            mycounts.append({name:text, counterer:countnumber});



        }

    })


    return text

}




function deletecount(countLoeschen) {
    var db = getDatabase();

     db.transaction(
                function(tx) {
                    // spieler löschen
                    tx.executeSql("DELETE  FROM currentCount WHERE CountName = ? ", countLoeschen);

                }
                )
}









function dropTables() {
    var db = getDatabase();

     db.transaction(
                function(tx) {
                    // table löschen
                    tx.executeSql("DROP TABLE IF EXISTS settings");
  tx.executeSql("DROP TABLE IF EXISTS currentCount");
                }
                )
}





/////////////////////////////////////////////////

//resize the font

function fontsizer(){

    //convert the number count to a string to use the toString() function
    var num =mainPage.count;

    var n=num.toString();


    if ( n.length == 2)

    { mainPage.coverfontsize=130;  }

    if ( n.length == 3)

    { mainPage.coverfontsize=100;  }

    if ( n.length == 4)

    { mainPage.coverfontsize=85;  }

    if ( n.length == 5)

    { mainPage.coverfontsize=80;  }

    if ( n.length == 6)

    { mainPage.fontsize=160;
        mainPage.coverfontsize=55;
    }

    if ( n.length == 7)

    {mainPage.fontsize=140;}

    if ( n.length == 8)

    {mainPage.fontsize=120;}

    if ( n.length == 9)
    {mainPage.fontsize=100;}

}
