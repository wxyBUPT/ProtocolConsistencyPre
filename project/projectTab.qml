import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import QtQuick.Layouts 1.1

Rectangle {
    id:root;
    color: "white"

    //工程界面的button 样式
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

    Rectangle{
        id:toptab
        width:parent.width / 15
        height:wxyProjectPage.height
        anchors.left: parent.left

        ColumnLayout{

            id:wxyProjectPage;

            anchors.left: parent.left;
            anchors.top: parent.top;

            anchors.leftMargin: 15;
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
    }



    function changePage(num){
        for(var i = 0;i<wxyProjectPage.children.length;i++){
            content.children[i].visible= false;
        }
        content.children[num].visible= true;
    }

    Component.onCompleted: {
        changePage(0)
    }

    Rectangle{
        id:content
        anchors.left: toptab.right
        anchors.right:parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 5
        anchors.rightMargin: 5

        SubPro{
            anchors.fill: parent
        }

        Text{
            anchors.centerIn: parent;
            text:"已经保存当前工程信息"
        }

        Item{
            anchors.fill: parent;
            anchors.centerIn: parent;
            id: idImportPro;
            RowLayout{
                anchors.centerIn: parent;
                //水平向上移动 500像素
                anchors.verticalCenterOffset:- parent.height * 0.5 * 0.5
                //水平向左移动 50 像素
                anchors.horizontalCenterOffset: -50

                Text{
                    text:"导入文件： "
                }

                LineEdit{
                    id: input
                    x:8;y:8
                    width:300;height:20
                    focus:true
                    text:"请输入导入文件的路径"
                }

                Button{
                    text:"..."
                }
                Button{
                    text:"导入"
                }
            }
        }

        Item{
            anchors.fill: parent;
            id: idExportPro;
            anchors.centerIn: parent;
            ColumnLayout{
                anchors.centerIn: parent;
                //水平向上移动500像素
                anchors.verticalCenterOffset: - parent.height * 0.5 * 0.5
                //水平向左移动50像素
                anchors.horizontalCenterOffset: -50
                RowLayout{
                    Text{
                        text:"导出路径： "
                    }

                    LineEdit{
                        x:8;y:8
                        width:300;height:20
                        focus:true
                        text:"导出路径"
                    }
                    Button{
                        text:"..."
                    }
                }

                RowLayout{
                    Text{
                        text:"文件名称： "
                    }
                    LineEdit{
                        x:8;y:8
                        width:300;height:20
                        focus:true
                        text:"文件名称"
                    }
                    Button{
                        text:"导出"
                    }
                }
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
