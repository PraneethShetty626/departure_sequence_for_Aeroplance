// import 'package:crimdetect/map.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
      
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

  

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
    
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
  
//     return Scaffold(
//       appBar: AppBar(
     
//         title: Text(widget.title),
//       ),
//       body: const CrimeMap(),
//     );
//   }
// }


import 'package:crimdetect/map.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Map',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PopupController _popupController = PopupController();
  MapController _mapController = MapController();
  double _zoom = 7;
  List<LatLng> _latLngList = [
    LatLng(13, 77.5),
    LatLng(13.02, 77.51),
    LatLng(13.05, 77.53),
    LatLng(13.055, 77.54),
    LatLng(13.059, 77.55),
    LatLng(13.07, 77.55),
    LatLng(13.1, 77.5342),
    LatLng(13.12, 77.51),
    LatLng(13.015, 77.53),
    LatLng(13.155, 77.54),
    LatLng(13.159, 77.55),
    LatLng(13.17, 77.55),
  ];
  List<Marker> _markers = [];

  @override
  void initState() {
    _markers = _latLngList
        .map((point) => Marker(
              point: point,
              width: 60,
              height: 60,
              builder: (context) =>const Icon(
                Icons.pin_drop,
                size: 60,
                color: Colors.blueAccent,
              ),
              
            ))
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: MStram(),
      // body: FlutterMap(
      //   mapController: _mapController,
      //   options: MapOptions(
      //     // swPanBoundary: LatLng(13, 77.5),
      //     // nePanBoundary: LatLng(13.07001, 77.58),
      //     center: _latLngList[0],
      //     bounds: LatLngBounds.fromPoints(_latLngList),
      //     zoom: _zoom,
      //     plugins: [
      //       MarkerClusterPlugin(),
      //     ],
      //     // onTap:_popupController.hidePopup(),
      //     onTap: (a,b){
      //       AlertDialog(
      //         title: Text("Clicked"),
      //       );
      //     }
      //   ),
      //   layers: [
      //     TileLayerOptions(
      //       minZoom: 2,
      //       maxZoom: 18,
      //       backgroundColor: Colors.white10,
      //       // errorImage: ,
      //       urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      //       subdomains: ['a', 'b', 'c'],
      //     ),
      //     MarkerClusterLayerOptions(
      //       maxClusterRadius: 190,
      //       disableClusteringAtZoom: 16,
      //       size:const Size(50, 50),
      //       fitBoundsOptions:const FitBoundsOptions(
      //         padding: EdgeInsets.all(50),
      //       ),
      //       markers: _markers,
      //       polygonOptions:const PolygonOptions(
      //           borderColor: Colors.blueAccent,
      //           color: Colors.black12,
      //           borderStrokeWidth: 3),
      //       popupOptions: PopupOptions(
      //           // popupSnap: PopupSnap.top,
      //           popupController: _popupController,
      //           popupBuilder: (_, marker) => Container(
                  
      //                 color: Colors.amberAccent,
      //                 child: Text("lattitude: "+marker.point.latitude.toString()+" longitude: "+marker.point.longitude.toString()),
      //               )),
      //       builder: (context, markers) {
      //         return Container(
      //           alignment: Alignment.center,
      //           decoration:
      //             const  BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
      //           child: Text('${markers.length}'),
      //         );
      //       },
      //     ),
      //   ],
      // ),
    );
  }
}