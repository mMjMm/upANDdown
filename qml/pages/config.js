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
                //    tx.executeSql('CREATE TABLE IF NOT EXISTS count(Id AUTOINCREMET, Date , Count NUMBER)');
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
            console.debug(" PortLock:" + rs.rows.item(i).PortLock)
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




function dropTables() {
    var db = getDatabase();

     db.transaction(
                function(tx) {
                    // table löschen
                    tx.executeSql("DROP TABLE IF EXISTS settings");

                }
                )
}





