import QtQuick 2.2
import Sailfish.Silica 1.0

Page {
    onAccepted: {

    }
    DBManager {
        id: dbmanager
    }
    property variant list: dbmanager.fetchAllFiles()
    SilicaGridView {
        onCreationCompleted: {
                list: dbmanager.fetchAllFiles()
            }

        header: PageHeader { title: qsTr("Notes") }
        anchors.fill: parent
        cellWidth: width / 2
        cellHeight: cellWidth
        delegate: Label {
            width: GridView.view.cellWidth
            height: GridView.view.cellHeight
            text: (list[model.index])
            color: Theme.highlightColor
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }
        model: list.length

        VerticalScrollDecorator { }

        PullDownMenu {
            backgroundColor: "green"
            highlightColor: backgroundColor
            quickSelect: true

            MenuItem {
                text: "New note"
                onClicked: {
                    pageStack.push(Qt.resolvedUrl("NewNotePage.qml"))
                    console.log(qsTr("Option clicked"))
                }
            }
        }
    }
}
