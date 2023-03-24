// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';

// import 'package:location/location.dart';
// import 'package:mapbox_gl/mapbox_gl.dart';

// const MAPBOX_ACCESS_TOKEN =
//     'pk.eyJ1IjoiYWxleGFsejk4IiwiYSI6ImNsZHo2aGZuNDB5Ymczdm55MWlhamdzNWMifQ.4Ky6I2IrHWZkXULmLPgQqA';

// class Prueba extends StatefulWidget {
//   const Prueba({Key? key}) : super(key: key);

//   @override
//   _PruebaState createState() => _PruebaState();
// }

// class _PruebaState extends State<Prueba> {
//   late LocationData _locationData;
//   late MapboxMapController _mapController;
//   final _location = Location();

//   @override
//   void initState() {
//     super.initState();
//     _location.onLocationChanged.listen((locationData) {
//       setState(() {
//         _locationData = locationData;
//       });
//     });
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _mapController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: MapboxMap(
//         accessToken: MAPBOX_ACCESS_TOKEN,
//         onMapCreated: (controller) {
//           setState(() {
//             _mapController = controller;
//           });
//         },
//         myLocationEnabled: true,
//         myLocationRenderMode: MyLocationRenderMode.NORMAL,
//         initialCameraPosition: CameraPosition(
//           target: LatLng(0, 0),
//           zoom: 10,
//         ),
//         onStyleLoadedCallback: () async {
//           await _mapController
//               .animateCamera(CameraUpdate.zoomTo(16.0))
//               .asStream()
//               .first;
//           await _location.getLocation().then((locationData) {
//             setState(() {
//               _locationData = locationData;
//             });
//           });
//           await _mapController.animateCamera(
//             CameraUpdate.newLatLng(
//               LatLng(_locationData.latitude!, _locationData.longitude!),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
