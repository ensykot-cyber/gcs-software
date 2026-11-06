import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtLocation
import QtPositioning

ApplicationWindow {
    id: window
    width: 1366
    height: 768
    visible: true
    title: qsTr("TEKNOFEST 2026 Fighter UAV GCS")
    color: "#0f131a"

    ColumnLayout {
        anchors.fill: parent
        spacing: 2

        // ================= 1. TOP HEADER BAR =================
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 65
            color: "#121721"
            border.color: "#1f293d"
            border.width: 2

            RowLayout {
                anchors.fill: parent
                anchors.margins: 6
                spacing: 15

                // Left: Logo & Text
                RowLayout {
                    spacing: 8
                    Layout.alignment: Qt.AlignVCenter
                    Rectangle {
                        width: 45; height: 45
                        color: "#1a2332"; border.color: "#3b82f6"; border.width: 1; radius: 4
                        Label { anchors.centerIn: parent; text: "LOGO"; color: "#ff5722"; font.bold: true; font.pixelSize: 10 }
                    }
                    Column {
                        Layout.alignment: Qt.AlignVCenter
                        Label { text: "NATIONAL"; color: "#94a3b8"; font.pixelSize: 9; font.bold: true }
                        Label { text: "TECHNOLOGY"; color: "#94a3b8"; font.pixelSize: 9; font.bold: true }
                        Label { text: "INITIATIVE"; color: "#94a3b8"; font.pixelSize: 9; font.bold: true }
                    }
                }

                Rectangle { Layout.preferredWidth: 1; Layout.fillHeight: true; color: "#2d3748" }

                // Center: Title Banner
                Rectangle {
                    Layout.fillWidth: true; Layout.fillHeight: true
                    color: "#0d131f"; border.color: "#2563eb"; border.width: 1
                    gradient: Gradient {
                        GradientStop { position: 0.0; color: "#172554" }
                        GradientStop { position: 0.5; color: "#0f172a" }
                        GradientStop { position: 1.0; color: "#172554" }
                    }
                    RowLayout {
                        anchors.centerIn: parent
                        Label {
                            text: "TEKNOFEST 2027 FIGHTER UAV COMPETITION - GROUND CONTROL STATION"
                            color: "#ffffff"; font.bold: true; font.pixelSize: 14; font.letterSpacing: 1
                        }
                    }
                }

                Rectangle { Layout.preferredWidth: 1; Layout.fillHeight: true; color: "#2d3748" }

                // Right: Status
                ColumnLayout {
                    Layout.alignment: Qt.AlignVCenter
                    spacing: 4
                    RowLayout {
                        spacing: 15; Layout.alignment: Qt.AlignRight
                        Label { text: "CONNECTION STATUS:  ●  illl"; color: "#22c55e"; font.pixelSize: 10; font.bold: true }
                        Label { text: "🎯 GPS LOCK [3D]"; color: "#22c55e"; font.pixelSize: 10; font.bold: true }
                    }
                    RowLayout {
                        spacing: 15; Layout.alignment: Qt.AlignRight
                        Label { text: "SERVER CONNECTION: ONLINE (1Hz)"; color: "#22c55e"; font.pixelSize: 10; font.bold: true }
                    }
                }
            }
        }

        // ================= 2. MIDDLE SECTION =================
        RowLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 2

            // Left Panel: FPV Camera Placeholder
            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "#0d1117"
                border.color: "#30363d"

                Label {
                    anchors.centerIn: parent
                    text: "LIVE FPV CAMERA / TARGETING AREA"
                    color: "#8b949e"
                    font.pixelSize: 16
                }
            }

            // Right Panel: Tactical Map + Telemetry HUD Overlay
            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "#0a0e14"
                border.color: "#30363d"
                border.width: 1

                // OpenStreetMap Plugin
                Plugin {
                    id: mapPlugin
                    name: "osm"
                }

                // Interactive Map View
                Map {
                    anchors.fill: parent
                    plugin: mapPlugin
                    center: QtPositioning.coordinate(25.9080, 89.4440) // লালমনিরহাটের ডিফল্ট কোঅর্ডিনেট
                    zoomLevel: 14

                    // No-Fly Zone (লাল বৃত্ত)
                    MapCircle {
                        center: QtPositioning.coordinate(25.9100, 89.4450)
                        radius: 500.0
                        color: "#55ff0000"
                        border.width: 2
                        border.color: "red"
                    }
                }

                // Telemetry HUD Sidebar Overlay
                Rectangle {
                    width: 210
                    height: 220
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.margins: 10
                    color: "#cc0d1117"
                    border.color: "#30363d"
                    border.width: 1

                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 10
                        spacing: 6

                        Label { text: "TELEMETRY HUD"; color: "#38bdf8"; font.bold: true; font.pixelSize: 11 }
                        Rectangle { Layout.fillWidth: true; height: 1; color: "#30363d" }

                        Label { text: "SPEED:     78 km/h"; color: "#22c55e"; font.pixelSize: 11; font.bold: true }
                        Label { text: "ALTITUDE:  124m AGL"; color: "#22c55e"; font.pixelSize: 11; font.bold: true }
                        Label { text: "BATTERY:   82%"; color: "#22c55e"; font.pixelSize: 11; font.bold: true }
                        Label { text: "SIGNAL:    98%"; color: "#22c55e"; font.pixelSize: 11; font.bold: true }
                        Label { text: "MODE:      AUTONOMOUS"; color: "#22c55e"; font.pixelSize: 11; font.bold: true }
                        Label { text: "FAILSAFE:  ACTIVE"; color: "#facc15"; font.pixelSize: 11; font.bold: true }
                    }
                }
            }
        }

        // ================= 3. BOTTOM SECTION =================
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 180
            color: "#161b22"
            border.color: "#30363d"

            RowLayout {
                anchors.fill: parent
                anchors.margins: 5
                spacing: 2

                // System Log Panel (Live Scrolling Logs)
                Rectangle {
                    Layout.fillHeight: true
                    Layout.preferredWidth: 400
                    color: "#0d1117"
                    border.color: "#30363d"

                    ListView {
                        anchors.fill: parent
                        anchors.margins: 10
                        clip: true
                        model: 10 // ডামি ১০টি লাইন
                        delegate: Label {
                            text: "[84-06-406] - Dirxxial from UAV's nose camera."
                            color: "#8b949e"
                            font.pixelSize: 12
                            font.family: "Courier"
                        }
                    }
                }

                // Flight Gauges Panel (Speed & Altitude Meters)
                Rectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    color: "#0d1117"
                    border.color: "#30363d"

                    RowLayout {
                        anchors.centerIn: parent
                        spacing: 40

                        // Speedometer Gauge
                        Rectangle {
                            width: 120; height: 120
                            radius: 60
                            color: "transparent"
                            border.color: "#8b949e"
                            border.width: 2

                            Label {
                                anchors.centerIn: parent
                                text: "124\nkm/h"
                                color: "white"
                                font.pixelSize: 18
                                font.bold: true
                                horizontalAlignment: Text.AlignHCenter
                            }
                        }

                        // Altimeter Gauge
                        Rectangle {
                            width: 120; height: 120
                            radius: 60
                            color: "transparent"
                            border.color: "#8b949e"
                            border.width: 2

                            Label {
                                anchors.centerIn: parent
                                text: "250\nAGL"
                                color: "white"
                                font.pixelSize: 18
                                font.bold: true
                                horizontalAlignment: Text.AlignHCenter
                            }
                        }
                    }
                }
            }
        }
    }
}