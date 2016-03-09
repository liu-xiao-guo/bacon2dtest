import QtQuick 2.2
import Bacon2D 1.0

Game {
    id: game
    width: 800
    height: 600
    focus: true
    currentScene: scene

    Scene {
        id: scene
        anchors.fill: parent
        physics: true
        debug: false

        Boundaries {}

        Ball {
            id: ball
            x: parent.x
            y: parent.y
            rotation: 0
            width: 50
            height: 50
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                ball.body.applyLinearImpulse(
                            Qt.point((mouseX - ball.x),
                                     (mouseY - ball.y)),
                            Qt.point(ball.x, ball.y))
            }
        }
        Item {
            id: innerBox
            anchors.centerIn: scene
            width: 300
            height: 300

            Boundaries {
                anchors.fill: parent
                Rectangle {
                    anchors.fill: parent
                    color: "black"
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    innerBall.body.applyLinearImpulse(
                                Qt.point((mouseX - innerBall.x),
                                         (mouseY - innerBall.y)),
                                Qt.point(innerBall.x, innerBall.y))
                }
            }
        }

        Ball {
            id: innerBall

            x: innerBox.x + innerBox.width/2
            y: innerBox.y + innerBox.height/2
            rotation: 0
            width: 50
            height: 50
        }


    }

    Rectangle {
        id: debugButton
        anchors {
            left: parent.left
            top: parent.top
            margins: 20
        }
        z: 10
        width: 150
        height: 50
        Text {
            id: debugButtonText
            anchors.centerIn: parent
            text: scene.debug ? "Debug: on" : "Debug: off"
            font.pixelSize: 18
            font.bold: true

        }
        color: "#DEDEDE"
        border.color: "#999"
        radius: 5
        MouseArea {
            anchors.fill: parent
            onClicked: scene.debug = !scene.debug
        }
    }
}

