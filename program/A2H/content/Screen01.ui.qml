

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 6.5
import QtQuick.Controls 6.5
import A2H

Rectangle {
    id: rectangle
    width: Constants.width
    height: Constants.height
    color: "#000000"

    Text {
        id: label
        text: qsTr("Hello A2H")
        font.family: Constants.font.family
        anchors.topMargin: 45
        anchors.horizontalCenter: parent.horizontalCenter

        SequentialAnimation {
            id: animation

            ColorAnimation {
                id: colorAnimation1
                target: rectangle
                property: "color"
                to: "#2294c6"
                from: Constants.backgroundColor
            }

            ColorAnimation {
                id: colorAnimation2
                target: rectangle
                property: "color"
                to: Constants.backgroundColor
                from: "#2294c6"
            }
        }
    }

    Image {
        id: image
        x: 0
        y: 0
        width: 1920
        height: 1080
        source: "../../Images/background-1.jpg"
        fillMode: Image.PreserveAspectFit
    }
    states: [
        State {
            name: "clicked"

            PropertyChanges {
                target: label
                text: qsTr("Button Checked")
            }
        }
    ]
    GroupBox {
        id: groupBox
        x: 119
        y: 94
        width: 1042
        height: 199
        property string tipoJuego: qsTr("0")
        wheelEnabled: true
        focusPolicy: Qt.NoFocus
        contentWidth: 0
        title: qsTr("ListaTipos")
    }
}
