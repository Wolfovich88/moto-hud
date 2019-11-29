import QtQuick 2.12
import QtQuick.Controls.Styles 1.4

CircularGaugeStyle {
    id: root

    tickmarkInset: toPixels(0.04)
    minorTickmarkInset: tickmarkInset
    labelStepSize: 20
    labelInset: toPixels(0.23)

    property real xCenter: outerRadius
    property real yCenter: outerRadius
    property real needleLength: outerRadius// - tickmarkInset * 1.25
    property real needleTipWidth: toPixels(0.02)
    property real needleBaseWidth: toPixels(0.06)
    property bool halfGauge: false

    function toPixels(percentage) {
        return percentage * outerRadius;
    }

    function degToRad(degrees) {
        return degrees * (Math.PI / 180);
    }

    function radToDeg(radians) {
        return radians * (180 / Math.PI);
    }

    background: Canvas {
        implicitWidth: root.width
        implicitHeight: root.height

        property real value: root.control.value / (root.control.maximumValue - root.control.minimumValue)

        onPaint: {
            var ctx = getContext("2d");
            ctx.reset();
            ctx.beginPath();
            ctx.strokeStyle = Qt.rgba(0.0, 0.0, 1.0, 1.0);
            ctx.lineWidth = toPixels(0.02);
            var r = toPixels(0.96);
            var bA = degToRad(270 + root.minimumValueAngle);
            var eA = value * degToRad(2 * root.maximumValueAngle);
            ctx.arc(xCenter, yCenter, r, bA, bA + eA)
            ctx.stroke();
        }

        Text {
            id: speedText
            font.pixelSize: toPixels(0.3)
            text: kphInt
            color: "white"
            horizontalAlignment: Text.AlignRight
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.verticalCenter
            anchors.topMargin: toPixels(0.1)

            readonly property int kphInt: control.value
        }
        Text {
            text: "km/h"
            color: "white"
            font.pixelSize: toPixels(0.09)
            anchors.top: speedText.bottom
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    needle: Item {
        implicitWidth: needleBaseWidth
        implicitHeight: needleLength

        Rectangle {
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            width: toPixels(0.08)
            height: toPixels(0.08)
            radius: width / 2
            color: "white"
            Rectangle {
                anchors.fill: parent
                anchors.margins: toPixels(0.02)
                radius: width / 2
                color: Qt.rgba(0, 0, 1, 1)
            }
        }
    }

    foreground: null
}
