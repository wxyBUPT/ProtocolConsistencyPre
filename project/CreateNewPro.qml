import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.LocalStorage 2.0
//导入storage
import "./../global/storage.js" as DB

Item {
    id:"idCreateNew"
    anchors.centerIn: parent.Center
    Rectangle{
        Text{
            id:"idNewProText"
            text:"工程名称"
        }

        TextField{
            anchors.left: idNewProText.right

            id:"idNewProjName"
        }

        Button{

            anchors.left: idNewProjName.right
            onClicked: {
                var name = idNewProjName.text;
                var filePath = DB.createNewPro(name);
                console.debug("项目" + name + "在数据库中创建成功，但是并未实际创建文件");
                console.log("此处需要实际创建文件");
            }
        }
    }
}
