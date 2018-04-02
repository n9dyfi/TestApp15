import QtQuick 1.1
import com.nokia.meego 1.0

// About - Credits - Translation - License

Page {

    property int textWidth
    property string content

    Flickable {
        id: flick
        x: defaultMargin
        y: headerHeight+defaultMargin
        width: parent.width-2*defaultMargin
        height: parent.height-headerHeight-defaultMargin
        contentWidth: textbox.width
        contentHeight: textbox.height
        clip: true

        TextEdit {
            id: textbox
            text: content
            width: textWidth
            font.pixelSize: textSize
            wrapMode: TextEdit.Wrap
        }
    }

}
