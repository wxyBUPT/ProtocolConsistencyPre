import QtQuick 2.0
import QtQuick.LocalStorage 2.0

/**
  当前脚本用于数据库的初始化
  **/
Item {

    //有关db 的操作都放在这里
    id:db
    visible: false

    function createDBTable(){
        var db = LocalStorage.openDatabaseSync("QQmlExampleDB","1.0","The Example QML SQL",1000000);
        db.transaction(
                    function(tx){
                        // Create the database if it doesn't already exist
                        tx.executeSql('CREATE TABLE IF NOT EXISTS PROJMETA(name TEXT UNIQUE,path TEXT UNIQUE,create_time
TEXT)')
                    }
        )
        console.log("db init")
    }

    function createNewPro(name){
        var date = new Date()
        var timestamp = Date.parse(date)
        console.debug(date.toString())
        console.debug(name)
    }

    Component.onCompleted: {
        createDBTable();
        createNewPro("王熙元")
    }
}
