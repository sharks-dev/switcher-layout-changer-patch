import QtQuick 2.0
import Sailfish.Silica 1.0
import Nemo.Configuration 1.0

Page {
    id: root

    ConfigurationValue {
        id: cornerConfig
        key: "/apps/patchmanager/switcher_layout/corner"
        defaultValue: 0
    }

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

                property bool _completed: false

                Component.onCompleted: {
                    currentIndex = cornerConfig.value
                    _completed = true
                }

                onCurrentIndexChanged: {
                    if (_completed && currentIndex >= 0) {
                        cornerConfig.value = currentIndex
                    }
                }

                menu: ContextMenu {
                    MenuItem { text: "Top Left (system default option)" }
                    MenuItem { text: "Top Right" }
                    MenuItem { text: "Bottom Left" }
                    MenuItem { text: "Bottom Right" }
                }
            }
        }
    }
}