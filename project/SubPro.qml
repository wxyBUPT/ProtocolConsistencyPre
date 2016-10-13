import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.2

Rectangle{

    //button 的样式
    id:root
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

    Rectangle{
        id:lefttag
        width:parent.width/12
        height:idSubPro.height
        anchors.left: parent.left
        anchors.top: parent.top

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

        Rectangle{
            color:"green";
            anchors.left:idSubPro.left;
            anchors.right: idSubPro.right;
            anchors.top: idSubPro.top;
            anchors.bottom: idSubPro.bottom;
            anchors.leftMargin: -5
            anchors.rightMargin: -5
            anchors.bottomMargin: -5
            anchors.topMargin: -5;
            opacity:0.1;
        }
    }


    function changeSubProPage(num){
        for(var i = 0;i<idSubProContent.children.length;i++){
            idSubProContent.children[i].visible= false;
        }
        idSubProContent.children[num].visible= true;
    }
    Rectangle{

        id : idSubProContent;

        anchors.left: lefttag.right;
        anchors.top: parent.top;
        anchors.right: parent.right;
        anchors.bottom: parent.bottom;
        color:"green"

        RecentPro{
            anchors.fill: parent
            anchors.centerIn: parent
        }

        CreateNewPro{
            anchors.fill: parent
            anchors.centerIn: parent;
        }

        ProLib{
            anchors.fill: parent
            anchors.centerIn: parent
        }
    }

    Component.onCompleted: {
        changeSubProPage(2);
    }
}
