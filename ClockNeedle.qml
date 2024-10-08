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
    property Text digitalClock: None

    signal angleChanged(real newAngle)

       function handlePositionChange(angle) {
           handRoot.angleRotate = angle;
           angleChanged(angle);
           updateDigitalTime();
       }

       function updateDigitalTime() {
           digitalClock.text = digitalClock.updateTime();
       }
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

        MouseArea {
            id: rotateArea
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor

            property real initialAngle: 0

            onPressed: {
                initialAngle = Math.atan2(rotateArea.mouseY - handRoot.height, rotateArea.mouseX - handRoot.width / 2) * 180 / Math.PI - handRoot.angleRotate
            }

            onPositionChanged: {
                var angle = Math.atan2(rotateArea.mouseY - handRoot.height, rotateArea.mouseX - handRoot.width / 2) * 180 / Math.PI - initialAngle
                handlePositionChange(angle);
            }
        }
    }

    onAngleRotateChanged: {
        while (handRoot.angleRotate < 0) handRoot.angleRotate += 360;
        while (handRoot.angleRotate >= 360) handRoot.angleRotate -= 360;
    }
}
