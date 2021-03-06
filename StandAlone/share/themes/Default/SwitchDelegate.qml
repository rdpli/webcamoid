/* Webcamoid, webcam capture application.
 * Copyright (C) 2019  Gonzalo Exequiel Pedone
 *
 * Webcamoid is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Webcamoid is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Webcamoid. If not, see <http://www.gnu.org/licenses/>.
 *
 * Web-Site: http://webcamoid.github.io/
 */

import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Templates 2.5 as T
import QtQuick.Controls.impl 2.12
import Ak 1.0

T.SwitchDelegate {
    id: control
    icon.width: AkUnit.create(18 * ThemeSettings.controlScale, "dp").pixels
    icon.height: AkUnit.create(18 * ThemeSettings.controlScale, "dp").pixels
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + implicitIndicatorWidth
                            + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding,
                             implicitIndicatorHeight + topPadding + bottomPadding)
    padding: AkUnit.create(4 * ThemeSettings.controlScale, "dp").pixels
    spacing: AkUnit.create(8 * ThemeSettings.controlScale, "dp").pixels
    hoverEnabled: true
    clip: true

    readonly property int animationTime: 200

    indicator: Item {
        id: sliderIndicator
        anchors.right: control.right
        anchors.rightMargin: control.rightPadding
        anchors.verticalCenter: control.verticalCenter
        implicitWidth:
            AkUnit.create(36 * ThemeSettings.controlScale, "dp").pixels
        implicitHeight:
            AkUnit.create(20 * ThemeSettings.controlScale, "dp").pixels

        Rectangle {
            id: switchTrack
            height: parent.height / 2
            color: control.highlighted?
                       ThemeSettings.colorActiveHighlightedText:
                       ThemeSettings.colorActiveWindowText
            radius: height / 2
            anchors.verticalCenter: sliderIndicator.verticalCenter
            anchors.right: sliderIndicator.right
            anchors.left: sliderIndicator.left
        }
        Item {
            id: switchThumb
            width: height
            anchors.bottom: sliderIndicator.bottom
            anchors.top: sliderIndicator.top

            Rectangle {
                id: switchThumbRect
                color: control.highlighted?
                           ThemeSettings.colorActiveHighlightedText:
                           ThemeSettings.colorActiveWindowText
                radius: height / 2
                anchors.fill: parent
            }
        }
    }

    contentItem: IconLabel {
        id: iconLabel
        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display
        icon.name: control.icon.name
        icon.source: control.icon.source
        icon.width: control.icon.width
        icon.height: control.icon.height
        icon.color:
            control.highlighted?
                ThemeSettings.colorActiveHighlightedText:
                ThemeSettings.colorActiveWindowText
        text: control.text
        font: control.font
        color: control.highlighted?
                   ThemeSettings.colorActiveHighlightedText:
                   ThemeSettings.colorActiveWindowText
        alignment: Qt.AlignLeft
        anchors.leftMargin: control.leftPadding
        anchors.left: control.left
        anchors.right: sliderIndicator.left
    }

    background: Rectangle {
        id: background
        implicitWidth:
            AkUnit.create(128 * ThemeSettings.controlScale, "dp").pixels
        implicitHeight:
            AkUnit.create(48 * ThemeSettings.controlScale, "dp").pixels
        color: control.highlighted?
                   ThemeSettings.colorActiveHighlight:
                   ThemeSettings.shade(ThemeSettings.colorActiveWindow, 0, 0)
    }

    states: [
        State {
            name: "Disabled"
            when: !control.enabled

            PropertyChanges {
                target: switchTrack
                color: control.highlighted?
                           ThemeSettings.colorDisabledHighlightedText:
                           ThemeSettings.colorDisabledWindowText
            }
            PropertyChanges {
                target: switchThumbRect
                color: control.highlighted?
                           ThemeSettings.colorDisabledHighlightedText:
                           ThemeSettings.colorDisabledWindowText
            }
            PropertyChanges {
                target: iconLabel
                icon.color:
                    control.highlighted?
                        ThemeSettings.colorDisabledHighlightedText:
                        ThemeSettings.colorDisabledWindowText
                color:
                    control.highlighted?
                        ThemeSettings.colorDisabledHighlightedText:
                        ThemeSettings.colorDisabledWindowText
            }
            PropertyChanges {
                target: background
                color: control.highlighted?
                           ThemeSettings.colorDisabledHighlight:
                           ThemeSettings.shade(ThemeSettings.colorDisabledWindow, 0, 0)
            }
        },
        State {
            name: "Checked"
            when: control.checked
                  && !(control.hovered
                       || control.visualFocus
                       || control.activeFocus)
                  && !control.pressed

            PropertyChanges {
                target: switchThumb
                x: sliderIndicator.width - switchThumb.width
            }
        },
        State {
            name: "Hovered"
            when: !control.checked
                  && (control.hovered
                      || control.visualFocus
                      || control.activeFocus)
                  && !control.pressed

            PropertyChanges {
                target: background
                color:
                    control.highlighted?
                        ThemeSettings.constShade(ThemeSettings.colorActiveHighlight,
                                                     0.1):
                        ThemeSettings.shade(ThemeSettings.colorActiveWindow, -0.1)
            }
        },
        State {
            name: "CheckedHovered"
            when: control.checked
                  && (control.hovered
                      || control.visualFocus
                      || control.activeFocus)
                  && !control.pressed

            PropertyChanges {
                target: switchThumb
                x: sliderIndicator.width - switchThumb.width
            }
            PropertyChanges {
                target: background
                color:
                    control.highlighted?
                        ThemeSettings.constShade(ThemeSettings.colorActiveHighlight,
                                                 0.1):
                        ThemeSettings.shade(ThemeSettings.colorActiveWindow, -0.1)
            }
        },
        State {
            name: "Pressed"
            when: !control.checked
                  && control.pressed

            PropertyChanges {
                target: background
                color:
                    control.highlighted?
                        ThemeSettings.constShade(ThemeSettings.colorActiveHighlight,
                                                 0.2):
                        ThemeSettings.shade(ThemeSettings.colorActiveWindow, -0.2)
            }
        },
        State {
            name: "CheckedPressed"
            when: control.checked
                  && control.pressed

            PropertyChanges {
                target: switchThumb
                x: sliderIndicator.width - switchThumb.width
            }
            PropertyChanges {
                target: background
                color:
                    control.highlighted?
                        ThemeSettings.constShade(ThemeSettings.colorActiveHighlight,
                                                 0.2):
                        ThemeSettings.shade(ThemeSettings.colorActiveWindow, -0.2)
            }
        }
    ]

    transitions: Transition {
        PropertyAnimation {
            target: switchTrack
            properties: "color"
            duration: control.animationTime
        }
        PropertyAnimation {
            target: switchThumb
            properties: "x"
            duration: control.animationTime
        }
        PropertyAnimation {
            target: switchThumbRect
            properties: "color"
            duration: control.animationTime
        }
        ColorAnimation {
            target: iconLabel
            duration: control.animationTime
        }
        ColorAnimation {
            target: background
            duration: control.animationTime
        }
    }
}
