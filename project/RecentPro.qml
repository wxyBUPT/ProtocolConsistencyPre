import QtQuick 2.0
import QtQuick.LocalStorage 2.0
import QtQuick.Controls 1.4
//导入storage
import "./../global/storage.js" as DB

Item {

    id: idRecentPro

    property ListModel projects: ListModel{
    }


    Rectangle {
        width: 180; height: 1200

        Component {
            id: contactDelegate

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
                        width:30;height:30;
                        source: "./../statics/proPic.jpg"
                    }

                    Text {
                        width:80;
                        height:30;
                        text: '<b>Name:</b> ' + name
                        //设置省略
                        elide: Text.ElideMiddle;
                    }
                    Text {
                        width:80;
                        height:30;
                        text: '<b>Time :</b> ' + time
                        elide: Text.ElideMiddle;
                    }
                }
            }
        }

        ListView {
            anchors.fill: parent
            model: projects
            delegate: contactDelegate
            highlight: Rectangle { color: "lightsteelblue"; radius: 10}
            focus: true
        }
    }

    /**
    Rectangle {
        id: rootItem;
        width: 360;
        height: 300;
        property var count: 0;
        property Component component: null;

        Text {
            id: coloredText;
            text: "Hello World!";
            anchors.centerIn: parent;
            font.pixelSize: 24;
        }

        function changeTextColor(clr){
            coloredText.color = clr;
        }

        function createColorPicker(clr){
            if(rootItem.component == null){
                console.debug("创建一个动态组件")
                rootItem.component = Qt.createComponent("./component/ColorPicker.qml");
            }
            var colorPicker;
            if(rootItem.component.status == Component.Ready) {
                console.debug("创建一个对象")
                colorPicker = rootItem.component.createObject(rootItem, {"color" : clr, "x" : rootItem.count *55, "y" : 10});
                //idRecentProColumn.add(colorPicker)
                //colorPicker.colorPicked.connect(rootItem.changeTextColor);
            }
            console.debug("不知道为什么就创建成功了")

            rootItem.count++;
        }

        Button {
            id: add;
            text: "add";
            anchors.left: parent.left;
            anchors.leftMargin: 4;
            anchors.bottom: parent.bottom;
            anchors.bottomMargin: 4;
            onClicked: {
                rootItem.createColorPicker(Qt.rgba(Math.random(), Math.random(), Math.random(), 1));
            }
        }
    }
    **/

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
        var j = 1;
        for(var i in sortedPro){
            if(j==10)return;
            j += 1;
            projects.append(sortedPro[i])
            output += ",name " ;
            output += sortedPro[i].name;
        }
        console.log("foo");
        console.log(output);
        console.log("一共创建了 " + j +  " 个工程");
    }

    function updateCurrentPro(){
        var items = DB.getAllProMeta();
        console.log("我被调用了")
    }
}

