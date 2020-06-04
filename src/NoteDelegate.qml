/*
 * SPDX-FileCopyrightText: (C) 2020 by Ismael Asensio <isma.af@gmail.com>
 * SPDX-License-Identifier: GPL-2.0-or-later
 */

import QtQuick 2.14
import QtQuick.Layouts 1.14
import QtQuick.Controls 2.14 as QQC2

import org.kde.kirigami 2.12 as Kirigami


Kirigami.AbstractListItem {

    RowLayout {
        Kirigami.Icon {
            source: model.decoration
            Layout.preferredHeight: Kirigami.Units.iconSizes.smallMedium
            Layout.preferredWidth: Kirigami.Units.iconSizes.smallMedium
        }

        Loader {
            id: contentLoader
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignTop

            sourceComponent: {
                switch (model.type) {
                    case 255: return groupRenderer;
                    case 3: return imageRenderer;
                    default: return textRenderer;
                }
            }

            Component {
                id: groupRenderer
                // ERROR: GroupRenderer is instantiated recursively
                //             GroupRenderer {
                //                 model: root.model.childrenObjects
                //             }
                QQC2.Label {
                    text: model.display
                }
            }
            Component {
                id: textRenderer
                TextEdit {
                    text: model.display
                    textFormat: TextEdit.RichText
                    wrapMode: TextEdit.WordWrap
                }
            }
            Component {
                id: imageRenderer
                Image {
                    source: model.display
                    fillMode: Image.PreserveAspectFit
                    Layout.alignment: Qt.AlignTop
                }
            }
        }

        QQC2.ToolTip {
            visible: hovered
            text: model.toolTip
        }
    }
}
