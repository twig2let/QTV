import QtQuick 2.0
import QtQuick.Controls 1.3
import QtMultimedia 5.0
import QtGraphicalEffects 1.0


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
            id: sidebar
            width: window.width/4
            height: window.height

            visible: false

            ColorOverlay {
//                  id: jeff
//                  width: window.width
//                  height: window.height
//                  source: videoOutput

              }

            focus: true
            Keys.onSpacePressed: showMenu()

        }

    }

    // Player
    Item {
        id: bob

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


    // Show Menu
    function showMenu() {
        sidebar.visible = !sidebar.visible;
        videoOutput.angle = videoOutput.angle > 0 ? 0 : 10;


    }
}
