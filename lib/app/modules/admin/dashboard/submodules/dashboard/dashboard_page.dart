import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  var mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return map();
  }

  Widget map() {
    return Stack(
      children: [
        FlutterMap(
          mapController: mapController,
          options: MapOptions(
            onTap: (location) {
//          setState(() {
//            markers.add(maker(context, LatLng(location.latitude, location.longitude)));
//          });
            },
            onLongPress: (location) {
              print(
                  "Map onLongPress ${location.latitude} ${location.longitude}");
            },
            center: LatLng(-13.009264, -42.414665),
            zoom: 13,
            maxZoom: 19,
            minZoom: 12,
          ),
          layers: [
            TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c'],
            ),
            // MarkerLayerOptions(
            //   markers: markers,
            // ),
          ],
          children: <Widget>[
            TileLayerWidget(
                options: TileLayerOptions(
                    urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c'])),
            MarkerLayerWidget(
                options: MarkerLayerOptions(
              markers: [
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: LatLng(-13.009264, -42.414665),
                  builder: (ctx) => Container(
                    child: FlutterLogo(),
                  ),
                ),
              ],
            )),
          ],
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                // FloatingActionButton(
                //   child: Icon(Icons.add, color: Colors.white),
                //   onPressed: () {
                //     var zoom = mapController.zoom;
                //     mapController.move(
                //       LatLng(-13.009264, -42.414665),
                //       zoom + 1,
                //     );
                //   },
                // ),
                FloatingActionButton(
                  child: Icon(Icons.remove, color: Colors.white),
                  onPressed: () {
                    var zoom = mapController.zoom;
                    mapController.move(
                      LatLng(-13.009264, -42.414665),
                      zoom - 1,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
