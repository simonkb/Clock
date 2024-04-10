import QtQuick 2.0
import QtQuick.Window 2.15
import QtQuick.Layouts 1.3
import "qrc:/Components" as ClockComponents

Window {
    width: 800
    height: 800
    visible: true
    title: qsTr("Clock")
    RowLayout{
        anchors.fill: parent
        ClockComponents.Clock {
            id:analogClockQML
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }
}
