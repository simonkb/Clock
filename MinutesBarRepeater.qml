import QtQuick 2.0

Repeater {
    id: minutesBarsRepeater
    property real originX: minutesBarsRepeater.width / 2
    property real originY: minutesBarsRepeater.height / 2
    property real radiusCircle: minutesBarsRepeater.width / 2 * 0.93

    model: 60
    Rectangle {
        width: index % 5 ==0? 5:3
        height: index % 5==0? 30: 20
        color: "black"
        x: minutesBarsRepeater.originX + (minutesBarsRepeater.radiusCircle - height) * Math.cos(-index * 6 * Math.PI / 180 + Math.PI / 2) - width / 2
        y: minutesBarsRepeater.originY + (minutesBarsRepeater.radiusCircle - height) * Math.sin(-index * 6 * Math.PI / 180 + Math.PI / 2) - height / 2
        rotation: index * 360 / 60

        }
}
