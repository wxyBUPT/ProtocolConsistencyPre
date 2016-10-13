import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import QtQuick.Layouts 1.1
import QtQuick.Window 2.2
import QtQuick.LocalStorage 2.0

//引入storage
import "global/storage.js" as DB

ApplicationWindow {
    visible: true
    width: Screen.width * 0.8
    height: Screen.height * 0.8


    TabView {
        anchors.fill: parent
        Tab {
            title: "工程"
            Loader{
                id:myLoader
                source: "project/projectTab.qml"
            }
        }
        Tab {
            title: "编辑"
            source: "edit/editTab.qml"
        }
        Tab {
            title: "调试"
            source: "debug/debugTab.qml"
        }
        Tab {
            title: "数据包"
        }
        Tab {
            title: "服务器"
            source: "server/serverTab.qml"
        }
    }

    Component.onCompleted: {
        DB.initialize();
        console.debug("db initialize success")
    }

}
