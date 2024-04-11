// // // import QtQuick 2.0
// // // import QtQuick.Layouts 1.3

// // // Rectangle {
// // //     id: equalWindowSizeRect
// // //     property color clockBgColor: "white"
// // //     property date time: new Date()
// // //     property bool hr:false
// // //     property bool min: false
// // //     Rectangle {
// // //         id: clockRoot
// // //         width: 700
// // //         height: 700
// // //         radius: width / 2
// // //         anchors.centerIn: parent
// // //         color: equalWindowSizeRect.clockBgColor
// // //         border.color: "black"
// // //         border.width: 40
// // //         Repeater {
// // //             id: minutesBarsRepeater
// // //             property real radiusCircle: minutesBarsRepeater.width / 2 * 0.92
// // //             model: 60
// // //             Rectangle {
// // //                 id: bar
// // //                 width: index % 5 == 0 ? 5 : 3
// // //                 height: index % 5 == 0 ? 60 : 50
// // //                 color: "black"
// // //                 transform: Rotation {
// // //                     origin.x: bar.width / 2
// // //                     origin.y: clockRoot.height / 2
// // //                     angle: (360 / 60) * index
// // //                 }
// // //                 anchors.horizontalCenter: parent.horizontalCenter
// // //             }
// // //         }

// // //         NumberRepeater {
// // //             id: repeaterNumbers
// // //             anchors.fill: parent
// // //             allTimeNumbers: true
// // //         }

// // //         Timer {
// // //             repeat: true
// // //             interval: 1000
// // //             running: true
// // //             onTriggered: {
// // //                 second.angleRotate= time.getSeconds() * 360 / 60
// // //                 time.setSeconds(time.getSeconds() + 1);
// // //                 minHand.angleRotate= time.getMinutes() * 360 / 60
// // //                 hourHand.angleRotate= (time.getHours() % 12) * 360 / 12 + time.getMinutes() * 0.5

// // //             }
// // //         }

// // //         ClockHand {
// // //             id: minHand
// // //             canvasX: -50
// // //             canvasY: -25
// // //             anchors.horizontalCenter: clockRoot.horizontalCenter
// // //             y: clockRoot.height / 2 - minHand.height
// // //             width: 20
// // //             height: clockRoot.height * 0.42
// // //             onAngleRotateChanged: {
// // //                 var newMinutes = angleRotate * 60 / 360;
// // //                 newMinutes %= 60;
// // //                 var minuteDifference = newMinutes - time.getMinutes();
// // //                 if (minuteDifference < -30) {
// // //                     time.setHours((time.getHours() + 1) % 12);
// // //                 }
// // //                 else if (minuteDifference > 30) {
// // //                     time.setHours((time.getHours() - 1 + 12) % 12);
// // //                 }
// // //                 time.setMinutes(newMinutes);
// // //                 time.setSeconds(0);
// // //                 hourHand.angleRotate= (time.getHours() % 12) * 360 / 12 + time.getMinutes() * 0.5
// // //                 minHand.angleRotate= time.getMinutes() * 360 / 60

// // //             }



// // //         }

// // //         ClockHand {
// // //             id: hourHand
// // //             canvasX: -40
// // //             canvasY: -120
// // //             anchors.horizontalCenter: clockRoot.horizontalCenter
// // //             y: clockRoot.height / 2 - hourHand.height
// // //             width: 40
// // //             height: minHand.height * 0.6
// // //             onAngleRotateChanged: {
// // //                 var newHours = hourHand.angleRotate * 12 / 360;
// // //                 if(newHours != time.getHours()){
// // //                     time.setHours(newHours);
// // //                 }
// // //                 var newMinutes = (hourHand.angleRotate % 30) * 2;
// // //                 if (newMinutes != time.getMinutes()) {
// // //                     time.setMinutes(newMinutes);
// // //                 }
// // //                 time.setSeconds(0);
// // //                 hourHand.angleRotate= (time.getHours() % 12) * 360 / 12 + time.getMinutes() * 0.5
// // //                 minHand.angleRotate= time.getMinutes() * 360 / 60
// // //             }

// // //         }

// // //         ClockHand {
// // //             id: second
// // //             canvasX: -60
// // //             canvasY: -25
// // //             anchors.horizontalCenter: clockRoot.horizontalCenter
// // //             y: clockRoot.height / 2 - second.height
// // //             width: clockRoot.width * 0.001
// // //             height: clockRoot.height * 0.42
// // //             angleRotate: time.getSeconds() * 360 / 60
// // //             handColor: "red"
// // //             borderColor: "red"
// // //         }
// // //         Rectangle {
// // //             id: digitalClockBackground
// // //             color: "white"
// // //             width: digitalClock.width + 1
// // //             height: digitalClock.height + 1
// // //             anchors.horizontalCenter: digitalClock.horizontalCenter
// // //             y: clockRoot.height / 2 - second.height / 3
// // //             visible: digitalClock.visible
// // //             opacity: 0.7
// // //         }

// // //         Text {
// // //             id: digitalClock
// // //             anchors.horizontalCenter: clockRoot.horizontalCenter
// // //             y: clockRoot.height / 2 - second.height / 3
// // //             color: "black"
// // //             function updateTime() {
// // //                 var date = new Date()
// // //                 return time.toLocaleTimeString(Qt.locale(), "h:mm\n") + date.toLocaleTimeString(Qt.locale(), "AP");
// // //             }
// // //             text: updateTime()
// // //             font.pixelSize: 30
// // //             font.bold: true
// // //             horizontalAlignment: Text.AlignHCenter
// // //             verticalAlignment: Text.AlignVCenter
// // //             Layout.fillHeight: true
// // //             Layout.fillWidth: true
// // //         }

// // //         NumberRepeaterForMins {
// // //             id: repeaterMinutes
// // //             anchors.fill: parent
// // //         }
// // //     }
// // // }


// This code works perfectly and smothly but it causes binding loop
// import QtQuick 2.0
// import QtQuick.Layouts 1.3

// Rectangle {
//     id: equalWindowSizeRect
//     property color clockBgColor: "white"
//     property date time: new Date()
//     Rectangle {
//         id: clockRoot
//         width: 700
//         height: 700
//         radius: width / 2
//         anchors.centerIn: parent
//         color: equalWindowSizeRect.clockBgColor
//         border.color: "black"
//         border.width: 40

//         Repeater {
//             id: minutesBarsRepeater
//             property real radiusCircle: minutesBarsRepeater.width / 2 * 0.92

//             model: 60
//             Rectangle {
//                 id: bar
//                 width: index % 5 == 0 ? 5 : 3
//                 height: index % 5 == 0 ? 60 : 50
//                 color: "black"
//                 transform: Rotation {
//                     origin.x: bar.width / 2
//                     origin.y: clockRoot.height / 2
//                     angle: (360 / 60) * index
//                 }
//                 anchors.horizontalCenter: parent.horizontalCenter
//             }
//         }

//         NumberRepeater {
//             id: repeaterNumbers
//             anchors.fill: parent
//             allTimeNumbers: true
//         }
//         Timer {
//             repeat: true
//             interval: 1000
//             running: true
//             onTriggered: {
//                 time.setSeconds(time.getSeconds() + 1);
//             }
//         }

//         ClockNeedle {
//             id: minHand
//             canvasX: -50
//             canvasY: -25
//             anchors.horizontalCenter: clockRoot.horizontalCenter
//             y: clockRoot.height / 2 - minHand.height
//             width: 20
//             height: clockRoot.height * 0.42
//             angleRotate: time.getMinutes() * 360 / 60

//             onAngleRotateChanged: {
//                 var newMinutes = angleRotate * 60 / 360;
//                 newMinutes %= 60;
//                 var minuteDifference = newMinutes - time.getMinutes();
//                 if (minuteDifference < -30) {
//                     time.setHours((time.getHours() + 1) % 12);
//                 }
//                 else if (minuteDifference > 30) {
//                     time.setHours((time.getHours() - 1 + 12) % 12);
//                 }
//                 time.setMinutes(newMinutes);
//                 time.setSeconds(0);
//             }
//         }
//         ClockNeedle {
//             id: hourHand
//             canvasX: -40
//             canvasY: -120
//             anchors.horizontalCenter: clockRoot.horizontalCenter
//             y: clockRoot.height / 2 - hourHand.height
//             width: 40
//             height: minHand.height * 0.4 + 30
//             angleRotate: (time.getHours() % 12) * 360 / 12 + time.getMinutes() * 0.5
//             onAngleRotateChanged: {
//                 time.setHours(angleRotate * 12 / 360);
//                 time.setSeconds(0);
//                 var newMinutes = (angleRotate % 30) * 2;
//                 if (newMinutes != time.getMinutes()) {
//                     time.setMinutes(newMinutes);
//                 }
//             }

//         }

//         ClockNeedle {
//             id: second
//             canvasX: -60
//             canvasY: -25
//             anchors.horizontalCenter: clockRoot.horizontalCenter
//             y: clockRoot.height / 2 - second.height
//             width: clockRoot.width * 0.001
//             height: clockRoot.height * 0.4
//             angleRotate: time.getSeconds() * 360 / 60
//             handColor: "red"
//             borderColor: "red"
//         }
//         Rectangle {
//             id: digitalClockBackground
//             color: "white"
//             width: digitalClock.width + 1
//             height: digitalClock.height + 1
//             anchors.horizontalCenter: digitalClock.horizontalCenter
//             y: clockRoot.height / 2 - second.height / 3
//             visible: digitalClock.visible
//             opacity: 0.7
//         }

//         Text {
//             id: digitalClock
//             anchors.horizontalCenter: clockRoot.horizontalCenter
//             y: clockRoot.height / 2 - second.height / 3
//             color: "black"

//             function updateTime() {
//                 return time.toLocaleTimeString(Qt.locale(), "h:mm \nAP");
//             }

//             text: updateTime()
//             font.pixelSize: 30
//             font.bold: true
//             horizontalAlignment: Text.AlignHCenter
//             verticalAlignment: Text.AlignVCenter
//             Layout.fillHeight: true
//             Layout.fillWidth: true
//         }

//         NumberRepeaterForMins {
//             id: repeaterMinutes
//             anchors.fill: parent
//         }
//     }
// }




// import QtQuick 2.0
// import QtQuick.Layouts 1.3

// Rectangle {
//     id: equalWindowSizeRect
//     property color clockBgColor: "white"
//     property date time: new Date()
//     Rectangle {
//         id: clockRoot
//         width: 700
//         height: 700
//         radius: width / 2
//         anchors.centerIn: parent
//         color: equalWindowSizeRect.clockBgColor
//         border.color: "black"
//         border.width: 40

//         Repeater {
//             id: minutesBarsRepeater
//             property real radiusCircle: minutesBarsRepeater.width / 2 * 0.92

//             model: 60
//             Rectangle {
//                 id: bar
//                 width: index % 5 == 0 ? 5 : 3
//                 height: index % 5 == 0 ? 60 : 50
//                 color: "black"
//                 transform: Rotation {
//                     origin.x: bar.width / 2
//                     origin.y: clockRoot.height / 2
//                     angle: (360 / 60) * index
//                 }
//                 anchors.horizontalCenter: parent.horizontalCenter
//             }
//         }

//         NumberRepeater {
//             id: repeaterNumbers
//             anchors.fill: parent
//             allTimeNumbers: true
//         }

//         Timer {
//             repeat: true
//             interval: 1000
//             running: true
//             onTriggered: {
//                 time.setSeconds(time.getSeconds() + 1);
//             }
//         }


//         ClockNeedle {
//             id: minHand
//             canvasX: -50
//             canvasY: -25
//             anchors.horizontalCenter: clockRoot.horizontalCenter
//             y: clockRoot.height / 2 - minHand.height
//             width: 20
//             height: clockRoot.height * 0.4
//             property real proxyMinutes: 0 // Proxy variable to break the loop

//             onAngleRotateChanged: {
//                 clockRoot.proxyMinutes = angleRotate * 60 / 360;
//                 clockRoot.proxyMinutes %= 60;

//                 var minuteDifference = clockRoot.proxyMinutes - time.getMinutes();
//                 if (minuteDifference < -30) {
//                     time.setHours((time.getHours() + 1) % 12);
//                 }
//                 else if (minuteDifference > 30) {
//                     time.setHours((time.getHours() - 1 + 12) % 12);
//                 }
//                 time.setMinutes(clockRoot.proxyMinutes);
//                 time.setSeconds(0);
//             }
//             angleRotate: proxyMinutes * 360 / 60
//         }

//         ClockNeedle {
//             id: hourHand
//             canvasX: -40
//             canvasY: -120
//             anchors.horizontalCenter: clockRoot.horizontalCenter
//             y: clockRoot.height / 2 - hourHand.height
//             width: 40
//             height: minHand.height * 0.4 + 30

//             property real proxyHours: 0 // Proxy variable to break the loop

//             onAngleRotateChanged: {
//                 proxyHours = (angleRotate % 360) * 12 / 360;
//                 time.setHours(proxyHours);
//                 time.setSeconds(0);

//                 var newMinutes = (angleRotate % 30) * 2;
//                 if (newMinutes != time.getMinutes()) {
//                     time.setMinutes(newMinutes);
//                 }
//             }

//             angleRotate: proxyHours * 360 / 12
//         }

//         ClockNeedle {
//             id: second
//             canvasX: -60
//             canvasY: -25
//             anchors.horizontalCenter: clockRoot.horizontalCenter
//             y: clockRoot.height / 2 - second.height
//             width: clockRoot.width * 0.001
//             height: clockRoot.height * 0.4
//             angleRotate: time.getSeconds() * 360 / 60
//             handColor: "red"
//             borderColor: "red"
//         }

//         Rectangle {
//             id: digitalClockBackground
//             color: "white"
//             width: digitalClock.width + 1
//             height: digitalClock.height + 1
//             anchors.horizontalCenter: digitalClock.horizontalCenter
//             y: clockRoot.height / 2 - second.height / 3
//             visible: digitalClock.visible
//             opacity: 0.7
//         }

//         Text {
//             id: digitalClock
//             anchors.horizontalCenter: clockRoot.horizontalCenter
//             y: clockRoot.height / 2 - second.height / 3
//             color: "black"

//             function updateTime() {
//                 return time.toLocaleTimeString(Qt.locale(), "h:mm \nAP");
//             }

//             text: updateTime()
//             font.pixelSize: 30
//             font.bold: true
//             horizontalAlignment: Text.AlignHCenter
//             verticalAlignment: Text.AlignVCenter
//             Layout.fillHeight: true
//             Layout.fillWidth: true
//         }

//         NumberRepeaterForMins {
//             id: repeaterMinutes
//             anchors.fill: parent
//         }
//     }
// }




// // import QtQuick 2.0
// // import QtQuick.Layouts 1.3

// // Rectangle {
// //     id: window
// //     property color clockBgColor: "white"
// //     property date time: new Date()
// //     Rectangle {
// //         id: root
// //         width: 700
// //         height: 700
// //         radius: width / 2
// //         anchors.centerIn: parent
// //         color: window.clockBgColor
// //         border.color: "black"
// //         border.width: 40

// //         Repeater {
// //             id: minutesBarsRepeater
// //             property real radiusCircle: minutesBarsRepeater.width / 2 * 0.92

// //             model: 60
// //             Rectangle {
// //                 id: bar
// //                 width: index % 5 == 0 ? 5 : 3
// //                 height: index % 5 == 0 ? 60 : 50
// //                 color: "black"
// //                 transform: Rotation {
// //                     origin.x: bar.width / 2
// //                     origin.y: root.height / 2
// //                     angle: (360 / 60) * index
// //                 }
// //                 anchors.horizontalCenter: parent.horizontalCenter
// //             }
// //         }

// //         NumberRepeater {
// //             id: repeaterNumbers
// //             anchors.fill: parent
// //             allTimeNumbers: true
// //         }
// //         Timer {
// //             repeat: true
// //             interval: 1000
// //             running: true
// //             onTriggered: {
// //                 secondNeedle.angleRotate= time.getSeconds() * 360 / 60
// //                 time.setSeconds(time.getSeconds() + 1);
// //                 hourNeedle.angleRotate= (time.getHours() % 12) * 360 / 12 + time.getMinutes() * 0.5
// //                 minuteNeedle.angleRotate = time.getMinutes() * 360 / 60

// //             }
// //         }
// //         MinuteNeedle {
// //             id: minuteNeedle
// //             canvasX: -50
// //             canvasY: -25
// //             anchors.horizontalCenter: root.horizontalCenter
// //             y: root.height / 2 - minuteNeedle.height
// //             width: 20
// //             height: root.height * 0.4
// //             // angleRotate: time.getMinutes() * 360 / 60

// //             onAngleRotateChanged: {
// //                 var newMinutes = angleRotate * 60 / 360;
// //                 newMinutes %= 60;
// //                 var minuteDifference = newMinutes - time.getMinutes();
// //                 if (minuteDifference < -30) {
// //                     time.setHours((time.getHours() + 1) % 12);
// //                 }
// //                 else if (minuteDifference > 30) {
// //                     time.setHours((time.getHours() - 1 + 12) % 12);
// //                 }
// //                 time.setMinutes(newMinutes);
// //                 time.setSeconds(0);
// //                 hourNeedle.angleRotate= (time.getHours() % 12) * 360 / 12 + time.getMinutes() * 0.5
// //                 minuteNeedle.angleRotate = time.getMinutes() * 360 / 60

// //             }



// //         }

// //         HourNeedle {
// //             id: hourNeedle
// //             canvasX: -40
// //             canvasY: -120
// //             anchors.horizontalCenter: root.horizontalCenter
// //             y: root.height / 2 - hourNeedle.height
// //             width: 40
// //             height: minuteNeedle.height * 0.4 + 30
// //             // angleRotate: (time.getHours() % 12) * 360 / 12 + time.getMinutes() * 0.5
// //             onAngleRotateChanged: {
// //                 time.setHours(angleRotate * 12 / 360);
// //                 time.setSeconds(0);
// //                 var newMinutes = (angleRotate % 30) * 2;
// //                 if (newMinutes != time.getMinutes()) {
// //                     time.setMinutes(newMinutes);
// //                 }
// //                 hourNeedle.angleRotate= (time.getHours() % 12) * 360 / 12 + time.getMinutes() * 0.5
// //                 minuteNeedle.angleRotate = time.getMinutes() * 360 / 60

// //             }

// //         }

// //         SecondNeedle {
// //             id: secondNeedle
// //             canvasX: -60
// //             canvasY: -25
// //             anchors.horizontalCenter: root.horizontalCenter
// //             y: root.height / 2 - secondNeedle.height
// //             width: root.width * 0.001
// //             height: root.height * 0.4
// //             angleRotate: time.getSeconds() * 360 / 60
// //             handColor: "red"
// //             borderColor: "red"
// //         }
// //         Rectangle {
// //             id: digitalClockBackground
// //             color: "white"
// //             width: digitalClock.width + 1
// //             height: digitalClock.height + 1
// //             anchors.horizontalCenter: digitalClock.horizontalCenter
// //             y: root.height / 2 - secondNeedle.height / 3
// //             visible: digitalClock.visible
// //             opacity: 0.7
// //         }

// //         Text {
// //             id: digitalClock
// //             anchors.horizontalCenter: root.horizontalCenter
// //             y: root.height / 2 - secondNeedle.height / 3
// //             color: "black"

// //             function updateTime() {
// //                 var date = new Date()
// //                 return time.toLocaleTimeString(Qt.locale(), "h:mm \nAP").split(" ")[0] +  date.toLocaleTimeString(Qt.locale(), "\nAP") ;
// //             }

// //             text: updateTime()
// //             font.pixelSize: 30
// //             font.bold: true
// //             horizontalAlignment: Text.AlignHCenter
// //             verticalAlignment: Text.AlignVCenter
// //             Layout.fillHeight: true
// //             Layout.fillWidth: true
// //         }

// //         NumberRepeaterForMins {
// //             id: repeaterMinutes
// //             anchors.fill: parent
// //         }
// //     }
// // }

// import QtQuick 2.0
// import QtQuick.Layouts 1.3

// Rectangle {
//     id: equalWindowSizeRect
//     property color clockBgColor: "white"
//     property date time: new Date()
//     Rectangle {
//         id: clockRoot
//         width: 700
//         height: 700
//         radius: width / 2
//         anchors.centerIn: parent
//         color: equalWindowSizeRect.clockBgColor
//         border.color: "black"
//         border.width: 40

//         Repeater {
//             id: minutesBarsRepeater
//             property real radiusCircle: minutesBarsRepeater.width / 2 * 0.92

//             model: 60
//             Rectangle {
//                 id: bar
//                 width: index % 5 == 0 ? 5 : 3
//                 height: index % 5 == 0 ? 60 : 50
//                 color: "black"
//                 transform: Rotation {
//                     origin.x: bar.width / 2
//                     origin.y: clockRoot.height / 2
//                     angle: (360 / 60) * index
//                 }
//                 anchors.horizontalCenter: parent.horizontalCenter
//             }
//         }

//         NumberRepeater {
//             id: repeaterNumbers
//             anchors.fill: parent
//             allTimeNumbers: true
//         }
//         Timer {
//             repeat: true
//             interval: 1000
//             running: true
//             onTriggered: {
//                 time.setSeconds(time.getSeconds() + 1);
//             }
//         }

//         ClockNeedle {
//             id: minHand
//             canvasX: -50
//             canvasY: -25
//             anchors.horizontalCenter: clockRoot.horizontalCenter
//             y: clockRoot.height / 2 - minHand.height
//             width: 20
//             height: clockRoot.height * 0.42
//             angleRotate: time.getMinutes() * 360 / 60

//             onAngleRotateChanged: {
//                 var newMinutes = angleRotate * 60 / 360;
//                 newMinutes %= 60;
//                 var minuteDifference = newMinutes - time.getMinutes();
//                 if (minuteDifference < -30) {
//                     time.setHours((time.getHours() + 1) % 12);
//                 }
//                 else if (minuteDifference > 30) {
//                     time.setHours((time.getHours() - 1 + 12) % 12);
//                 }
//                 time.setMinutes(newMinutes);
//                 time.setSeconds(0);
//             }
//         }
//         ClockNeedle {
//             id: hourHand
//             canvasX: -40
//             canvasY: -120
//             anchors.horizontalCenter: clockRoot.horizontalCenter
//             y: clockRoot.height / 2 - hourHand.height
//             width: 40
//             height: minHand.height * 0.4 + 30
//             angleRotate: (time.getHours() % 12) * 360 / 12 + time.getMinutes() * 0.5
//             onAngleRotateChanged: {
//                 time.setHours(angleRotate * 12 / 360);
//                 time.setSeconds(0);
//                 var newMinutes = (angleRotate % 30) * 2;
//                 if (newMinutes != time.getMinutes()) {
//                     time.setMinutes(newMinutes);
//                 }
//             }

//         }

//         ClockNeedle {
//             id: second
//             canvasX: -60
//             canvasY: -25
//             anchors.horizontalCenter: clockRoot.horizontalCenter
//             y: clockRoot.height / 2 - second.height
//             width: clockRoot.width * 0.001
//             height: clockRoot.height * 0.4
//             angleRotate: time.getSeconds() * 360 / 60
//             handColor: "red"
//             borderColor: "red"
//         }
//         Rectangle {
//             id: digitalClockBackground
//             color: "white"
//             width: digitalClock.width + 1
//             height: digitalClock.height + 1
//             anchors.horizontalCenter: digitalClock.horizontalCenter
//             y: clockRoot.height / 2 - second.height / 3
//             visible: digitalClock.visible
//             opacity: 0.7
//         }

//         Text {
//             id: digitalClock
//             anchors.horizontalCenter: clockRoot.horizontalCenter
//             y: clockRoot.height / 2 - second.height / 3
//             color: "black"

//             function updateTime() {
//                 return time.toLocaleTimeString(Qt.locale(), "h:mm \nAP");
//             }

//             text: updateTime()
//             font.pixelSize: 30
//             font.bold: true
//             horizontalAlignment: Text.AlignHCenter
//             verticalAlignment: Text.AlignVCenter
//             Layout.fillHeight: true
//             Layout.fillWidth: true
//         }

//         NumberRepeaterForMins {
//             id: repeaterMinutes
//             anchors.fill: parent
//         }
//     }
// }

// import QtQuick 2.0
// import QtQuick.Layouts 1.3

// Rectangle {
//     id: equalWindowSizeRect
//     property color clockBgColor: "white"
//     property date time: new Date()
//     Rectangle {
//         id: clockRoot
//         width: 700
//         height: 700
//         radius: width / 2
//         anchors.centerIn: parent
//         color: equalWindowSizeRect.clockBgColor
//         border.color: "black"
//         border.width: 40

//         Repeater {
//             id: minutesBarsRepeater
//             property real radiusCircle: minutesBarsRepeater.width / 2 * 0.92

//             model: 60
//             Rectangle {
//                 id: bar
//                 width: index % 5 == 0 ? 5 : 3
//                 height: index % 5 == 0 ? 60 : 50
//                 color: "black"
//                 transform: Rotation {
//                     origin.x: bar.width / 2
//                     origin.y: clockRoot.height / 2
//                     angle: (360 / 60) * index
//                 }
//                 anchors.horizontalCenter: parent.horizontalCenter
//             }
//         }

//         NumberRepeater {
//             id: repeaterNumbers
//             anchors.fill: parent
//             allTimeNumbers: true
//         }
//         Timer {
//             repeat: true
//             interval: 1000
//             running: true
//             onTriggered: {
//                 time.setSeconds(time.getSeconds() + 1);
//             }
//         }

//         property real proxyMinutes: 0 // Proxy variable to break the loop

//         ClockNeedle {
//             id: minHand
//             canvasX: -50
//             canvasY: -25
//             anchors.horizontalCenter: clockRoot.horizontalCenter
//             y: clockRoot.height / 2 - minHand.height
//             width: 20
//             height: clockRoot.height * 0.42

//             onAngleRotateChanged: {
//                 clockRoot.proxyMinutes = angleRotate * 60 / 360;
//                 clockRoot.proxyMinutes %= 60;

//                 var newMinutes = clockRoot.proxyMinutes;
//                 var minuteDifference = newMinutes - time.getMinutes();
//                 if (minuteDifference < -30) {
//                     time.setHours((time.getHours() + 1) % 12);
//                 }
//                 else if (minuteDifference > 30) {
//                     time.setHours((time.getHours() - 1 + 12) % 12);
//                 }
//                 time.setMinutes(newMinutes);
//                 time.setSeconds(0);
//             }

//             angleRotate: clockRoot.proxyMinutes * 360 / 60
//         }

//         property real proxyHours: 0 // Proxy variable to break the loop

//         ClockNeedle {
//             id: hourHand
//             canvasX: -40
//             canvasY: -120
//             anchors.horizontalCenter: clockRoot.horizontalCenter
//             y: clockRoot.height / 2 - hourHand.height
//             width: 40
//             height: minHand.height * 0.4 + 30

//             onAngleRotateChanged: {
//                 clockRoot.proxyHours = (angleRotate % 360) * 12 / 360;
//                 time.setHours(clockRoot.proxyHours);
//                 time.setSeconds(0);

//                 var newMinutes = (angleRotate % 30) * 2;
//                 if (newMinutes != time.getMinutes()) {
//                     time.setMinutes(newMinutes);
//                 }
//             }

//             angleRotate: clockRoot.proxyHours * 360 / 12
//         }

//         ClockNeedle {
//             id: second
//             canvasX: -60
//             canvasY: -25
//             anchors.horizontalCenter: clockRoot.horizontalCenter
//             y: clockRoot.height / 2 - second.height
//             width: clockRoot.width * 0.001
//             height: clockRoot.height * 0.4
//             angleRotate: time.getSeconds() * 360 / 60
//             handColor: "red"
//             borderColor: "red"
//         }
//         Rectangle {
//             id: digitalClockBackground
//             color: "white"
//             width: digitalClock.width + 1
//             height: digitalClock.height + 1
//             anchors.horizontalCenter: digitalClock.horizontalCenter
//             y: clockRoot.height / 2 - second.height / 3
//             visible: digitalClock.visible
//             opacity: 0.7
//         }

//         Text {
//             id: digitalClock
//             anchors.horizontalCenter: clockRoot.horizontalCenter
//             y: clockRoot.height / 2 - second.height / 3
//             color: "black"

//             function updateTime() {
//                 return time.toLocaleTimeString(Qt.locale(), "h:mm \nAP");
//             }

//             text: updateTime()
//             font.pixelSize: 30
//             font.bold: true
//             horizontalAlignment: Text.AlignHCenter
//             verticalAlignment: Text.AlignVCenter
//             Layout.fillHeight: true
//             Layout.fillWidth: true
//         }

//         NumberRepeaterForMins {
//             id: repeaterMinutes
//             anchors.fill: parent
//         }
//     }
// }
// import QtQuick 2.0
// import QtQuick.Layouts 1.3

// Rectangle {
//     id: equalWindowSizeRect
//     property color clockBgColor: "white"
//     property date time: new Date()

//     Rectangle {
//         id: clockRoot
//         width: 700
//         height: 700
//         radius: width / 2
//         anchors.centerIn: parent
//         color: equalWindowSizeRect.clockBgColor
//         border.color: "black"
//         border.width: 40

//         Repeater {
//             id: minutesBarsRepeater
//             property real radiusCircle: minutesBarsRepeater.width / 2 * 0.92

//             model: 60
//             Rectangle {
//                 id: bar
//                 width: index % 5 == 0 ? 5 : 3
//                 height: index % 5 == 0 ? 60 : 50
//                 color: "black"
//                 transform: Rotation {
//                     origin.x: bar.width / 2
//                     origin.y: clockRoot.height / 2
//                     angle: (360 / 60) * index
//                 }
//                 anchors.horizontalCenter: parent.horizontalCenter
//             }
//         }

//         NumberRepeater {
//             id: repeaterNumbers
//             anchors.fill: parent
//             allTimeNumbers: true
//         }

//         Timer {
//             repeat: true
//             interval: 1000
//             running: true
//             onTriggered: {
//                 time.setSeconds(time.getSeconds() + 1);
//             }
//         }

//         // Calculate minute and hour angles directly from time object
//         property real minuteAngle: time.getMinutes() * 360 / 60
//         property real hourAngle: (time.getHours() % 12 + time.getMinutes() / 60) * 360 / 12

//         ClockNeedle {
//             id: minHand
//             canvasX: -50
//             canvasY: -25
//             anchors.horizontalCenter: clockRoot.horizontalCenter
//             y: clockRoot.height / 2 - minHand.height
//             width: 20
//             height: clockRoot.height * 0.42
//             angleRotate: clockRoot.minuteAngle
//             onAngleRotateChanged: {
//                 var newMinutes = angleRotate * 60 / 360;
//                 newMinutes %= 60;
//                 var minuteDifference = newMinutes - time.getMinutes();
//                 if (minuteDifference < -30) {
//                     time.setHours((time.getHours() + 1) % 12);
//                 }
//                 else if (minuteDifference > 30) {
//                     time.setHours((time.getHours() - 1 + 12) % 12);
//                 }
//                 time.setMinutes(newMinutes);
//                 time.setSeconds(0);
//             }

//         }

//         ClockNeedle {
//             id: hourHand
//             canvasX: -40
//             canvasY: -120
//             anchors.horizontalCenter: clockRoot.horizontalCenter
//             y: clockRoot.height / 2 - hourHand.height
//             width: 40
//             height: minHand.height * 0.4 + 30
//             angleRotate: clockRoot.hourAngle
//             onAngleRotateChanged: {
//                 time.setHours(angleRotate * 12 / 360);
//                 time.setSeconds(0);
//                 var newMinutes = (angleRotate % 30) * 2;
//                 if (newMinutes != time.getMinutes()) {
//                     time.setMinutes(newMinutes);
//                 }
//             }
//         }

//         ClockNeedle {
//             id: second
//             canvasX: -60
//             canvasY: -25
//             anchors.horizontalCenter: clockRoot.horizontalCenter
//             y: clockRoot.height / 2 - second.height
//             width: clockRoot.width * 0.001
//             height: clockRoot.height * 0.4
//             angleRotate: time.getSeconds() * 360 / 60
//             handColor: "red"
//             borderColor: "red"

//             onAngleRotateChanged: {
//                 if (angleRotate === 0)
//                     return;
//                 time.setSeconds(Math.floor(angleRotate * 60 / 360));
//             }
//         }

//         Rectangle {
//             id: digitalClockBackground
//             color: "white"
//             width: digitalClock.width + 1
//             height: digitalClock.height + 1
//             anchors.horizontalCenter: digitalClock.horizontalCenter
//             y: clockRoot.height / 2 - second.height / 3
//             visible: digitalClock.visible
//             opacity: 0.7
//         }

//         Text {
//             id: digitalClock
//             anchors.horizontalCenter: clockRoot.horizontalCenter
//             y: clockRoot.height / 2 - second.height / 3
//             color: "black"

//             function updateTime() {
//                 return time.toLocaleTimeString(Qt.locale(), "h:mm \nAP");
//             }
//             text: updateTime()
//             font.pixelSize: 30
//             font.bold: true
//             horizontalAlignment: Text.AlignHCenter
//             verticalAlignment: Text.AlignVCenter
//             Layout.fillHeight: true
//             Layout.fillWidth: true
//         }

//         NumberRepeaterForMins {
//             id: repeaterMinutes
//             anchors.fill: parent
//         }
//     }
// }

// import QtQuick 2.0
// import QtQuick.Layouts 1.3

// Rectangle {
//     id: equalWindowSizeRect
//     property color clockBgColor: "white"
//     property date time: new Date()

//     Rectangle {
//         id: clockRoot
//         width: 700
//         height: 700
//         radius: width / 2
//         anchors.centerIn: parent
//         color: equalWindowSizeRect.clockBgColor
//         border.color: "black"
//         border.width: 40

//         Repeater {
//             id: minutesBarsRepeater
//             property real radiusCircle: minutesBarsRepeater.width / 2 * 0.92

//             model: 60
//             Rectangle {
//                 id: bar
//                 width: index % 5 == 0 ? 5 : 3
//                 height: index % 5 == 0 ? 60 : 50
//                 color: "black"
//                 transform: Rotation {
//                     origin.x: bar.width / 2
//                     origin.y: clockRoot.height / 2
//                     angle: (360 / 60) * index
//                 }
//                 anchors.horizontalCenter: parent.horizontalCenter
//             }
//         }

//         NumberRepeater {
//             id: repeaterNumbers
//             anchors.fill: parent
//             allTimeNumbers: true
//         }

//         Timer {
//             repeat: true
//             interval: 1000
//             running: true
//             onTriggered: {
//                 time.setSeconds(time.getSeconds() + 1);
//             }
//         }

//         // Proxy variable for minutes
//         property real proxyMinutes: 0

//         ClockNeedle {
//             id: minHand
//             canvasX: -50
//             canvasY: -25
//             anchors.horizontalCenter: clockRoot.horizontalCenter
//             y: clockRoot.height / 2 - minHand.height
//             width: 20
//             height: clockRoot.height * 0.4

//             onAngleRotateChanged: {
//                 clockRoot.proxyMinutes = angleRotate * 60 / 360;
//                 clockRoot.proxyMinutes %= 60;

//                 var minuteDifference = clockRoot.proxyMinutes - time.getMinutes();
//                 if (minuteDifference < -30) {
//                     time.setHours((time.getHours() + 1) % 12);
//                 }
//                 else if (minuteDifference > 30) {
//                     time.setHours((time.getHours() - 1 + 12) % 12);
//                 }
//                 time.setMinutes(clockRoot.proxyMinutes);
//                 time.setSeconds(0);
//             }

//             angleRotate: clockRoot.proxyMinutes * 360 / 60
//         }

//         // Proxy variable for hours
//         property real proxyHours: 0

//         ClockNeedle {
//             id: hourHand
//             canvasX: -40
//             canvasY: -120
//             anchors.horizontalCenter: clockRoot.horizontalCenter
//             y: clockRoot.height / 2 - hourHand.height
//             width: 40
//             height: minHand.height * 0.4 + 30

//             onAngleRotateChanged: {
//                 clockRoot.proxyHours = (angleRotate % 360) * 12 / 360;
//                 time.setHours(clockRoot.proxyHours);
//                 time.setSeconds(0);

//                 var newMinutes = (angleRotate % 30) * 2;
//                 if (newMinutes != time.getMinutes()) {
//                     time.setMinutes(newMinutes);
//                 }
//             }

//             angleRotate: clockRoot.proxyHours * 360 / 12
//         }

//         ClockNeedle {
//             id: second
//             canvasX: -60
//             canvasY: -25
//             anchors.horizontalCenter: clockRoot.horizontalCenter
//             y: clockRoot.height / 2 - second.height
//             width: clockRoot.width * 0.001
//             height: clockRoot.height * 0.4
//             angleRotate: time.getSeconds() * 360 / 60
//             handColor: "red"
//             borderColor: "red"
//         }

//         Rectangle {
//             id: digitalClockBackground
//             color: "white"
//             width: digitalClock.width + 1
//             height: digitalClock.height + 1
//             anchors.horizontalCenter: digitalClock.horizontalCenter
//             y: clockRoot.height / 2 - second.height / 3
//             visible: digitalClock.visible
//             opacity: 0.7
//         }

//         Text {
//             id: digitalClock
//             anchors.horizontalCenter: clockRoot.horizontalCenter
//             y: clockRoot.height / 2 - second.height / 3
//             color: "black"

//             function updateTime() {
//                 return time.toLocaleTimeString(Qt.locale(), "h:mm \nAP");
//             }

//             text: updateTime()
//             font.pixelSize: 30
//             font.bold: true
//             horizontalAlignment: Text.AlignHCenter
//             verticalAlignment: Text.AlignVCenter
//             Layout.fillHeight: true
//             Layout.fillWidth: true
//         }

//         NumberRepeaterForMins {
//             id: repeaterMinutes
//             anchors.fill: parent
//         }
//     }
// }


// import QtQuick 2.0
// import QtQuick.Layouts 1.3

// Rectangle {
//     id: equalWindowSizeRect
//     property color clockBgColor: "white"
//     property date time: new Date()

//     Rectangle {
//         id: clockRoot
//         width: 700
//         height: 700
//         radius: width / 2
//         anchors.centerIn: parent
//         color: equalWindowSizeRect.clockBgColor
//         border.color: "black"
//         border.width: 40

//         Repeater {
//             id: minutesBarsRepeater
//             property real radiusCircle: minutesBarsRepeater.width / 2 * 0.92

//             model: 60
//             Rectangle {
//                 id: bar
//                 width: index % 5 == 0 ? 5 : 3
//                 height: index % 5 == 0 ? 60 : 50
//                 color: "black"
//                 transform: Rotation {
//                     origin.x: bar.width / 2
//                     origin.y: clockRoot.height / 2
//                     angle: (360 / 60) * index
//                 }
//                 anchors.horizontalCenter: parent.horizontalCenter
//             }
//         }

//         NumberRepeater {
//             id: repeaterNumbers
//             anchors.fill: parent
//             allTimeNumbers: true
//         }

//         Timer {
//             repeat: true
//             interval: 1000
//             running: true
//             onTriggered: {
//                 time.setSeconds(time.getSeconds() + 1);
//             }
//         }

//         // Proxy variable for minutes
//         property real proxyMinutes: 0

//         ClockNeedle {
//             id: minHand
//             canvasX: -50
//             canvasY: -25
//             anchors.horizontalCenter: clockRoot.horizontalCenter
//             y: clockRoot.height / 2 - minHand.height
//             width: 20
//             height: clockRoot.height * 0.4

//             onAngleRotateChanged: {
//                 clockRoot.proxyMinutes = angleRotate * 60 / 360;
//                 clockRoot.proxyMinutes %= 60;

//                 var minuteDifference = clockRoot.proxyMinutes - time.getMinutes();
//                 if (minuteDifference < -30) {
//                     time.setHours((time.getHours() + 1) % 12);
//                 }
//                 else if (minuteDifference > 30) {
//                     time.setHours((time.getHours() - 1 + 12) % 12);
//                 }
//                 time.setMinutes(clockRoot.proxyMinutes);
//                 time.setSeconds(0);

//                 // Update hour hand
//                 var newHourAngle = (time.getHours() % 12) * 360 / 12 + time.getMinutes() * 0.5;
//                 hourHand.angleRotate = newHourAngle;
//             }

//             angleRotate: clockRoot.proxyMinutes * 360 / 60
//         }

//         // Proxy variable for hours
//         property real proxyHours: 0

//         ClockNeedle {
//             id: hourHand
//             canvasX: -40
//             canvasY: -120
//             anchors.horizontalCenter: clockRoot.horizontalCenter
//             y: clockRoot.height / 2 - hourHand.height
//             width: 40
//             height: minHand.height * 0.4 + 30

//             onAngleRotateChanged: {
//                 clockRoot.proxyHours = (angleRotate % 360) * 12 / 360;
//                 clockRoot.proxyHours %= 12;
//                 if (clockRoot.proxyHours < 0)
//                     clockRoot.proxyHours += 12;
//                 time.setHours(clockRoot.proxyHours);
//                 time.setSeconds(0);

//                 // Update minute hand
//                 var newMinuteAngle = clockRoot.proxyHours * 360 / 12;
//                 minHand.angleRotate = newMinuteAngle;
//             }

//             angleRotate: clockRoot.proxyHours * 360 / 12
//         }

//         ClockNeedle {
//             id: second
//             canvasX: -60
//             canvasY: -25
//             anchors.horizontalCenter: clockRoot.horizontalCenter
//             y: clockRoot.height / 2 - second.height
//             width: clockRoot.width * 0.001
//             height: clockRoot.height * 0.4
//             angleRotate: time.getSeconds() * 360 / 60
//             handColor: "red"
//             borderColor: "red"
//         }

//         Rectangle {
//             id: digitalClockBackground
//             color: "white"
//             width: digitalClock.width + 1
//             height: digitalClock.height + 1
//             anchors.horizontalCenter: digitalClock.horizontalCenter
//             y: clockRoot.height / 2 - second.height / 3
//             visible: digitalClock.visible
//             opacity: 0.7
//         }

//         Text {
//             id: digitalClock
//             anchors.horizontalCenter: clockRoot.horizontalCenter
//             y: clockRoot.height / 2 - second.height / 3
//             color: "black"

//             function updateTime() {
//                 return time.toLocaleTimeString(Qt.locale(), "h:mm \nAP");
//             }

//             text: updateTime()
//             font.pixelSize: 30
//             font.bold: true
//             horizontalAlignment: Text.AlignHCenter
//             verticalAlignment: Text.AlignVCenter
//             Layout.fillHeight: true
//             Layout.fillWidth: true
//         }

//         NumberRepeaterForMins {
//             id: repeaterMinutes
//             anchors.fill: parent
//         }
//     }
// }

// import QtQuick 2.0
// import QtQuick.Layouts 1.3

// Rectangle {
//     id: equalWindowSizeRect
//     property color clockBgColor: "white"
//     property date time: new Date()
//     Rectangle {
//         id: clockRoot
//         width: 700
//         height: 700
//         radius: width / 2
//         anchors.centerIn: parent
//         color: equalWindowSizeRect.clockBgColor
//         border.color: "black"
//         border.width: 40

//         Repeater {
//             id: minutesBarsRepeater
//             property real radiusCircle: minutesBarsRepeater.width / 2 * 0.92

//             model: 60
//             Rectangle {
//                 id: bar
//                 width: index % 5 == 0 ? 5 : 3
//                 height: index % 5 == 0 ? 60 : 50
//                 color: "black"
//                 transform: Rotation {
//                     origin.x: bar.width / 2
//                     origin.y: clockRoot.height / 2
//                     angle: (360 / 60) * index
//                 }
//                 anchors.horizontalCenter: parent.horizontalCenter
//             }
//         }

// NumberRepeater {
//     id: repeaterNumbers
//     anchors.fill: parent
//     allTimeNumbers: true
// }
//         Timer {
//             repeat: true
//             interval: 1000
//             running: true
//             onTriggered: {
//                 time.setSeconds(time.getSeconds() + 1);
//             }
//         }

//         ClockNeedle {
//             id: minHand
//             canvasX: -50
//             canvasY: -25
//             anchors.horizontalCenter: clockRoot.horizontalCenter
//             y: clockRoot.height / 2 - minHand.height
//             width: 20
//             height: clockRoot.height * 0.42
//             angleRotate: time.getMinutes() * 360 / 60

//             onAngleRotateChanged: {
//                 var newMinutes = angleRotate * 60 / 360;
//                 newMinutes %= 60;
//                 var minuteDifference = newMinutes - time.getMinutes();
//                 if (minuteDifference < -30) {
//                     time.setHours((time.getHours() + 1) % 12);
//                 }
//                 else if (minuteDifference > 30) {
//                     time.setHours((time.getHours() - 1 + 12) % 12);
//                 }
//                 time.setMinutes(newMinutes);
//                 time.setSeconds(0);
//             }
//         }
//         ClockNeedle {
//             id: hourHand
//             canvasX: -40
//             canvasY: -120
//             anchors.horizontalCenter: clockRoot.horizontalCenter
//             y: clockRoot.height / 2 - hourHand.height
//             width: 40
//             height: minHand.height * 0.4 + 30
//             angleRotate: (time.getHours() % 12) * 360 / 12 + time.getMinutes() * 0.5
//             onAngleRotateChanged: {
//                 time.setHours(angleRotate * 12 / 360);
//                 time.setSeconds(0);
//                 var newMinutes = (angleRotate % 30) * 2;
//                 if (newMinutes != time.getMinutes()) {
//                     time.setMinutes(newMinutes);
//                 }
//             }

//         }

//         ClockNeedle {
//             id: second
//             canvasX: -60
//             canvasY: -25
//             anchors.horizontalCenter: clockRoot.horizontalCenter
//             y: clockRoot.height / 2 - second.height
//             width: clockRoot.width * 0.001
//             height: clockRoot.height * 0.4
//             angleRotate: time.getSeconds() * 360 / 60
//             handColor: "red"
//             borderColor: "red"
//         }
//         Rectangle {
//             id: digitalClockBackground
//             color: "white"
//             width: digitalClock.width + 1
//             height: digitalClock.height + 1
//             anchors.horizontalCenter: digitalClock.horizontalCenter
//             y: clockRoot.height / 2 - second.height / 3
//             visible: digitalClock.visible
//             opacity: 0.7
//         }

//         Text {
//             id: digitalClock
//             anchors.horizontalCenter: clockRoot.horizontalCenter
//             y: clockRoot.height / 2 - second.height / 3
//             color: "black"

//             function updateTime() {
//                 return time.toLocaleTimeString(Qt.locale(), "h:mm \nAP");
//             }

//             text: updateTime()
//             font.pixelSize: 30
//             font.bold: true
//             horizontalAlignment: Text.AlignHCenter
//             verticalAlignment: Text.AlignVCenter
//             Layout.fillHeight: true
//             Layout.fillWidth: true
//         }

//         NumberRepeaterForMins {
//             id: repeaterMinutes
//             anchors.fill: parent
//         }
//     }
// }

// import QtQuick 2.0
// import QtQuick.Layouts 1.3

// Rectangle {
//     id: equalWindowSizeRect
//     property color clockBgColor: "white"
//     property real hourAngle: 0
//     property real minuteAngle: 0
//     property real secondAngle: 0
//     property real hourHandLength: 0.4
//     property real minuteHandLength: 0.42
//     property real secondHandLength: 0.4

//     Rectangle {
//         id: clockRoot
//         width: 700
//         height: 700
//         radius: width / 2
//         anchors.centerIn: parent
//         color: equalWindowSizeRect.clockBgColor
//         border.color: "black"
//         border.width: 40

//         Repeater {
//             id: minutesBarsRepeater
//             model: 60
//             Rectangle {
//                 width: index % 5 == 0 ? 5 : 3
//                 height: index % 5 == 0 ? 60 : 50
//                 color: "black"
//                 transform: Rotation {
//                     origin.x: bar.width / 2
//                     origin.y: clockRoot.height / 2
//                     angle: (360 / 60) * index
//                 }
//                 anchors.horizontalCenter: parent.horizontalCenter
//             }
//         }

//         Timer {
//             repeat: true
//             interval: 1000
//             running: true
//             onTriggered: {
//                 secondAngle += 6; // Equivalent to 1 second
//             }
//         }

//         ClockNeedle {
//             id: hourHand
//             canvasX: -40
//             canvasY: -120
//             anchors.horizontalCenter: clockRoot.horizontalCenter
//             y: clockRoot.height / 2 - hourHand.height
//             width: 40
//             height: clockRoot.height * hourHandLength
//             angleRotate: hourAngle
//             onAngleRotateChanged: {
//                 hourAngle = angleRotate;
//                 minuteAngle = angleRotate * 12;
//             }
//         }

//         ClockNeedle {
//             id: minHand
//             canvasX: -50
//             canvasY: -25
//             anchors.horizontalCenter: clockRoot.horizontalCenter
//             y: clockRoot.height / 2 - minHand.height
//             width: 20
//             height: clockRoot.height * minuteHandLength
//             angleRotate: minuteAngle
//             onAngleRotateChanged: {
//                 minuteAngle = angleRotate;
//                 hourAngle = angleRotate / 12;
//             }
//         }

//         ClockNeedle {
//             id: second
//             canvasX: -60
//             canvasY: -25
//             anchors.horizontalCenter: clockRoot.horizontalCenter
//             y: clockRoot.height / 2 - second.height
//             width: clockRoot.width * 0.001
//             height: clockRoot.height * secondHandLength
//             angleRotate: secondAngle
//             handColor: "red"
//             borderColor: "red"
//             onAngleRotateChanged: {
//                 secondAngle = angleRotate;
//             }
//         }

//         Rectangle {
//             id: digitalClockBackground
//             color: "white"
//             width: digitalClock.width + 1
//             height: digitalClock.height + 1
//             anchors.horizontalCenter: digitalClock.horizontalCenter
//             y: clockRoot.height / 2 - second.height / 3
//             visible: digitalClock.visible
//             opacity: 0.7
//         }

//         Text {
//             id: digitalClock
//             anchors.horizontalCenter: clockRoot.horizontalCenter
//             y: clockRoot.height / 2 - second.height / 3
//             color: "black"

//             function updateTime() {
//                 var currentTime = new Date();
//                 var hours = Math.floor(hourAngle / 30);
//                 var minutes = Math.floor(minuteAngle / 6);
//                 var seconds = Math.floor(secondAngle / 6);
//                 return hours + ":" + minutes + ":" + seconds;
//             }

//             text: updateTime()
//             font.pixelSize: 30
//             font.bold: true
//             horizontalAlignment: Text.AlignHCenter
//             verticalAlignment: Text.AlignVCenter
//             Layout.fillHeight: true
//             Layout.fillWidth: true
//         }
//     }
// }

// import QtQuick 2.0
// import QtQuick.Layouts 1.3

// Rectangle {
//     id: equalWindowSizeRect
//     property color clockBgColor: "white"
//     property date time: new Date()
// property real hourAngle: (time.getHours() % 12 + time.getMinutes() / 60) * 360 / 12
// property real minuteAngle: (time.getMinutes() + time.getSeconds() / 60) * 360 / 60
// property real secondAngle: time.getSeconds() * 360 / 60
//     property real hourHandLength: 0.4
//     property real minuteHandLength: 0.42
//     property real secondHandLength: 0.4

//     Rectangle {
//         id: clockRoot
//         width: 700
//         height: 700
//         radius: width / 2
//         anchors.centerIn: parent
//         color: equalWindowSizeRect.clockBgColor
//         border.color: "black"
//         border.width: 40

//         Repeater {
//             id: minutesBarsRepeater
//             model: 60
//             Rectangle {
//                 id: bar
//                 width: index % 5 == 0 ? 5 : 3
//                 height: index % 5 == 0 ? 60 : 50
//                 color: "black"
//                 transform: Rotation {
//                     origin.x: bar.width / 2
//                     origin.y: clockRoot.height / 2
//                     angle: (360 / 60) * index
//                 }
//                 anchors.horizontalCenter: parent.horizontalCenter
//             }
//         }

//         Timer {
//             repeat: true
//             interval: 1000
//             running: true
//             onTriggered: {
//                 time.setSeconds(time.getSeconds() + 1);
//             }
//         }

//         ClockNeedle {
//             id: hourHand
//             canvasX: -40
//             canvasY: -120
//             anchors.horizontalCenter: clockRoot.horizontalCenter
//             y: clockRoot.height / 2 - hourHand.height
//             width: 40
//             height: clockRoot.height * hourHandLength
//             angleRotate: hourAngle
//             onAngleRotateChanged: {
//                 hourAngle = angleRotate;
//                 minuteAngle = angleRotate * 12;
//             }
//         }

//         ClockNeedle {
//             id: minHand
//             canvasX: -50
//             canvasY: -25
//             anchors.horizontalCenter: clockRoot.horizontalCenter
//             y: clockRoot.height / 2 - minHand.height
//             width: 20
//             height: clockRoot.height * minuteHandLength
//             angleRotate: minuteAngle
//             onAngleRotateChanged: {
//                 minuteAngle = angleRotate;
//                 hourAngle = angleRotate / 12;
//             }
//         }

//         ClockNeedle {
//             id: second
//             canvasX: -60
//             canvasY: -25
//             anchors.horizontalCenter: clockRoot.horizontalCenter
//             y: clockRoot.height / 2 - second.height
//             width: clockRoot.width * 0.001
//             height: clockRoot.height * secondHandLength
//             angleRotate: secondAngle
//             handColor: "red"
//             borderColor: "red"
//             onAngleRotateChanged: {
//                 secondAngle = angleRotate;
//             }
//         }

//         Rectangle {
//             id: digitalClockBackground
//             color: "white"
//             width: digitalClock.width + 1
//             height: digitalClock.height + 1
//             anchors.horizontalCenter: digitalClock.horizontalCenter
//             y: clockRoot.height / 2 - second.height / 3
//             visible: digitalClock.visible
//             opacity: 0.7
//         }

//         Text {
//             id: digitalClock
//             anchors.horizontalCenter: clockRoot.horizontalCenter
//             y: clockRoot.height / 2 - second.height / 3
//             color: "black"

//             function updateTime() {
//                 return time.toLocaleTimeString(Qt.locale(), "h:mm \nAP");
//             }

//             text: updateTime()
//             font.pixelSize: 30
//             font.bold: true
//             horizontalAlignment: Text.AlignHCenter
//             verticalAlignment: Text.AlignVCenter
//             Layout.fillHeight: true
//             Layout.fillWidth: true
//         }
//     }
// }


//Works only foreward direction
// import QtQuick 2.0
// Rectangle {
//     id: equalWindowSizeRect
//     property color clockBgColor: "white"
//     property date time: new Date()
//     property real hourAngle: (time.getHours() % 12 + time.getMinutes() / 60) * 360 / 12
//     property real minuteAngle: (time.getMinutes() + time.getSeconds() / 60) * 360 / 60
//     property real secondAngle: time.getSeconds() * 360 / 60
//     property real hourHandLength: 0.27
//     property real minuteHandLength: 0.42
//     property real secondHandLength: 0.42

//     Rectangle {
//         id: clockRoot
//         width: 700
//         height: 700
//         radius: width / 2
//         anchors.centerIn: parent
//         color: equalWindowSizeRect.clockBgColor
//         border.color: "black"
//         border.width: 40

//         Repeater {
//             id: minutesBarsRepeater
//             model: 60
//             Rectangle {
//                 id: bar
//                 width: index % 5 == 0 ? 5 : 3
//                 height: index % 5 == 0 ? 60 : 50
//                 color: "black"
//                 transform: Rotation {
//                     origin.x: bar.width / 2
//                     origin.y: clockRoot.height / 2
//                     angle: (360 / 60) * index
//                 }
//                 anchors.horizontalCenter: parent.horizontalCenter
//             }
//         }
//         NumberRepeater {
//             id: repeaterNumbers
//             anchors.fill: parent
//             allTimeNumbers: true
//         }

//         Timer {
//             repeat: true
//             interval: 1000
//             running: true
//             onTriggered: {
//                 time.setSeconds(time.getSeconds() + 1);
//                 secondHand.angleRotate += 6;
//             }
//         }

// Text {
//     id: ampm
//     anchors.horizontalCenter: clockRoot.horizontalCenter
//     y: clockRoot.height / 2 - secondHand.height / 5
//     color: "black"

//     function updateTime() {
//         return new Date().toLocaleTimeString(Qt.locale(), "AP")
//     }
//     text: updateTime()
//     font.pixelSize: 20
//     font.bold: true
//     horizontalAlignment: Text.AlignHCenter
//     verticalAlignment: Text.AlignVCenter
// }
//         ClockNeedle {
//             id: hourHand
//             canvasX: -40
//             canvasY: -120
//             anchors.horizontalCenter: clockRoot.horizontalCenter
//             y: clockRoot.height / 2 - hourHand.height
//             width: 40
//             height: clockRoot.height * hourHandLength
//             angleRotate: hourAngle
//             function onAngleChanged(angle) {
//                 hourAngle = angle;
//                 minuteAngle = angle * 12;
//                 minHand.angleRotate = minuteAngle;
//                 secondHand.angleRotate = secondAngle;
//             }
//         }

//         ClockNeedle {
//             id: minHand
//             canvasX: -50
//             canvasY: -25
//             anchors.horizontalCenter: clockRoot.horizontalCenter
//             y: clockRoot.height / 2 - minHand.height
//             width: 20
//             height: clockRoot.height * minuteHandLength
//             angleRotate: minuteAngle
//            function onAngleChanged(angle) {
//                 minuteAngle = angle;
//                 hourAngle = angle / 12;
//                 hourHand.angleRotate = hourAngle;
//                 secondHand.angleRotate = secondAngle;
//             }
//         }

//         ClockNeedle {
//             id: secondHand
//             canvasX: -60
//             canvasY: -25
//             anchors.horizontalCenter: clockRoot.horizontalCenter
//             y: clockRoot.height / 2 - secondHand.height
//             width: clockRoot.width * 0.001
//             height: clockRoot.height * secondHandLength
//             angleRotate: secondAngle
//             handColor: "red"
//             borderColor: "red"
//             function onAngleChanged(angle) {
//                 secondAngle = angle;
//             }
//         }

//         Rectangle {
//             id: digitalClockBackground
//             color: "white"
//             width: digitalClock.width + 1
//             height: digitalClock.height + 1
//             anchors.horizontalCenter: digitalClock.horizontalCenter
//             y: clockRoot.height / 2 - secondHand.height / 3
//             visible: digitalClock.visible
//             opacity: 0.7
//         }
//         Text {
//             id: digitalClock
//             anchors.horizontalCenter: clockRoot.horizontalCenter
//             y: clockRoot.height / 2 - secondHand.height / 3
//             color: "black"

//             function updateTimeFromAngles(hourAngle, minuteAngle, secondAngle) {
//                 console.log(hourAngle, minuteAngle, secondAngle)
//                 var hour = Math.floor(hourAngle / 30) % 12;
//                 var minute = Math.floor(minuteAngle / 6) % 60;
//                 if (hour === 0) {
//                     hour = 12;
//                 }
//                 return (hour < 10 ? "0" + hour : hour) + ":" +
//                        (minute < 10 ? "0" + minute : minute)
//             }
//             // function updateTimeFromAngles(hourAngle, minuteAngle, secondAngle) {
//             //     // Normalize angles to ensure they are within 0 to 360 degrees
//             //     hourAngle = hourAngle % 360;
//             //     if (hourAngle < 0) {
//             //         hourAngle += 360;
//             //     }

//             //     minuteAngle = minuteAngle % 360;
//             //     if (minuteAngle < 0) {
//             //         minuteAngle += 360;
//             //     }

//             //     secondAngle = secondAngle % 360;
//             //     if (secondAngle < 0) {
//             //         secondAngle += 360;
//             //     }

//             //     // Calculate hour and minute based on angles
//             //     var hour = Math.floor(hourAngle / 30) % 12; // 30 degrees per hour
//             //     var minute = Math.floor(minuteAngle / 6) % 60; // 6 degrees per minute

//             //     // Adjust hour and minute for negative angles
//             //     if (hourAngle < 0) {
//             //         hour = 12 - (hour % 12); // Ensure hour is within valid range
//             //     }
//             //     if (minuteAngle < 0) {
//             //         minute = 60 - (minute % 60); // Ensure minute is within valid range
//             //         hour--; // Decrement hour for negative minutes
//             //         if (hour < 0) {
//             //             hour += 12; // Adjust for negative hours after decrementing
//             //         }
//             //     }

//             //     // Ensure hour and minute are within valid range
//             //     if (hour === 0) {
//             //         hour = 12;
//             //     }

//             //     // Format the time
//             //     return (hour < 10 ? "0" + hour : hour) + ":" +
//             //            (minute < 10 ? "0" + minute : minute);
//             // }


//             text: updateTimeFromAngles(hourAngle, minuteAngle, secondAngle)
//             font.pixelSize: 30
//             font.bold: true
//             horizontalAlignment: Text.AlignHCenter
//             verticalAlignment: Text.AlignVCenter
//         }

// Connections {
//     target: hourHand
//     function onAngleChanged(angle) {
//         hourAngle = angle;
//         minuteAngle = angle * 12;
//         minHand.angleRotate = minuteAngle;
//         secondHand.angleRotate = secondAngle;
//     }
// }

// Connections {
//     target: minHand
//     function onAngleChanged(angle) {
//         minuteAngle = angle;
//         hourAngle = angle / 12;
//         hourHand.angleRotate = hourAngle;
//         secondHand.angleRotate = secondAngle;
//     }
// }

//     }
// }
import QtQuick 2.0

Rectangle {
    id: equalWindowSizeRect
    property color clockBgColor: "white"
    property date time: new Date()
    property real hourAngle: (time.getHours() % 12 + time.getMinutes() / 60) * 360 / 12
    property real minuteAngle: (time.getMinutes() + time.getSeconds() / 60) * 360 / 60
    property real secondAngle: time.getSeconds() * 360 / 60

    Rectangle {
        id: clockRoot
        width: 700
        height: 700
        radius: width / 2
        anchors.centerIn: parent
        color: equalWindowSizeRect.clockBgColor
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
            repeat: true
            interval: 1000
            running: true
            onTriggered: {
                time.setSeconds(time.getSeconds() + 1);
                        second.angleRotate = time.getSeconds() * 360 / 60;
                        minHand.angleRotate = (time.getMinutes() + time.getSeconds() / 60) * 360 / 60;
                        hourHand.angleRotate = (time.getHours() % 12 + time.getMinutes() / 60) * 360 / 12;
                        digitalClock.text = digitalClock.updateTime();
            }
        }
        Text {
            id: ampm
            anchors.horizontalCenter: clockRoot.horizontalCenter
            y: clockRoot.height / 2 - second.height / 5
            color: "black"

            function updateTime() {
                return new Date().toLocaleTimeString(Qt.locale(), "AP")
            }
            text: updateTime()
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
        //     onAngleRotateChanged: {
        //         var newMinutes = angleRotate * 60 / 360;
        //         newMinutes %= 60;
        //         var minuteDifference = newMinutes - time.getMinutes();
        //         if (minuteDifference < -30) {
        //             time.setHours((time.getHours() + 1) % 12);
        //         }
        //         else if (minuteDifference > 30) {
        //             time.setHours((time.getHours() - 1 + 12) % 12);
        //         }
        //         time.setMinutes(newMinutes);
        //         // time.setSeconds(0);
        //         // secondAngle =time.getSeconds() * 360 / 60
        //         // hourAngle =(time.getHours() % 12 + time.getMinutes() / 60) * 360 / 12
        //         // minuteAngle =(time.getMinutes() + time.getSeconds() / 60) * 360 / 60

        //     }
            onAngleRotateChanged: {
                    // Update time based on rotated angle
                    var newMinutes = angleRotate * 60 / 360;
                    newMinutes %= 60;
                    var minuteDifference = newMinutes - time.getMinutes();
                    if (minuteDifference < -30) {
                        time.setHours((time.getHours() + 1) % 12);
                    } else if (minuteDifference > 30) {
                        time.setHours((time.getHours() - 1 + 12) % 12);
                    }
                    time.setMinutes(newMinutes);
                    // Update digital clock text
                    digitalClock.text = digitalClock.updateTime();
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
            // onAngleRotateChanged: {
            //     time.setHours(angleRotate * 12 / 360);
            //     //time.setSeconds(0);
                // var newMinutes = (angleRotate % 30) * 2;
                // if (newMinutes != time.getMinutes()) {
                //     time.setMinutes(newMinutes);
                // }
            // //     secondAngle =time.getSeconds() * 360 / 60
            // //     hourAngle =(time.getHours() % 12 + time.getMinutes() / 60) * 360 / 12
            // //     minuteAngle =(time.getMinutes() + time.getSeconds() / 60) * 360 / 60
            // }
            onAngleRotateChanged: {
                    // Update time based on rotated angle
                    time.setHours(angleRotate * 12 / 360);
                var newMinutes = (angleRotate % 30) * 2;
                if (newMinutes != time.getMinutes()) {
                    time.setMinutes(newMinutes);
                }
                    // Update digital clock text
                    digitalClock.text = digitalClock.updateTime();
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
            // angleRotate: time.getSeconds() * 360 / 60
            handColor: "red"
            borderColor: "red"
            // onAngleRotateChanged: {
            //     time.setSeconds(angleRotate * 12 / 360);

            // }
            onAngleRotateChanged: {
                   // Update time based on rotated angle
                   time.setSeconds(angleRotate * 60 / 360);
                   // Update digital clock text
                   digitalClock.text = digitalClock.updateTime();
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
                }            }

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
                hourHand.dashedLineVisible = !hourHand.dashedLineVisible
                minHand.dashedLineVisible = !minHand.dashedLineVisible
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
                    text: second.dashedLineVisible ? "OFF" : "ON"
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
