import QtQuick 2.12
import QtQuick.Window 2.12
import QtMultimedia 5.12

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

    MediaPlayer {
        id: player
        source: "file:///Projects/Hackaton/moto-hud/video_Trim.mp4"
        autoPlay: true
    }

    VideoOutput {
        id: videoOutput
        source: player
        anchors.fill: parent
    }

//    Image {
//        anchors.fill: parent
//        source: "qrc:/resources/overlay-jarvis.png"
//    }

//    Rpm {
//        anchors {
//            left: parent.left
//            leftMargin: 128
//            bottom: parent.bottom
//            bottomMargin: 250
//        }
//        value: root.value
//    }

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

    PathDrawer {
        anchors {
            left: parent.left
            top: parent.top
            leftMargin: 50
            topMargin: 50
        }

        width: 400
        height: 400

        path: Path {
            startX: 0; startY: 0

            PathCurve { x: 75; y: 75 }
            PathCurve { x: 200; y: 150 }
            PathCurve { x: 325; y: 25 }
            PathCurve { x: 400; y: 100 }
        }
        duration: 50000
        pathColor: Qt.rgba(.4,.6,.8)
        circleColor: "red"
        circleBorderColor: Qt.rgba(.4,.6,.8)
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
