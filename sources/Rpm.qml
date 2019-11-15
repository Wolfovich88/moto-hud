import QtQuick 2.12
import "Resources.js" as Res

Item {
    id: root
    property real value: 0

    implicitHeight: rects.height
    implicitWidth: 200

    Text {
        id: label

        anchors {
            bottom: rects.top
            bottomMargin: 8
        }

        text: "RPM x1000"
        font.pixelSize: 20
        color: Res.fontColor
        font.family: helmetFont.name
    }

    Column {
        id: rects

        anchors {
            bottom: parent.bottom
        }

        spacing: 2

        Repeater {
            model: 80 * root.value
            Rectangle {
                height: 3
                width: 50
                color: Res.contentColor
            }
        }
    }
}
