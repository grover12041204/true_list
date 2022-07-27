import 'package:flutter/material.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:true_list/color.dart';
import 'package:true_list/global_variables.dart';
import 'package:true_list/screens/post_screens/post_finish_screen.dart';

class MapSearch extends StatefulWidget {
  @override
  MapSearchState createState() => MapSearchState();
}

class MapSearchState extends State<MapSearch> {
  String googleApikey = "AIzaSyD5z4kop-eoO-xW6rUFJSxLO8PdRNX6Gj8";
  GoogleMapController? mapController; //contrller for Google map
  CameraPosition? cameraPosition;
  LatLng startLocation = LatLng(17.441451, 78.382431);
  String location = "Search Location";
  bool premiumAdd = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Google Maps"),
          backgroundColor: appColors.darkBlue,
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => postFinishScreen()));
                },
                child: Text(
                  "Save",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ))
          ],
        ),
        body: Stack(children: [
          GoogleMap(
            zoomGesturesEnabled: true,
            initialCameraPosition: CameraPosition(
              target: startLocation,
              zoom: 17.0,
            ),
            mapType: MapType.normal,
            onMapCreated: (controller) {
              setState(() {
                mapController = controller;
              });
            },
          ),
          Positioned(
              top: 10,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Card(
                    child: Container(
                  padding: EdgeInsets.all(0),
                  width: MediaQuery.of(context).size.width - 40,
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      InkWell(
                        onTap: () async {
                          var place = await PlacesAutocomplete.show(
                              context: context,
                              apiKey: googleApikey,
                              mode: Mode.overlay,
                              types: [],
                              strictbounds: false,
                              components: [Component(Component.country, 'in')],
                              //google_map_webservice package
                              onError: (err) {
                                print(err);
                              });
                          if (place != null) {
                            setState(() {
                              location = place.description.toString();
                              locationString.add(location.split(',').first);
                              print(locationString);
                            });
                            // locationString[index]
                            //               .split(',')
                            //               .first
                            //               .toString()

                            //form google_maps_webservice package
                            final plist = GoogleMapsPlaces(
                              apiKey: googleApikey,
                              apiHeaders: await GoogleApiHeaders().getHeaders(),
                              //from google_api_headers package
                            );
                            String placeid = place.placeId ?? "0";
                            final detail =
                                await plist.getDetailsByPlaceId(placeid);
                            final geometry = detail.result.geometry!;
                            final lat = geometry.location.lat;
                            final lang = geometry.location.lng;
                            var newlatlang = LatLng(lat, lang);
                            setState(() {
                              latitudeList.add(lat);
                              LongitudeList.add(lang);
                              postFinishPremiumLocaion.add(premiumAdd);
                            });

                            //move map camera to selected place with animation
                            mapController?.animateCamera(
                                CameraUpdate.newCameraPosition(CameraPosition(
                                    target: newlatlang, zoom: 12)));
                          }
                        },
                        child: Row(
                          children: [
                            SizedBox(width: 20),
                            Text(
                              location,
                              style: TextStyle(fontSize: 18),
                            ),
                            Spacer(),
                            Icon(Icons.search),
                            SizedBox(width: 10),
                          ],
                        ),
                      ),
                      SizedBox(height: 25),
                      Row(
                        children: [
                          SizedBox(width: 5),
                          Text('Make it a premium Ad'),
                          Spacer(),
                          Container(
                            child: FlutterSwitch(
                              inactiveToggleBorder:
                                  Border.all(width: 3, color: Colors.black),
                              inactiveColor: Colors.white,
                              switchBorder:
                                  Border.all(width: 3, color: Colors.black),
                              activeText: '',
                              inactiveText: '',
                              activeColor: Colors.black,
                              activeToggleColor: Colors.white,
                              inactiveToggleColor: Colors.white,
                              width: 55,
                              height: 30,
                              toggleSize: 25,
                              value: premiumAdd,
                              borderRadius: 70,
                              showOnOff: true,
                              onToggle: (val) {
                                setState(() {
                                  premiumAdd = val;
                                  print(premiumAdd.toString());
                                });
                              },
                            ),
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                  // trailing: Icon(Icons.search),
                  // dense: true,
                )),
              ))
        ]));
  }
}
