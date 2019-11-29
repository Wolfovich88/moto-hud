import QtQuick 2.12
import "Resources.js" as Res

Grid {
    id: root

    property int velocity: 0
    property int energyLevel: 0
    property int temperature: 18

    columns: 1
    spacing: 16

//    Image {
//        width: Res.iconSize
//        height: Res.iconSize
//        source: "qrc:/resources/speed_icon.png"
//    }
    Text {
        font.pixelSize: 40
        font.bold: true
        color: Res.contentColor
        text: qsTr("%1 rpm").arg(velocity)
        font.family: helmetFont.name
    }

//    Image {
//        width: Res.iconSize
//        height: Res.iconSize
//        source: "qrc:/resources/charge_icon.png"
//    }
    Text {
        font.pixelSize: 40
        font.bold: true
        color: Res.contentColor
        text: qsTr("%1 %").arg(energyLevel)
        font.family: helmetFont.name
    }

//    Image {
//        width: Res.iconSize
//        height: Res.iconSize
//        source: "qrc:/resources/temperature_icon.png"
//    }
    Text {
        font.pixelSize: 40
        font.bold: true
        color: Res.contentColor
        text: qsTr("%1 °C").arg(temperature)
        font.family: helmetFont.name
    }
}
