/*
 * Copyright (C) 2018 by Neo <ll56325827@outlook.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Library General Public License as
 * published by the Free Software Foundation; either version 2 or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this program; if not, write to the
 * Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

import QtQuick 2.1
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.2
import QtQuick.Controls 1.0 as QtControls

// for "units"
import org.kde.plasma.core 2.0 as PlasmaCore


ColumnLayout {
    id: root
    property alias cfg_IndexPage: webPage.text

    RowLayout {
        spacing: units.largeSpacing / 2

        QtControls.Label {
            Layout.minimumWidth: width
            Layout.maximumWidth: width
            width: formAlignment - units.largeSpacing
            horizontalAlignment: Text.AlignRight
            text: i18nd("plasma_wallpaper_org.kde.plasma.videowallpaper", "Web Page:")
        }
		QtControls.TextField {
			id: webPage
			Layout.fillWidth: true
		}
        QtControls.Button {
			text: "..."
			onClicked: fileDialog.open()
        }
    }

    Item { // tighten layout
        Layout.fillHeight: true
    }

	FileDialog {
		id: fileDialog
		title: i18nd("plasma_wallpaper_org.kde.plasma.videowallpaper", "Select a web page")
		nameFilters: "Web pages (*.html *.htm)"
		onAccepted: cfg_IndexPage = fileDialog.fileUrls[0]
	}
}
