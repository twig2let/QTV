import QtQuick 2.0
import QtQuick.Controls 1.3
import QtMultimedia 5.0


ApplicationWindow {
    title: qsTr("Hello World")
    id: window
    width: 1440
    height: 900
    visible: true

    Item {
        MediaPlayer {
            id: mediaplayer
            source: "file:///Users/twig/Documents/dev/TV/theGoodWifeClip.mov"
            autoPlay: true
        }

        VideoOutput {
            width: window.width
            height: window.height
            fillMode: 'PreserveAspectFit'
            source: mediaplayer
        }
    }
}
