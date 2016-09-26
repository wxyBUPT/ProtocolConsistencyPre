import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2

Item {

    visible: true;
    width: 600;
    height: 480;

    BusyIndicator{
        id: busy;
        running:true;
        anchors.centerIn:parent;
        z : 2;
        visible: false;
    }

    FileDialog{
        id: fileDialog;
        title:"Please choose a file";
        nameFilters:["Image Files (*.jpg *.png *.gif)"];
        onAccepted:{
            imageViewer.source = fileDialog.fileUrl;
            var imageFile = new String(fileDialog.fileUrl);
            imagePath.text = imageFile.slice(8);
        }
    }

}
