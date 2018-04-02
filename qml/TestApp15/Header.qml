import QtQuick 1.1
import com.nokia.meego 1.0

Item {
    property alias headerText: titleLabel.text

    property string viewHeader: appDefaults.cVIEW_HEADER
    property string headerFontFamily : appDefaults.cFONT_FAMILY

    property int headerTopSpacing : appDefaults.cHEADER_TOP_SPACING
    property int headerBottomSpacing : appDefaults.cHEADER_BOTTOM_SPACING
    property int headerFontSize : appDefaults.cFONT_SIZE_LARGE
    property int defaultMargin: appDefaults.cDEFAULT_MARGIN

    // header dimensions
    height: appDefaults.cHEADER_HEIGHT
    width: parent.width

    // Header background image
    Image {
        id: titleImage
        height: parent.height
        width: parent.width
        source: viewHeader
    }
    // Define the label styling
    LabelStyle {
        id: labelStyle
        textColor: "white"
        fontFamily: headerFontFamily
        fontPixelSize: headerFontSize
    }
    // Header text
    Label {
        id: titleLabel
        platformStyle: labelStyle
        anchors {
            top:parent.top; topMargin:headerTopSpacing;
            left:parent.left; leftMargin:defaultMargin
        }
    }
}
