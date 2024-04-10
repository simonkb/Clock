import QtQuick 2.0
import QtQuick.Shapes 1.2
Item {
    id: minuteHandRoot
    property real angleRotate: 0
    property color handColor: "#000"
    property color borderColor: "black"
    property real canvasX: -60
    property real canvasY: -25
    property int currentMinutes: 0
    property real currentHourPosition: 0

    function handlePositionChange(angle) {
        minuteHandRoot.angleRotate = angle;
    }

    transform: Rotation {
        origin.x: minuteHandRoot.width / 2
        origin.y: minuteHandRoot.height
        angle: minuteHandRoot.angleRotate
    }
    Shape {
        id:shape
        ShapePath {
            strokeWidth: 2
            strokeColor: minuteHandRoot.borderColor
            fillColor: minuteHandRoot.handColor

            startX: minuteHandRoot.width / 4
            startY: minuteHandRoot.height
            PathLine { x: minuteHandRoot.width * 3 / 4; y: minuteHandRoot.height }
            PathLine { x: minuteHandRoot.width * 3 / 4; y: 0 }
            PathLine { x: minuteHandRoot.width / 4; y: 0 }
            PathLine { x: minuteHandRoot.width / 4; y: minuteHandRoot.height }
        }

        ShapePath {
            strokeWidth: 1
            strokeColor: minuteHandRoot.borderColor
            strokeStyle: ShapePath.DashLine
            dashPattern: [4, 2]
            fillColor: "transparent"
            startX: minuteHandRoot.width/2
            startY: 0
            PathLine { x: minuteHandRoot.width / 2; y: -200 }}

        Canvas {
            id: canvas
            width: 120
            height: 120
            x: minuteHandRoot.canvasX
            y: minuteHandRoot.canvasY
            onPaint: {
                var ctx = getContext("2d");
                ctx.clearRect(0, 0, canvas.width, canvas.height);
                ctx.beginPath();
                ctx.setLineDash([5, 5]);
                ctx.arc(canvas.width / 2, canvas.height / 2, 50, 0, 2 * Math.PI);
                ctx.strokeStyle = "black";
                ctx.stroke();
            }
            Rectangle {
                anchors.centerIn: parent
                width: 0.2
                height: 100
                color: "black"
            }
        }

        MouseArea {
            id: rotateArea
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor

            property real initialAngle: 0
            property real prevAngle: 0
            onPressed: {
                initialAngle = Math.atan2(rotateArea.mouseY - minuteHandRoot.height, rotateArea.mouseX - minuteHandRoot.width / 2) * 180 / Math.PI - minuteHandRoot.angleRotate
                prevAngle = initialAngle
            }
            onPositionChanged: {
                var angle = Math.atan2(rotateArea.mouseY - minuteHandRoot.height, rotateArea.mouseX - minuteHandRoot.width / 2) * 180 / Math.PI - initialAngle
                var angleChange = angle - prevAngle
                if(angleChange > 0){
                handlePositionChange(minuteHandRoot.angleRotate + 6);
                }else if(angleChange < 0){
                    handlePositionChange(minuteHandRoot.angleRotate - 6);
                }
            }
        }


    }
}

// import QtQuick 2.0
// import QtQuick.Shapes 1.2
// Item {
//     id: minuteHandRoot
//     property real angleRotate: 0
//     property color handColor: "#000"
//     property color borderColor: "black"
//     property real canvasX: -60
//     property real canvasY: -25
//     property int currentMinutes: 0
//     property real currentHourPosition: 0

//     function handlePositionChange(angle) {
//         minuteHandRoot.angleRotate = angle;
//     }

//     transform: Rotation {
//         origin.x: minuteHandRoot.width / 2
//         origin.y: minuteHandRoot.height
//         angle: minuteHandRoot.angleRotate
//     }

//     Shape {
//         id:shape
//         ShapePath {
//             strokeWidth: 2
//             strokeColor: minuteHandRoot.borderColor
//             fillColor: minuteHandRoot.handColor

//             startX: minuteHandRoot.width / 4
//             startY: minuteHandRoot.height
//             PathLine { x: minuteHandRoot.width * 3 / 4; y: minuteHandRoot.height }
//             PathLine { x: minuteHandRoot.width * 3 / 4; y: 0 }
//             PathLine { x: minuteHandRoot.width / 4; y: 0 }
//             PathLine { x: minuteHandRoot.width / 4; y: minuteHandRoot.height }
//         }

//         ShapePath {
//             strokeWidth: 1
//             strokeColor: minuteHandRoot.borderColor
//             strokeStyle: ShapePath.DashLine
//             dashPattern: [4, 2]
//             fillColor: "transparent"
//             startX: minuteHandRoot.width/2
//             startY: 0
//             PathLine { x: minuteHandRoot.width / 2; y: -200 }}

//         Canvas {
//             id: canvas
//             width: 120
//             height: 120
//             x: minuteHandRoot.canvasX
//             y: minuteHandRoot.canvasY
//             onPaint: {
//                 var ctx = getContext("2d");
//                 ctx.clearRect(0, 0, canvas.width, canvas.height);
//                 ctx.beginPath();
//                 ctx.setLineDash([5, 5]);
//                 ctx.arc(canvas.width / 2, canvas.height / 2, 50, 0, 2 * Math.PI);
//                 ctx.strokeStyle = "black";
//                 ctx.stroke();
//             }
//             Rectangle {
//                 anchors.centerIn: parent
//                 width: 0.2
//                 height: 100
//                 color: "black"
//             }
//         }

//         MouseArea {
//             id: rotateArea
//             anchors.fill: parent
//             cursorShape: Qt.PointingHandCursor

//             property real initialAngle: 0

//             onPressed: {
//                 initialAngle = Math.atan2(rotateArea.mouseY - minuteHandRoot.height, rotateArea.mouseX - minuteHandRoot.width / 2) * 180 / Math.PI - minuteHandRoot.angleRotate
//             }

//             onPositionChanged: {
//                 var newAngle = Math.atan2(rotateArea.mouseY - minuteHandRoot.height, rotateArea.mouseX - minuteHandRoot.width / 2) * 180 / Math.PI - initialAngle
//                 // Ensure the new angle is within [0, 360)
//                 newAngle = (newAngle + 360) % 360;
//                 // Calculate the angle difference
//                 var angleDifference = newAngle - minuteHandRoot.angleRotate;
//                 // Handle clockwise rotation
//                 if (angleDifference > 0) {
//                     if (angleDifference > 6) {
//                         // Increment by 6 degrees
//                         handlePositionChange(minuteHandRoot.angleRotate + 6);
//                     } else {
//                         handlePositionChange(newAngle);
//                     }
//                 }
//                 // Handle counter-clockwise rotation
//                 else {
//                     if (angleDifference < -6) {
//                         // Decrement by 6 degrees
//                         handlePositionChange(minuteHandRoot.angleRotate - 6);
//                     } else {
//                         handlePositionChange(newAngle);
//                     }
//                 }
//             }
//         }
//     }
// }

