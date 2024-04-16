// import QtQuick 2.0
// import QtQuick.Shapes 1.2

// Item {
//     id: handRoot
//     property real angleRotate: 0
//     property color handColor: "#000"
//     property color borderColor: handColor
//     property real canvasX: -60
//     property real canvasY: -25
//     property bool dashedLineVisible: true

//     function handlePositionChange(angle) {
//         handRoot.angleRotate = angle;
//     }

//     transform: Rotation {
//         origin.x: handRoot.width / 2
//         origin.y: handRoot.height
//         angle: handRoot.angleRotate
//     }

//     Shape {
//         ShapePath {
//             strokeWidth: 2
//             strokeColor: handRoot.borderColor
//             fillColor: handRoot.handColor

//             startX: handRoot.width / 4
//             startY: handRoot.height
//             PathLine { x: handRoot.width * 3 / 4; y: handRoot.height }
//             PathLine { x: handRoot.width * 3 / 4; y: 0 }
//             PathLine { x: handRoot.width / 4; y: 0 }
//             PathLine { x: handRoot.width / 4; y: handRoot.height }
//         }

//         ShapePath {
//             strokeWidth: 1
//             strokeColor: handRoot.borderColor
//             strokeStyle: ShapePath.DashLine
//             dashPattern: [4, 2]
//             fillColor: "transparent"
//             startX: handRoot.width/2
//             startY: 0
//             PathLine { x: handRoot.width / 2; y: -200 }
//         }

//         Canvas {
//             id: canvas
//             visible: dashedLineVisible
//             width: 120
//             height: 120
//             x: handRoot.canvasX
//             y: handRoot.canvasY
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
//                 initialAngle = Math.atan2(rotateArea.mouseY - handRoot.height, rotateArea.mouseX - handRoot.width / 2) * 180 / Math.PI - handRoot.angleRotate
//             }

//             onPositionChanged: {
//                 var angle = Math.atan2(rotateArea.mouseY - handRoot.height, rotateArea.mouseX - handRoot.width / 2) * 180 / Math.PI - initialAngle
//                 handlePositionChange(angle);
//             }
//         }
//     }
// }



import QtQuick 2.0
import QtQuick.Shapes 1.2

Item {
    id: handRoot
    property real angleRotate: 0
    property color handColor: "#000"
    property color borderColor: handColor
    property real canvasX: -60
    property real canvasY: -25
    property bool dashedLineVisible: true

    transform: Rotation {
        origin.x: handRoot.width / 2
        origin.y: handRoot.height
        angle: handRoot.angleRotate
    }

    Shape {
        ShapePath {
            strokeWidth: 2
            strokeColor: handRoot.borderColor
            fillColor: handRoot.handColor

            startX: handRoot.width / 4
            startY: handRoot.height
            PathLine { x: handRoot.width * 3 / 4; y: handRoot.height }
            PathLine { x: handRoot.width * 3 / 4; y: 0 }
            PathLine { x: handRoot.width / 4; y: 0 }
            PathLine { x: handRoot.width / 4; y: handRoot.height }
        }

        ShapePath {
            strokeWidth: 1
            strokeColor: handRoot.borderColor
            strokeStyle: ShapePath.DashLine
            dashPattern: [4, 2]
            fillColor: "transparent"
            startX: handRoot.width/2
            startY: 0
            PathLine { x: handRoot.width / 2; y: -200 }
        }

        Canvas {
            id: canvas
            visible: dashedLineVisible
            width: 120
            height: 120
            x: handRoot.canvasX
            y: handRoot.canvasY
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

    //     MouseArea {
    //         id: rotateArea
    //         anchors.fill: parent
    //         cursorShape: Qt.PointingHandCursor
    //         property point lastMousePosition: Qt.point(mouseX, mouseY)

    //         onPressed: {
    //             lastMousePosition = Qt.point(mouseX, mouseY);
    //         }

    //         onPositionChanged: {
    //             if (pressed) {
    //                 var angleDelta = Math.atan2(mouseY - handRoot.height, mouseX - width / 2) - Math.atan2(lastMousePosition.y - handRoot.height, lastMousePosition.x - width / 2);
    //                 angleDelta *= 180 / Math.PI;  // Convert radians to degrees
    //                 handlePositionChange(handRoot.angleRotate + angleDelta);
    //                 lastMousePosition = Qt.point(mouseX, mouseY);
    //             }
    //         }
    //     }
    //
        MouseArea {
                id: rotateArea
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                property real initialAngle: 0
                property real mousePressAngle: 0

                onPressed: {
                    var dx = mouseX - handRoot.width / 2;
                    var dy = mouseY - handRoot.height;
                    mousePressAngle = Math.atan2(dy, dx) * 180 / Math.PI;
                    initialAngle = angleRotate - mousePressAngle;
                }

                onPositionChanged: {
                    if (pressed) {
                        var dx = mouseX - handRoot.width / 2;
                        var dy = mouseY - handRoot.height;
                        var currentAngle = Math.atan2(dy, dx) * 180 / Math.PI;
                        handRoot.angleRotate = initialAngle + currentAngle;
                    }
                }
            }
        }
    }


