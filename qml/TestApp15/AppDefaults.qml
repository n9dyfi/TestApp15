import QtQuick 1.1

Item {

    property int cCOLOR_SCHEME : 4
    property int cDEFAULT_MARGIN : 16

    property int cHEADER_DEFAULT_HEIGHT_PORTRAIT : 72
    property int cHEADER_DEFAULT_TOP_SPACING_PORTRAIT : 15
    property int cHEADER_DEFAULT_BOTTOM_SPACING_PORTRAIT : 15

    property int cHEADER_DEFAULT_HEIGHT_LANDSCAPE : 64
    property int cHEADER_DEFAULT_TOP_SPACING_LANDSCAPE : 9
    property int cHEADER_DEFAULT_BOTTOM_SPACING_LANDSCAPE : 13

    property string cFONT_FAMILY : "Nokia pure Text Light"
    property int cFONT_SIZE_LARGE : 32
    property int cFONT_SIZE_SMALL : 22
    property int cFONT_SIZE_TINY : 18
    property string cFONT_FAMILY_BUTTON : "Nokia pure Text"
    property int cFONT_SIZE_BUTTON : 20

    property int cTEXT_AREA_HEIGHT : 60
    property string cVIEW_HEADER : "image://theme/color"+cCOLOR_SCHEME+"-meegotouch-view-header-fixed"
    property string cBUTTON_BACKGROUND: "image://theme/color"+cCOLOR_SCHEME+"-meegotouch-button-accent-background"


    property int cHEADER_HEIGHT : (inPortrait)?cHEADER_DEFAULT_HEIGHT_PORTRAIT:
                          cHEADER_DEFAULT_HEIGHT_LANDSCAPE
    property int cHEADER_TOP_SPACING : (inPortrait)?cHEADER_DEFAULT_TOP_SPACING_PORTRAIT:
                         cHEADER_DEFAULT_TOP_SPACING_LANDSCAPE
    property int cHEADER_BOTTOM_SPACING : (inPortrait)?cHEADER_DEFAULT_BOTTOM_SPACING_PORTRAIT:
                         cHEADER_DEFAULT_BOTTOM_SPACING_LANDSCAPE
    property int cHEADER_REDUCED_BOTTOM_SPACING : (inPortrait)?
                         0.75*cHEADER_DEFAULT_BOTTOM_SPACING_PORTRAIT:
                         0.5*cHEADER_DEFAULT_BOTTOM_SPACING_LANDSCAPE
    property int cFONT_SIZE : (inPortrait)?cFONT_SIZE_TINY:cFONT_SIZE_SMALL

    Component.onCompleted:
        theme.colorScheme = cCOLOR_SCHEME

}
