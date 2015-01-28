import QtQuick 2.0
import QtQuick.Controls 1.3
import QtMultimedia 5.0


ApplicationWindow {    
    id: window
    width: 1440
    height: 900
    visible: true


    // Overlay
    Item {
        width: 100
        height: 100
        z: 1

        Rectangle {
            width: window.width/4
            height: window.height
            color: "green"
        }
    }

    // Player
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
