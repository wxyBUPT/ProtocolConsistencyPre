import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.LocalStorage 2.0
//导入storage
import "./../global/storage.js" as DB

Rectangle{
    id:root
    anchors.centerIn: parent.Center

    Rectangle{
        anchors.centerIn: root
        anchors.horizontalCenterOffset: -250
        anchors.verticalCenterOffset: -200
        Text{
            id:idNewProText
            font.pixelSize: 25
            text:"工程名称:"
        }

        TextField{
            width:200
            anchors.left: idNewProText.right
            anchors.leftMargin: 10
            height:idNewProText.height
            id:idNewProjName
        }

        Button{

            width:80
            anchors.left: idNewProjName.right
            anchors.leftMargin: 10
            height:idNewProText.height * 0.8
            anchors.horizontalCenter: idNewProText.Center
            onClicked: {
                var name = idNewProjName.text;
                var filePath = DB.createNewPro(name);
                console.debug("项目" + name + "在数据库中创建成功，但是并未实际创建文件");
                console.log("此处需要实际创建文件");
            }
        }
    }
}
