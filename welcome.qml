import QtQuick 2.14
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs 1.0
import QtQuick.Layouts 1.3



Window {
    id: window
    visible: true
    width: 300
    height: 480
    maximumWidth: 740
    maximumHeight: 480


    title: qsTr("Welcome To Plantrek")

//    signal removeProject(int index)

    RowLayout {
        id: wrapperRow
        anchors.rightMargin: 400
        anchors.fill: parent
        spacing: 0
        Rectangle {
            width: 300
            height: parent.height
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0

            ListView {
                id: projectList

                anchors.fill: parent
                model: projects

                delegate: ProjectDelegate{

                        width: parent.width
                        height: 40

                        onRemove: {
                            console.log(index)
                        }

                        onOpen: {
                            console.log(index)
                        }

                }

            }


        }
    }

    FileDialog {
        id: openFileDialog
        title: "Please choose a plantrek project file"
        folder: shortcuts.home
        onAccepted: {
            console.log("You chose: " + fileDialog.fileUrls)

        }
        onRejected: {
            console.log("Canceled")
            Component: visible = false
        }
        //         Component.onCompleted: visible = true

    }

    Connections {
        target: openProject
        onClicked: openFileDialog.open()
    }


}

/*##^##
Designer {
    D{i:5;anchors_height:50;anchors_y:20}
}
##^##*/
