import QtQuick 2.0
import QtQuick.Layouts 1.1

Item {
    Rectangle{
        id:root;
        anchors.fill: parent

        ColumnLayout{
            id:serverroot
            anchors.left: parent.left;
            anchors.top: parent.top;
            anchors.topMargin: 50
            anchors.leftMargin: 60

            Row{
                Image{
                    id:idImage;
                    width:30;height:30
                    source: "./../statics/larrow.png"
                }

                Text{
                    text:"服务器"
                    font.pointSize:30
                }
            }


        }

        /**
        Rectangle{
            anchors.left: serverroot.right;
            anchors.top: parent.top;

            Text{
                anchors.centerIn: parent
                text:"服务器"
                font.pointSize: 50
            }
        }
        **/
    }
}
