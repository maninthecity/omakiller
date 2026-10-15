import QtQuick
import Quickshell
import qs.Commons
import qs.Ui

BarWidget {
  id: root

  moduleName: "io.github.maninthecity.omakiller"

  // Path to the omakiller script inside this plugin's folder.
  // Resolved from this file's own location, so it works however the plugin was installed.
  readonly property string scriptPath:
    decodeURIComponent(String(Qt.resolvedUrl("omakiller")).replace(/^file:\/\//, ""))

  implicitWidth: button.implicitWidth
  implicitHeight: button.implicitHeight

  BarIconButton {
    id: button
    anchors.fill: parent
    bar: root.bar
    text: "󰆴"
    slotSize: Style.bar.iconSlot
    opticalSize: Style.bar.iconCanvas
    fontSize: Style.bar.iconFont
    foreground: root.bar ? root.bar.barForeground : Color.foreground
    fixedWidth: root.vertical ? root.barSize : Style.bar.iconSlot
    tooltipText: "Kill"

    onPressed: function(mouseButton) {
      if (root.bar && typeof root.bar.run === "function")
        root.bar.run("python3 '" + root.scriptPath + "'")
    }
  }
}
