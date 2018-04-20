import QtQuick 2.5
import QtQuick.Controls 1.4
import QtLocation 5.5
import QtPositioning 5.5

ApplicationWindow {
    id: root
    visible: true
    width: 1300
    height: 800
    title: qsTr("Map overview")

    property var magione: QtPositioning.coordinate(26.358435, 50.115972)

    Plugin {
        id: somePlugin
        name: "mapbox"
        PluginParameter { name: "useragent"; value: "Qt MAPBOX application" }
        PluginParameter { name: "mapbox.access_token"; value: "pk.eyJ1IjoiYWNocmFmc3dpZiIsImEiOiJjamcxNXhmczkwZ3E1MndxcGYyMGNoenkyIn0.JFcn6VTMkCfMx498mLuSOA" }
    }

    RouteModel {
        id: routeModel
        plugin: somePlugin
        query: RouteQuery {}
        Component.onCompleted: {
            query.addWaypoint(QtPositioning.coordinate(26.328045523310905, 50.080033033011546));
            query.addWaypoint(QtPositioning.coordinate(26.333615791655415, 50.097984054173025));
            routeModel.update();
        }
    }

    RouteModel {
        id: rm
        plugin: somePlugin
        query: RouteQuery {}
        Component.onCompleted: {
            query.addWaypoint(QtPositioning.coordinate(26.291584, 50.199094));
            query.addWaypoint(QtPositioning.coordinate(26.288128, 50.188725));
            rm.update();
        }
    }

    RouteModel {
        id: rm1
        plugin: somePlugin
        query: RouteQuery {}
        Component.onCompleted: {
            query.addWaypoint(QtPositioning.coordinate(26.278496, 50.203740));
            query.addWaypoint(QtPositioning.coordinate(26.272351, 50.185939));
            rm.update();
        }
    }

    Map {
        id: map
        anchors.fill: parent
        plugin: somePlugin
        center: magione
        gesture.enabled: true
        zoomLevel: 13


        MapItemView {
            model: routeModel
            delegate: MapRoute {
                route: routeData
                line.color: "blue"
                line.width: 5
                smooth: true
                visible: true
            }
        }

        MapItemView {
            model: rm
            delegate: MapRoute {
                route: routeData
                line.color: "green"
                line.width: 5
                smooth: true
                visible: true
            }
        }

        MapItemView {
            model: rm2
            delegate: MapRoute {
                route: routeData
                line.color: "black"
                line.width: 5
                smooth: true
                visible: true
            }
        }
    }
}
