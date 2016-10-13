import QtQuick 2.0
import QtQuick.LocalStorage 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import "./../global/storage.js" as DB

Rectangle{
    id: root;
    anchors.fill: parent
    property ListModel projects: ListModel{

    }

    property ListModel tmp : ListModel{

    }
    Component {
        id: proLibDelegate


        Item {
            id: wrapper;
            width:parent.width;
            height: 40
            MouseArea{
                anchors.fill: parent;
                onClicked: {
                    wrapper.GridView.view.currentIndex = index;
                    console.debug(index);
                    console.debug(name);
                }
            }

            Row{
                id:prorow
                Image{
                    id:idImage;
                    width:30;height:30
                    source: "./../statics/proPic.jpg"
                }

                Column{
                    anchors.leftMargin: 10
                    Text {
                        color:wrapper.GridView.isCurrentItem ? "green":"lightGreen";
                        text: '<b>Name:</b> ' + name
                        font.pixelSize: 15
                    }

                    Text {
                        color:"red";
                        text: '<b>Time :</b> ' + time
                        font.pixelSize: 10
                    }
                }
            }
        }
    }

    Rectangle{
        id:allpro
        anchors.top: parent.top
        width:parent.width
        height:parent.height/8* 7
        ScrollView{
            anchors.fill: parent

            Flickable{
                anchors.fill: parent
                contentWidth: 1500
                contentHeight: 400
                Layout.fillWidth: true
                GridView{
                    anchors.fill: parent
                    cellHeight: 100
                    cellWidth: 250
                    focus:true
                    flow:GridView.TopToBottom
                    model:projects
                    delegate: proLibDelegate
                }
            }
        }
    }

    Rectangle{
        anchors.top: allpro.bottom
        anchors.bottom:parent.bottom
        anchors.topMargin: 10
        width:parent.width
        Rectangle{
            anchors.right: parent.right
            width:parent.width/8 * 3
            anchors.rightMargin: 40
            height:parent.height
            //下面是三个按钮
            Button{
                id:openpro
                text:"打开"
                anchors.right: deletepro.left
            }
            Button{
                id:deletepro
                text:"删除"
                anchors.right: renamepro.left
            }
            Button{
                id:renamepro
                text:"重命名"
                anchors.right: parent.right
            }
        }
    }




    Component.onCompleted: {
        var items = DB.getAllProMeta();
      //  items 为一个数组，并且未通过时间排序
      //[
      //{name:name,path:path,time:time},
      //]
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
