import QtQuick 2.12

Item {
    id: root

    property var path
    property int duration
    property var pathColor
    property var circleColor
    property var circleBorderColor

    Canvas {
        anchors.fill: parent
        contextType: "2d"

        onPaint: {
            context.strokeStyle = root.pathColor;
            context.lineWidth = 4
            context.path = root.path;
            context.stroke();
        }
    }

    PathInterpolator {
        id: motionPath

        path: root.path

        NumberAnimation on progress { from: 0; to: 1; duration: root.duration; loops: Animation.Infinite }
    }

    Rectangle {
        width: 25
        height: 25
        radius: width * 0.5
        color: root.circleColor
        border.width: 2
        border.color: root.circleBorderColor

        x: motionPath.x - radius
        y: motionPath.y - radius
    }
}
