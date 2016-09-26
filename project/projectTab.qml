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
            text:"新建"
            style: buttonstyle;
            onClicked: {
                changePage(0);
            }

        }
        Button{
            text:"打开"
            style: buttonstyle;
            onClicked:{
                changePage(1);
            }
        }
        Button{
            text:"保存"
            style: buttonstyle;
            onClicked: {
                changePage(2);
            }
        }
        Button{
            text:"导入"
            style: buttonstyle;
            onClicked: {
                changePage(3);
            }
        }
        Button{
            text:"导出"
            style: buttonstyle;
            onClicked: {
                changePage(4);
            }
        }
        Button{
            text:"上传"
            style: buttonstyle;
            onClicked: {
                changePage(5);
            }
        }
        Button{
            text:"更新"
            style: buttonstyle;
            onClicked: {
                changePage(6);
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
            id : idCreateNewPro;
            CreateNewPro{

            }
        }

        Item{
            anchors.fill: parent;
            id: idOpenPro;
            OpenPro{

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

    }

}
