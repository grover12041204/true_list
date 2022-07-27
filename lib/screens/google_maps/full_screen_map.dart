// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:true_list/color.dart';

// class MapDetailView extends StatefulWidget {
//   @override
//   State<MapDetailView> createState() => MapDetailViewState();
// }

// class MapDetailViewState extends State<MapDetailView> {
//   Completer<GoogleMapController> _controller = Completer();
//   TextEditingController _searchController = TextEditingController();

//   static final CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(37.42796133580664, -122.085749655962),
//     zoom: 14.4746,
//   );

//   static final CameraPosition _kLake = CameraPosition(
//       bearing: 192.8334901395799,
//       target: LatLng(37.43296265331129, -122.08832357078792),
//       tilt: 59.440717697143555,
//       zoom: 19.151926040649414);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: const Text(
//         'Google Maps',
//       )),
//       body: Column(
//         children: [
//           Row(
//             children: [
//               Expanded(
//                   child: Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(width: 1, color: Colors.blue),
//                   borderRadius: BorderRadius.circular(10),
//                   color: appColors.postBackgroundColor,
//                 ),
//                 height: 50,
//                 padding: EdgeInsets.only(left: 14),
//                 child: TextField(
//                   onChanged: (value) {
//                     print(value);
//                   },
//                   controller: _searchController,
//                   style: const TextStyle(fontSize: 22),
//                   decoration: const InputDecoration(
//                     suffixIcon: Icon(Icons.search),
//                     border: InputBorder.none,
//                     hintText: 'Search the place',
//                     counterText: '',
//                   ),
//                 ),
//               )),
//             ],
//           ),
//           Expanded(
//             child: GoogleMap(
//               mapType: MapType.normal,
//               initialCameraPosition: _kGooglePlex,
//               onMapCreated: (GoogleMapController controller) {
//                 _controller.complete(controller);
//               },
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: _goToTheLake,
//         label: Text('To the lake!'),
//         icon: Icon(Icons.directions_boat),
//       ),
//     );
//   }

//   Future<void> _goToTheLake() async {
//     final GoogleMapController controller = await _controller.future;
//     controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
//   }
// }
