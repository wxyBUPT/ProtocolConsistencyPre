import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.2

Item {
    Component{
        id: subButtonStyle;
        ButtonStyle {
            background: Rectangle {
                implicitWidth: 70
                implicitHeight: 50
                border.width: control.pressed ? 3 : 2
                border.color: (control.hovered || control.pressed) ? "red" : "green";
                radius: 4
                gradient: Gradient {
                    GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                    GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                }
            }
        }
    }
    ColumnLayout{

        id: idSubPro
        anchors.left: parent.left;
        anchors.leftMargin: 15;
        anchors.top: parent.top;
        anchors.topMargin: 30;
        spacing: 10;

        Button{
            text:"最近"
            style: subButtonStyle;
            onClicked: {
                changeSubProPage(0);
            }

        }
        Button{
            text:"新建"
            style: subButtonStyle;
            onClicked:{
                changeSubProPage(1);
            }
        }
        Button{
            text:"工程库"
            style: subButtonStyle;
            onClicked: {
                changeSubProPage(2);
            }
        }
    }

    function changeSubProPage(num){
        for(var i = 0;i<idSubProContent.children.length;i++){
            idSubProContent.children[i].visible= false;
        }
        idSubProContent.children[num].visible= true;
    }

    Item{
        anchors.left: idSubPro.right;
        anchors.top: parent.top;
        anchors.right: parent.right;
        anchors.bottom: parent.bottom;
        id : idSubProContent;
        Item{
            anchors.fill: parent;
            id: idRecent;
            RecentPro{
            }
        }

        Item{
            anchors.fill: parent;
            CreateNewPro{
            }
        }

        Item{
            anchors.fill: parent;
            id: idProLib;
            ProLib{
            }
        }
    }
}
