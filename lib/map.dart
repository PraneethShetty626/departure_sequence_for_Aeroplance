import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_map/flutter_map.dart';
import 'dart:convert';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';

class MStram extends StatefulWidget {
  const MStram({Key? key}) : super(key: key);

  @override
  State<MStram> createState() => _MStramState();
}

class _MStramState extends State<MStram> {
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref("/");

  int func(var ab, var bc) {
    print(ab);
    print(bc);
    return 1;
  }

  final PopupController _popupController = PopupController();
  MapController _mapController = MapController();
  double _zoom = 7;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (context, AsyncSnapshot<DatabaseEvent?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active &&
            snapshot.hasData) {
          List<Marker> _markers = [];
          List<LatLng> _latLngList = [];
          Map<Object?, Object?>? val =
              snapshot.data!.snapshot.value as Map<Object?, Object?>;
          print(val);
          val.forEach(
            (key, value) {
              var latlist = double.parse(
                  key.toString().split('_')[0].replaceRange(2, 3, '.'));

              var longlist = double.parse(
                  key.toString().split('_')[1].replaceRange(2, 3, '.'));

              // DateTime time = DateTime.parse(value.toString());
              LatLng lto = LatLng(latlist, longlist);
              _latLngList.add(lto);
              _markers.add(Marker(
                  point: lto,
                  builder: (context) => const Icon(
                        Icons.pin_drop,
                        size: 60,
                        color: Colors.blueAccent,
                      )));
            },
          );
          return FlutterMap(
            mapController: _mapController,
            options: MapOptions(
                // swPanBoundary: LatLng(13, 77.5),
                // nePanBoundary: LatLng(13.07001, 77.58),
                center: _latLngList[0],
                bounds: LatLngBounds.fromPoints(_latLngList),
                zoom: _zoom,
                plugins: [
                  MarkerClusterPlugin(),
                ],
                // onTap:_popupController.hidePopup(),
                onTap: (a, b) {
                  AlertDialog(
                    title: Text("Clicked"),
                  );
                }),
            layers: [
              TileLayerOptions(
                minZoom: 2,
                maxZoom: 18,
                backgroundColor: Colors.white10,
                // errorImage: ,
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: ['a', 'b', 'c'],
              ),
              MarkerClusterLayerOptions(
                maxClusterRadius: 190,
                disableClusteringAtZoom: 16,
                size: const Size(50, 50),
                fitBoundsOptions: const FitBoundsOptions(
                  padding: EdgeInsets.all(50),
                ),
                markers: _markers,
                polygonOptions: const PolygonOptions(
                    borderColor: Colors.blueAccent,
                    color: Colors.black12,
                    borderStrokeWidth: 3),
                popupOptions: PopupOptions(
                    // popupSnap: PopupSnap.top,
                    popupController: _popupController,
                    popupBuilder: (_, marker) => Container(
                          color: Colors.amberAccent,
                          child: Text("lattitude: " +
                              marker.point.latitude.toString() +
                              " longitude: " +
                              marker.point.longitude.toString()),
                        )),
                builder: (context, markers) {
                  return Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: Colors.orange, shape: BoxShape.circle),
                    child: Text('${markers.length}'),
                  );
                },
              ),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(strokeWidth: 4),
          );
        }
      },
      stream: ref.onValue,
    );
  }
}
