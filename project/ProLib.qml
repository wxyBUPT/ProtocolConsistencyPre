import QtQuick 2.0

import QtQuick.LocalStorage 2.0
import QtQuick.Controls 1.4
import "./../global/storage.js" as DB

Item {
    id: proLib;
    property ListModel projects: ListModel{

    }

    property ListModel tmp : ListModel{

    }

    ScrollView{
        Rectangle {
            width: 180; height: 1200

            Component {
                id: proLibDelegate

                Item {
                    id: wrapper;
                    width:parent.width;
                    height: 40
                    MouseArea{
                        anchors.fill: parent;
                        onClicked: {
                            wrapper.ListView.view.currentIndex = index;
                            console.debug(index);
                            console.debug(name);
                        }
                    }

                    Row{
                        Image{
                            width:20;height:20
                            source: "./../statics/proPic.jpg"
                        }

                        Text { text: '<b>Name:</b> ' + name }
                        Text { text: '<b>Time :</b> ' + time}
                    }
                }
            }

            GridView{
                anchors.fill: parent;
                model: projects
                delegate: proLibDelegate
                highlight: Rectangle { color: "lightsteelblue"; radius: 10}
                focus: true
            }
        }
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
            projects.append(sortedPro[i])
            output += ",name " ;
            output += sortedPro[i].name;
        }
        console.log("foo");
        console.log(output);
    }

    function updateCurrentPro(){
        var items = DB.getAllProMeta();
        console.log("我被调用了")
    }
}
