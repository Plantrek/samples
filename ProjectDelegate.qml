import QtQuick 2.14




Item {

    id: projectDelegate

    signal remove(int index)
    signal open(int index)

    property int closeRectWidth: 20

    Rectangle {
        anchors.fill: parent

        Row {
            anchors.fill: parent
            Column {
                width: parent.width - closeRectWidth


                Text {
                    text: name
                    font.bold: true
                    font.pixelSize: 12
                    width: parent.width
                    elide: Text.ElideMiddle
                    leftPadding: 5
                    rightPadding: 5
                    topPadding: 2.5
                    bottomPadding: 2.5
                }

                Text {
                    text: path
                    font.pixelSize: 12
                    width: parent.width
                    elide: Text.ElideMiddle
                    leftPadding: 5
                    rightPadding: 5
                    bottomPadding: 2.5

                }


            }

            Rectangle {
                width: closeRectWidth
                height: parent.height
                color: "transparent"
                visible: true
                Text {
                    id: closeText
                    anchors.centerIn: parent
                    text: "X"

                }

                MouseArea {
                    id:childMouse
                    anchors.fill: parent
                    hoverEnabled: true

                    onPressed: {

                        console.log("pressed at child")
                    }

                    onEntered: {

                        parent.color = "blue"

                    }

                    onExited: {

                        parent.color = "transparent"

                    }
                }
            }
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            onPressed: {
                open(index)
            }

            onEntered: {

                parent.color = "gray"
                closeText.visible = true

            }

            onExited: {

                parent.color = "transparent"
                closeText.visible = false

            }
        }
    }
}

