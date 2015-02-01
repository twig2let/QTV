import QtQuick 2.0
import QtQuick.Controls 1.3
import QtMultimedia 5.0
import QtGraphicalEffects 1.0


ApplicationWindow {
    id: window
    width: 1440
    height: 900
    visible: true

    // Global Properties
    property int _windowWidth: window.width
    property int _windowHeight: window.height

    // Top Menu
    Item {
        z: 1

        Rectangle {
            id: topMenu
            width: _windowWidth; height: _windowHeight*0.08
            color: 'white'

            Image {
                id: twitterImage
                fillMode: Image.PreserveAspectFit
                anchors.verticalCenter: parent.verticalCenter
                height: topMenu.height*0.6
                source: 'images/Twitter_logo_blue.png'
                verticalAlignment: Image.AlignVCenter
                smooth: true;
            }

            MouseArea {
                anchors.fill: twitterImage
                onClicked: {
                    showTwitterStream();
                }
                cursorShape: Qt.PointingHandCursor;
            }
        }
    }

    // Show Twitter Stream
    function showTwitterStream() {
        console.info('Launching Twitter Stream')
    }






//    // Player
    Item {
        id: bob
        z: 0

        MediaPlayer {
            id: mediaplayer
            source: "file:///Users/twig/Documents/dev/TV/theGoodWifeClip.mov"
            autoPlay: true
        }

        VideoOutput {
            id: videoOutput
            property real angle: 0
            width: window.width
            height: window.height
            fillMode: 'PreserveAspectFit'
            source: mediaplayer


            transform: Rotation {
                axis.x: 0
                axis.y: window.height/2
                axis.z: 0
                angle: videoOutput.angle

                Behavior on angle {
                    SpringAnimation { spring: 3.0; damping: 0.5; duration: 700}
                }

            }
        }
    }


//    // Show Menu
//    function showMenu() {
//        sidebar.visible = !sidebar.visible;
//        videoOutput.angle = videoOutput.angle > 0 ? 0 : 10;
//    }
}
