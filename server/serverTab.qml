import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4

Item{
    id:root
    ListModel{
        id:serverlist
        ListElement{
            ip:"服务器n"
        }

        ListElement{
            ip:"服务器2"
        }

        ListElement{
            ip:"服务器3"
        }
    }
    Row{
        anchors.fill: parent;
        spacing:2

        Rectangle{
            width:parent.width/12;
            height:parent.height;
        }

        Rectangle{
            id:serverdir
            width:parent.width/4
            height:parent.height


            ColumnLayout{

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

                Rectangle{
                    //如果以后有服务器，那么这部分被一个request 替代
                    width:serverdir.width
                    height:100

                    ListView{
                        model:serverlist;
                        delegate: Row{
                            Rectangle{
                                width:parent.width * 0.3
                                height:parent.height * 0.3
                            }

                            Text{
                                text: " " + ip
                            }
                        }

                        focus:true
                    }
                }
            }
        }

        Rectangle{
            width:parent.width/3*2
            height:parent.height;

            Text{
                anchors.centerIn: parent;
                anchors.horizontalCenterOffset:  - parent.width * 0.3
                anchors.verticalCenterOffset: - parent.height * 0.3
                text:"服务器"
                font.pixelSize: 30
            }
        }
    }
}
