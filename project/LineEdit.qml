import QtQuick 2.0

/**
  输入框
  **/

Rectangle {
    width: 96;
    height: input.height + 8
    color: "white"
    border.color: "black"

    property alias text: input.text
    property alias input: input

    TextInput {
        id: input
        anchors.fill: parent
        anchors.margins: 1
        focus: true
    }
}

