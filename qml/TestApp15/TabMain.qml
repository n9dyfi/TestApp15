import QtQuick 1.1
import com.nokia.meego 1.0

// This is a generic tab page with a header
// API
// - property tabNames : a string list containing the tab names
// - signal setPageContent(int pageNumber, string pageContent)

Page {

    property int defaultMargin: appDefaults.cDEFAULT_MARGIN
    property int textSize: appDefaults.cFONT_SIZE
    property int headerHeight: appDefaults.cHEADER_HEIGHT

    // Define the tab names
    property variant tabNames

    // Page header
    //
    Header {
        id: header
        headerText: "TestApp15"
        // Close button
        ToolIcon {
            platformIconId: "browser-stop"
            onClicked: pageStack.pop()
            anchors { right: parent.right; rightMargin: defaultMargin/2
                verticalCenter: parent.verticalCenter}
        }
    }

    // Instantiate the tab pages
    // Use the tab name as a placeholder text
    //
    TabGroup {
        id: tabGroup
        Repeater {
            id: tabPages
            model: tabNames.length  // number of tabs pages to create
            TabPage {
                textWidth: header.width-2*defaultMargin
                // Initial content can be replaced with the setPageContent signal
                content: tabNames[index]
                // Copy the tab name to the header when tab is activated
                onStatusChanged: {
                    if(status===PageStatus.Active)
                        header.headerText = tabNames[index]
                }
            }
        }
    }

    // Define the tab buttons in the toolbar
    //
    tools: ToolBarLayout {
        id: tabTools
        ButtonRow {
            id: buttonRow
            Repeater {
                id: tabButtons
                model: tabNames
                TabButton {
                    text: modelData
                    font.pixelSize: textSize
                    tab: tabPages.itemAt(index)
                }
            }
        }
    }

    // Select the active tab
    //
    Component.onCompleted: {
        tabGroup.currentTab = tabPages.itemAt(0)
        buttonRow.checkedButton = tabButtons.itemAt(0)
    }

    // Connect the setPageContent signal
    //
    Connections {
        target: appWindow
        onSetPageContent: {
            tabPages.itemAt(pageNumber).content = pageContent
        }
    }

}
