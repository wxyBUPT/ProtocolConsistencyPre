import QtQuick 2.0
import QtQuick.LocalStorage 2.0
//导入storage
import "./../global/storage.js" as DB

Item {
    Text{
        id:textDisplay
        text:"foo"

    }

    Component.onCompleted: {
        var items = DB.getAllProMeta();
        /**
          items 为一个数组，并且未通过时间排序
      [
      {name:name,path:path,time:time},
      ]
          **/
        var sortedPro = items.slice(0);
        sortedPro.sort(function(a,b){
            return a.time - b.time;
        });

        var output = "";
        for(var i in sortedPro){
            output += ",name " ;
            output += sortedPro[i].name;
        }
        console.log("foo");
        console.log(output);
    }
}

