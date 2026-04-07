/* Ng'anjo OS — Calamares Slideshow */
import QtQuick 2.0
import calamares.slideshow 1.0

Presentation {
    id: presentation

    Slide {
        Image {
            id: background
            source: "welcome.png"
            fillMode: Image.PreserveAspectFit
            anchors.centerIn: parent
        }
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 40
            text: "Installing Ng'anjo OS 1.0 Lite — \"Arise\""
            color: "#E6EDF5"
            font.pixelSize: 22
        }
    }

    Slide {
        Text {
            anchors.centerIn: parent
            text: "Built on Arch Linux. Runs on every machine."
            color: "#00D2B4"
            font.pixelSize: 20
        }
    }

    Timer {
        interval: 5000
        running: presentation.activatedInCalamares
        repeat: true
        onTriggered: presentation.goToNextSlide()
    }
}
