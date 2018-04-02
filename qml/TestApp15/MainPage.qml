import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    tools: commonTools

    Header {
        id: header
        headerText: "TestApp15"
    }

    Button{
        anchors.centerIn: parent
        anchors.verticalCenterOffset: header.height/2
        text: qsTr("Tab the page!")
        onClicked: openTabMainRequested()
    }

    Connections {
        target: appWindow
        onOpenTabMain: pageStack.push(Qt.resolvedUrl("TabMain.qml"),{tabNames:tabNames})
    }

}
