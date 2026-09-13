import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: root

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height + Theme.paddingLarge

        VerticalScrollDecorator {}

        Column {
            id: column
            width: parent.width
			
            PageHeader {
                title: qsTrId("Switcher Layout")
            }
            ComboBox {
                id: button_mode_combo
                width: parent.width
                label: "Pin Corner"
                description: "Select which corner the app covers shall be pinned to"
                menu: ContextMenu {
                    MenuItem {
                        text: "Top Left (system default)"
                    }
                    MenuItem {
                        text: "Top Right"
                    }
                    MenuItem {
                        text: "Bottom Left"
                    }
                    MenuItem {
                        text: "Bottom Right"
                    }
                }
            }
        }
    }
}
