import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import QtQuick.Layouts 1.1

Rectangle {
    color: "white"

    Component{
        id: buttonstyle;
        ButtonStyle {
            background: Rectangle {
                implicitWidth: 60
                implicitHeight: 40
                border.width: control.pressed ? 3 : 2
                border.color: (control.hovered || control.pressed) ? "green" : "gray";
                radius: 4
                gradient: Gradient {
                    GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                    GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                }
            }
        }
    }
    ColumnLayout{

        id:wxyProjectPage;

        anchors.left: parent.left;
        anchors.leftMargin: 15;
        anchors.top: parent.top;
        anchors.topMargin: 30;
        spacing: 10;
        Button{
            text:"工程"
            style: buttonstyle;
            onClicked: {
                changePage(0);
            }

        }
        Button{
            text:"保存"
            style: buttonstyle;
            onClicked:{
                changePage(1);
            }
        }
        Button{
            text:"导入"
            style: buttonstyle;
            onClicked: {
                changePage(2);
            }
        }
        Button{
            text:"导出"
            style: buttonstyle;
            onClicked: {
                changePage(3);
            }
        }
        Button{
            text:"上传"
            style: buttonstyle;
            onClicked: {
                changePage(4);
            }
        }
        Button{
            text:"下载"
            style: buttonstyle;
            onClicked: {
                changePage(5);
            }
        }
        Button{
            text:"帮助"
            style: buttonstyle;
            onClicked: {
                changePage(6);
            }
        }

        Button{
            text:"版本"
            style: buttonstyle;
            onClicked:{
                changePage(7);
            }
        }
    }

    function changePage(num){
        for(var i = 0;i<wxyProjectPage.children.length;i++){
            wxyContent.children[i].visible= false;
        }
        wxyContent.children[num].visible= true;
    }

    Item{
        anchors.left: wxyProjectPage.right;
        anchors.top: parent.top;
        anchors.right: parent.right;
        anchors.bottom: parent.bottom;
        id : wxyContent;
        Item{
            anchors.fill : parent;
            id:idSubProParent
            SubPro{
            }
        }

        Item{
            anchors.fill: parent;
            id: idSavePro;
            SavePro{
            }
        }

        Item{
            anchors.fill: parent;
            id: idImportPro;
            ImportPro{
            }
        }

        Item{
            anchors.fill: parent;
            id: idExportPro;
            ExportPro{
            }
        }

        Item{
            anchors.fill: parent;
            id: idUploadPro;
            UploadPro{
            }
        }

        Item{
            anchors.fill: parent;
            id: idUpdatePro;
            UpdatePro{
            }
        }

        Item{
            anchors.fill: parent;
            id: idHelp;
            Help{
            }
        }

        Item{
            anchors.fill: parent;
            id: idVersion;
            Version{
            }
        }
    }

}
