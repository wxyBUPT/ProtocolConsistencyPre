import QtQuick 2.0
import QtQuick.Controls 1.4


ExclusiveGroup {
    id: radioInputGroup

    Action {
        id: dabRadioInput
        text: "DAB"
        checkable: true
    }

    Action {
        id: fmRadioInput
        text: "FM"
        checkable: true
    }

    Action {
        id: amRadioInput
        text: "AM"
        checkable: true
    }
}
