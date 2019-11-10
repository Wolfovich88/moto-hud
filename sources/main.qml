import QtQuick 2.12
import QtQuick.Window 2.12

import "Utils.js" as Utils

Window {
    id: root

    visible: true
    width: 1280
    height: 800
    title: qsTr("HUD")

    FontLoader {
        id: helmetFont
        source: "qrc:/resources/Helmet-Regular.ttf"
    }

    Image {
        anchors.fill: parent
        source: "qrc:/resources/harman-moto.png"
    }

    Image {
        anchors.fill: parent
        source: "qrc:/resources/overlay-jarvis.png"
    }

    Rpm {
        anchors {
            left: parent.left
            leftMargin: 128
            bottom: parent.bottom
            bottomMargin: 250
        }
        value: root.value
    }

    InfoBlock {
        x: 920
        y: 388

        velocity: Utils.mix(10, 110, root.value)
        energyLevel: 45
        temperature: Utils.mix(93, 95, root.value)
    }

    Row {
        anchors {
            centerIn: parent
            verticalCenterOffset: -80
        }
        spacing: 20

        Image {
            id: arrowLeft
            source: "qrc:/resources/arrow-left.png"
            opacity: 0
        }
        Image {
            id: arrowC
            source: "qrc:/resources/arrow-c.png"
            opacity: 0
        }
        Image {
            id: arrowRight
            mirror: true
            source: "qrc:/resources/arrow-left.png"
            opacity: 0
        }
    }

    // Helmet mask
    Image {
        anchors.fill: parent
        source: "qrc:/resources/helmet-mask.png"
    }

    SequentialAnimation {
        running: true
        loops: Animation.Infinite

//        ScriptAction {
//            script: {
//                arrowLeft.opacity = 0
//                arrowC.opacity = 0
//                arrowRight.opacity = 0
//            }
//        }

        PropertyAnimation {
            targets: arrowLeft
            property: "opacity"
            from: 0; to: 1;
            duration: 200
        }

        PauseAnimation {
            duration: 3000
        }
        PropertyAnimation {
            target: arrowLeft
            property: "opacity"
            from: 1; to: 0;
            duration: 200
        }

        PropertyAnimation {
            targets: arrowC
            property: "opacity"
            from: 0; to: 1;
            duration: 200
        }

        PauseAnimation {
            duration: 3000
        }
        PropertyAnimation {
            target: arrowC
            property: "opacity"
            from: 1; to: 0;
            duration: 200
        }

        PropertyAnimation {
            targets: arrowRight
            property: "opacity"
            from: 0; to: 1;
            duration: 200
        }

        PauseAnimation {
            duration: 3000
        }
        PropertyAnimation {
            target: arrowRight
            property: "opacity"
            from: 1; to: 0;
            duration: 200
        }
    }

    property real value: 0
    SequentialAnimation {
        PropertyAnimation {
            target: root
            property: "value"
            from: 0; to: 1;
            duration: 7000
            easing.type: Easing.OutQuart
        }
        PropertyAnimation {
            target: root
            property: "value"
            from: 1; to: 0;
            duration: 8000
            easing.type: Easing.InQuart
        }
        running: true
        loops: Animation.Infinite
    }
}
