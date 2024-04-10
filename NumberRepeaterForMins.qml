import QtQuick 2.0

Repeater {
    id: minutesRepeater
    property real originX: minutesRepeater.width / 2
    property real originY: minutesRepeater.height / 2
    property real radiusCircle: minutesRepeater.width / 2 * 0.94

    property var minuteList: [30, 35, 40, 45, 50, 55, 00, 05, 10, 15, 20, 25]

    model: 12

    MinutesNumberText {
        x: minutesRepeater.originX + minutesRepeater.radiusCircle * Math.cos((index + 3) * 2 * Math.PI / minutesRepeater.minuteList.length) - width / 2
        y: minutesRepeater.originY + minutesRepeater.radiusCircle * Math.sin((index + 3) * 2 * Math.PI / minutesRepeater.minuteList.length) - height / 2
        font.pointSize: minutesRepeater.width >= 100 ? minutesRepeater.width / 20 : 8
        text: (minutesRepeater.minuteList[index] < 10 ? "0" : "") + minutesRepeater.minuteList[index]}
}
