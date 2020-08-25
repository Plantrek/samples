import QtQuick 2.14
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs 1.0

Window {
    id: window
    visible: true
    width: 640
    height: 480
    maximumWidth: 640
    maximumHeight: 480
    title: qsTr("Welcome To Plantrek")

    Row {
        id: wrapperRow
        anchors.fill: parent
    Item {
        id: projectsView
        width: 303
        height: 480
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0

        ListView {
            id: projectList
            x: 0
            y: 0
            width: 300
            height: 480
            delegate: Item {
                x: 5
                width: 80
                height: 40
                Row {
                    id: row1
                    Rectangle {
                        width: 40
                        height: 40
                        color: colorCode
                    }

                    Text {
                        text: name
                        font.bold: true
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    spacing: 10
                }
            }
            model: ListModel {
                ListElement {
                    name: "Grey"
                    colorCode: "grey"
                }

                ListElement {
                    name: "Red"
                    colorCode: "red"
                }

                ListElement {
                    name: "Blue"
                    colorCode: "blue"
                }

                ListElement {
                    name: "Green"
                    colorCode: "green"
                }
            }
        }
    }

    Column {
        id: welcomeView
        x: 300
        y: 0
        width: 340
        height: 480


        Row {
            id: logoRow
            y: 30
            height: 50
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
            spacing: 0
            Image {
                id: logoImage
            y: 0
            width: 295
            height: 36
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            fillMode: Image.PreserveAspectFit
            source: "images/PText.png"
        }
        Text {
            id: productBranch
            x: 0
            text: qsTr("QTO")
            anchors.right: parent.right
            anchors.rightMargin: 0
            verticalAlignment: Text.AlignBottom
            anchors.bottom: logoImage.bottom
            anchors.bottomMargin: 0
        }
        }
        Column {
            id: column
            x: 0
            width: 340
            height: 275
            anchors.top: parent.top
            anchors.topMargin: 200
            anchors.verticalCenter: parent.verticalCenter
            opacity: 1
            spacing: 14


            Button {
                id: openProject
                height: 26
                text:"Open Project"
                anchors.horizontalCenter: parent.horizontalCenter


            }

            Button{
                id: newProject
                height: 26
                text: "New Project"
                anchors.horizontalCenter: parent.horizontalCenter


            }
        }
        Text {
            id: element
            x: 616
            y: 395
            text: qsTr("[EA]")
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5

            font.pixelSize: 12
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
    D{i:2;anchors_x:0;anchors_y:0}D{i:15;anchors_x:0;anchors_y:0}D{i:16;anchors_x:0}D{i:14;anchors_height:50;anchors_width:340;anchors_x:0;anchors_y:30}
D{i:17;anchors_y:0}
}
##^##*/
