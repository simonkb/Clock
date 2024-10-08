import QtQuick 2.0

Rectangle {
    id: window
    property color clockBgColor: "white"
    property date time: new Date()
    Rectangle {
        id: clockRoot
        width: 700
        height: 700
        radius: width / 2
        anchors.centerIn: parent
        color: window.clockBgColor
        border.color: "black"
        border.width: 40

        Repeater {
            id: minutesBarsRepeater
            property real radiusCircle: minutesBarsRepeater.width / 2 * 0.92
            property string color: "black"
            model: 60
            Rectangle {
                id: bar
                width: index % 5 == 0 ? 5 : 3
                height: index % 5 == 0 ? 60 : 50
                color: minutesBarsRepeater.color
                transform: Rotation {
                    origin.x: bar.width / 2
                    origin.y: clockRoot.height / 2
                    angle: (360 / 60) * index
                }
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        NumberRepeater {
            id: repeaterNumbers
            anchors.fill: parent
            allTimeNumbers: true

        }

        Timer {
            id: clockTimer
            interval: 1000
            running: true
            repeat: true
            onTriggered: {
                time.setSeconds(time.getSeconds() + 1);
                second.angleRotate = time.getSeconds() * 360 / 60;
                minHand.angleRotate = (time.getMinutes() + time.getSeconds() / 60) * 360 / 60
                hourHand.angleRotate = (time.getHours() % 12 + time.getMinutes() / 60) * 360 / 12
                clockRoot.updateTime();

            }
        }

        function updateTime() {
            if (ampm.visible) {
                digitalClock.text = time.toLocaleTimeString(Qt.locale(), "h:mm AP").split(" ")[0];
            } else {
                digitalClock.text = time.toLocaleTimeString(Qt.locale(), "H:mm");
            }
        }

        function updateTimeFromAngle(newAngle, handType) {
            var newTime = new Date(time);
            var minuteDifference = 0;
            var newMinutes = 0;

            if (handType === "hour") {
                newTime.setHours(newAngle * 12 / 360);
                newMinutes = Math.round((newAngle % 30) * 2);
            } else if (handType === "minute") {
                newMinutes = Math.round(newAngle * 60 / 360);
            } else if (handType === "second") {
                newTime.setSeconds(newAngle * 60 / 360);
            }
            if (minuteDifference < -30) {
                newTime.setHours((newTime.getHours() + 1) % 12);
            } else if (minuteDifference > 30) {
                newTime.setHours((newTime.getHours() - 1 + 12) % 12);
            }
            newTime.setMinutes(newMinutes);
            window.time = newTime;
            clockTimer.restart();
            updateTime();
        }

        Text {
            id: ampm
            anchors.horizontalCenter: clockRoot.horizontalCenter
            y: clockRoot.height / 2 - second.height / 5
            color: "black"

            function updateTime() {
                return new Date().toLocaleTimeString(Qt.locale(), "AP")
            }
            text: ampm.updateTime()
            font.pixelSize: 20
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        ClockNeedle {
            id: minHand
            canvasX: -50
            canvasY: -25
            handColor: clockRoot.border.color
            anchors.horizontalCenter: clockRoot.horizontalCenter
            y: clockRoot.height / 2 - minHand.height
            width: 20
            height: clockRoot.height * 0.42
            angleRotate: (time.getMinutes() + time.getSeconds() / 60) * 360 / 60;
            digitalClock: digitalClock
            onAngleChanged: {

                var newMinute = Math.round((angleRotate / 360) * 60);
                var newHour = time.getHours() % 12;
                var newHourAngle = ((newHour + newMinute / 60) / 12) * 360;
                hourHand.angleRotate = newHourAngle;
                var newSecondAngle = (time.getSeconds() / 60) * 360;
                second.angleRotate = newSecondAngle;
                clockRoot.updateTimeFromAngle(angleRotate, "minute");

            }

        }
        ClockNeedle {
            id: hourHand
            canvasX: -40
            canvasY: -120
            anchors.horizontalCenter: clockRoot.horizontalCenter
            y: clockRoot.height / 2 - hourHand.height
            width: 40
            height: minHand.height * 0.5 + 30
            angleRotate: (time.getHours() % 12 + time.getMinutes() / 60) * 360 / 12;
            digitalClock: digitalClock
            onAngleChanged: {

                var newHour = Math.round((angleRotate / 360) * 12) % 12;
                var newMinute = time.getMinutes();
                var newMinuteAngle = (newMinute + newHour * 60) / 60 * 360;
                minHand.angleRotate = newMinuteAngle;
                var newSecondAngle = (time.getSeconds() / 60) * 360;
                second.angleRotate = newSecondAngle;
                clockRoot.updateTimeFromAngle(angleRotate, "hour");
            }
        }
        ClockNeedle {
            id: second
            canvasX: -60
            canvasY: -25
            anchors.horizontalCenter: clockRoot.horizontalCenter
            y: clockRoot.height / 2 - second.height
            width: clockRoot.width * 0.001
            height: clockRoot.height * 0.42
            handColor: "red"
            borderColor: "red"
            angleRotate: time.getSeconds() * 360 / 60;
            digitalClock: digitalClock
            onAngleChanged: {

                var newMinuteAngle = angleRotate / 360 * 60;
                minHand.angleRotate = newMinuteAngle;

                var newHourAngle = (hourHand.angleRotate / 12) * 360 + (newMinuteAngle / 60) * 30;
                hourHand.angleRotate = newHourAngle;
                clockRoot.updateTimeFromAngle(angleRotate, "second");
            }

        }
        Rectangle {
            id: digitalClockBackground
            color: "white"
            width: digitalClock.width + 1
            height: digitalClock.height + 1
            anchors.horizontalCenter: digitalClock.horizontalCenter
            y: clockRoot.height / 2 - second.height / 3
            visible: digitalClock.visible
            opacity: 0.7
        }
        Text {
            id: digitalClock
            anchors.horizontalCenter: clockRoot.horizontalCenter
            y: clockRoot.height / 2 - second.height / 3
            color: "black"

            function updateTime() {
                if (ampm.visible) {
                    return time.toLocaleTimeString(Qt.locale(), "h:mm AP").split(" ")[0];
                } else {
                    return time.toLocaleTimeString(Qt.locale(), "H:mm");
                }
            }

            text: updateTime()
            font.pixelSize: 30
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        NumberRepeaterForMins {
            id: repeaterMinutes
            anchors.fill: parent
        }

        MouseArea {
            id:hourHandButton

            width: 50
            height: 50
            anchors.top: parent.top
            anchors.left: parent.left
            onClicked: {
                hourHand.visible = !hourHand.visible
            }
            Text {
                text: "Hour Hand"
                font.bold: true
                font.pointSize: 12
                anchors.left: hourHandButton.right
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: 5
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
            Rectangle {
                anchors.fill: parent
                border.color: "black"
                border.width: 4
                radius: 10
                Text {
                    anchors.centerIn: parent
                    text: hourHand.visible ? "OFF" : "ON"
                    font.bold: true
                    font.pointSize: 20
                }
            }
        }


        MouseArea {
            id:minuteHandButton

            width: 50
            height: 50
            anchors.top: parent.top
            anchors.right: parent.right
            onClicked: {
                minHand.visible = !minHand.visible
            }
            Text {
                text: "Minute Hand"
                font.bold: true
                font.pointSize: 12
                anchors.right: minuteHandButton.left
                anchors.verticalCenter: parent.verticalCenter
                anchors.rightMargin: 5
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
            Rectangle {
                anchors.fill: parent
                border.color: "black"
                border.width: 4
                radius: 10
                Text {
                    anchors.centerIn: parent
                    text: minHand.visible ? "OFF" : "ON"
                    font.bold: true
                    font.pointSize: 20
                }
            }
        }

        MouseArea {
            id:dashedLine

            width: 50
            height: 50
            anchors.bottom: blackButton.baseline
            anchors.bottomMargin: 10
            anchors.left: parent.left
            onClicked: {
                minHand.dashedLineVisible = !minHand.dashedLineVisible
                hourHand.dashedLineVisible = !hourHand.dashedLineVisible
                second.dashedLineVisible = !second.dashedLineVisible
            }
            Text {
                text: "Dash Lines"
                font.bold: true
                font.pointSize: 12
                anchors.left: dashedLine.right
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: 5
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            Rectangle {
                anchors.fill: parent
                border.color: "black"
                border.width: 4
                radius: 10
                Text {
                    anchors.centerIn: parent
                    text: minHand.dashedLineVisible ? "OFF" : "ON"
                    font.bold: true
                    font.pointSize: 20
                }
            }
        }

        MouseArea {
            id:digitalButton
            width: 50
            height: 50
            anchors.bottom: twentyFourHourButton.baseline
            anchors.bottomMargin: 10
            anchors.right: parent.right
            onClicked: {
                digitalClock.visible = !digitalClock.visible
                ampm.visible = !ampm.visible
            }
            Text {
                text: "Digital"
                font.bold: true
                font.pointSize: 12
                anchors.right: digitalButton.left
                anchors.verticalCenter: parent.verticalCenter
                anchors.rightMargin: 5
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
            Rectangle {
                anchors.fill: parent
                border.color: "black"
                border.width: 4
                radius: 10
                Text {
                    anchors.centerIn: parent
                    text: digitalClock.visible ? "OFF" : "ON"
                    font.bold: true
                    font.pointSize: 20
                }
            }
        }
        Rectangle {
            id: blackButton
            width: 30
            height: 30
            color: "black"
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            radius: width / 2
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    clockRoot.border.color = 'black'
                    minutesBarsRepeater.color = 'black'
                }
            }
        }
        Rectangle {
            id: blueButton
            width: 30
            height: 30
            color: "#2874A6"
            anchors.bottom: parent.bottom
            anchors.left: blackButton.right
            radius: width / 2
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    clockRoot.border.color = blueButton.color
                    minutesBarsRepeater.color = blueButton.color
                }
            }
        }

        Rectangle {
            id: orangeButton
            width: 30
            height: 30
            color: "#D35400"
            anchors.bottom: parent.bottom
            anchors.left: blueButton.right
            radius: width / 2

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    clockRoot.border.color= orangeButton.color
                    minutesBarsRepeater.color = orangeButton.color
                }
            }
        }

        Rectangle {
            id: greenButton
            width: 30
            height: 30
            color: "#1E8449"
            anchors.bottom: parent.bottom
            anchors.left: orangeButton.right
            anchors.rightMargin: 5
            radius: width / 2
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    clockRoot.border.color = greenButton.color
                    minutesBarsRepeater.color = greenButton.color
                }
            }
        }

        MouseArea {
            id: twelveHourButton
            width: 50
            height: 50
            anchors.right: twentyFourHourButton.left
            anchors.bottom: parent.bottom
            anchors.rightMargin: 5
            onClicked: {
                if(digitalClock.visible){
                    ampm.visible = true
                }
            }

            Rectangle {
                anchors.fill: parent
                border.color: "black"
                border.width: 4
                radius: 10

                Text {
                    text: "12"
                    font.bold: true
                    font.pointSize: 20
                    anchors.centerIn: parent
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
            }
        }

        MouseArea {
            id: twentyFourHourButton
            width: 50
            height: 50
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            onClicked: {
                if(digitalClock.visible){
                    ampm.visible = false
                }
            }

            Rectangle {
                anchors.fill: parent
                border.color: "black"
                border.width: 4
                radius: 10
                Text {
                    text: "24"
                    font.bold: true
                    font.pointSize: 20
                    anchors.centerIn: parent
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
            }
        }

    }
}
