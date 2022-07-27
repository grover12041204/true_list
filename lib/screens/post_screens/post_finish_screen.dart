import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:true_list/color.dart';
import 'package:true_list/global_variables.dart';
import 'package:true_list/screens/google_maps/search_map.dart';
import 'package:true_list/screens/post_screens/post_details_screen.dart';
import 'package:true_list/screens/post_screens/post_full_detail_screen.dart';

class postFinishScreen extends StatefulWidget {
  postFinishScreen({Key? key}) : super(key: key);

  @override
  State<postFinishScreen> createState() => _postFinishScreenState();
}

class _postFinishScreenState extends State<postFinishScreen> {
  Completer<GoogleMapController> _controller = Completer();
  Completer<GoogleMapController> _maocontroller = Completer();
  GoogleMapController? mapController;
  CameraPosition? cameraPosition1;
  static int mapindex = 0;
  DateTime _date = DateTime.now();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(17.441536, 78.382435),
    zoom: 14.4746,
  );

  static final CameraPosition _cameraPosition = CameraPosition(
    target:
        LatLng(latitudeList[mapindex], LongitudeList[latitudeList.length - 1]),
    zoom: 12,
  );

  static final Marker _myLocationmarker = Marker(
    markerId: MarkerId('_myLocaton'),
    infoWindow: InfoWindow(title: 'Rend a Desk'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(17.441536, 78.382435),
  );
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: appColors.darkBlue,
      body: Column(
        children: [
          SizedBox(height: size.height * 0.060),
          Row(
            children: [
              SizedBox(width: 10),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image.asset(
                  'assets/icons/left_arrow.png',
                  height: 24,
                ),
              ),
              Text(
                'Finish',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              Spacer(),
              Text(
                'Save',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              SizedBox(
                width: 19,
              )
            ],
          ),
          Flexible(
              child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25),
                )),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(height: 25),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Table(
                    children: [
                      TableRow(children: [
                        Image.asset('assets/icons/post_current_bar.png'),
                        Image.asset('assets/icons/post_current_bar.png'),
                        Image.asset('assets/icons/post_current_bar.png'),
                        Image.asset('assets/icons/post_current_bar.png'),
                      ]),
                      TableRow(children: [
                        SizedBox(height: 15),
                        SizedBox(height: 10),
                        SizedBox(height: 10),
                        SizedBox(height: 10),
                      ]),
                      TableRow(children: [
                        Center(child: Text("1. Photo")),
                        Center(child: Text("2. Details")),
                        Center(child: Text('3. Price')),
                        Center(child: Text('4. Finish')),
                      ]),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(width: 20),
                    Text(
                      'Set the ad location',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Spacer(),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'change',
                          style: TextStyle(
                            color: appColors.postMapBlueColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    SizedBox(width: 20)
                  ],
                ),
                // SizedBox(height: ),
                Container(
                  height: 220,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: GoogleMap(
                    myLocationButtonEnabled: true,
                    scrollGesturesEnabled: false,
                    markers: {_myLocationmarker},
                    myLocationEnabled: true,
                    mapType: MapType.normal,
                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    'default is your current location',
                    style: TextStyle(color: appColors.greyLoginText),
                  ),
                ),
                SizedBox(height: 40),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Ad will be posted at locations',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MapSearch(),
                      ),
                    );
                    print(latitudeList);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      '+ Add Other locations',
                      style: TextStyle(
                        fontSize: 18,
                        color: appColors.standartBlueColor,
                      ),
                    ),
                  ),
                ),
                latitudeList.isNotEmpty
                    ? Container(
                        height: latitudeList.length * 340,
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: latitudeList.length,
                            itemBuilder: (BuildContext context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(width: 20),
                                      Text(locationString[index]
                                          .split(',')
                                          .first
                                          .toString()),
                                      SizedBox(width: 10),
                                      Text(
                                        postFinishPremiumLocaion[index] == true
                                            ? ' Premium '
                                            : '',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: appColors.postMapBlueColor,
                                        ),
                                      ),
                                      Spacer(),
                                      TextButton(
                                        onPressed: () {
                                          print(postFinishPremiumLocaion[index]
                                              .toString());
                                          setState(() {
                                            latitudeList.removeAt(index);
                                            LongitudeList.removeAt(index);
                                            locationString.removeAt(index);
                                            postFinishPremiumLocaion
                                                .removeAt(index);
                                          });
                                        },
                                        child: Text(
                                          'delete',
                                          style: TextStyle(
                                              color: appColors.postMapBlueColor,
                                              fontSize: 16),
                                        ),
                                      ),
                                      SizedBox(width: 20),
                                    ],
                                  ),
                                  Container(
                                    height: 220,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                    child: GoogleMap(
                                        initialCameraPosition: CameraPosition(
                                            target: LatLng(
                                              latitudeList[index],
                                              LongitudeList[index],
                                            ),
                                            zoom: 12),
                                        markers: {
                                          Marker(
                                            markerId: MarkerId('Add Location'),
                                            infoWindow: InfoWindow(
                                                title: locationString[index]
                                                    .split(',')
                                                    .first
                                                    .toString()),
                                            icon:
                                                BitmapDescriptor.defaultMarker,
                                            position: LatLng(
                                              latitudeList[index],
                                              LongitudeList[index],
                                            ),
                                          )
                                        }
                                        // onMapCreated: (GoogleMapController controller) {
                                        //   mapController?.animateCamera(
                                        //       CameraUpdate.newCameraPosition(CameraPosition(
                                        //           target: LatLng(
                                        //             latitudeList[latitudeList.length - 1],
                                        //             LongitudeList[latitudeList.length - 1],
                                        //           ),
                                        //           zoom: 12)));
                                        // },
                                        ),
                                  ),
                                ],
                              );
                            }),
                      )
                    : SizedBox(height: 200),
                InkWell(
                  onTap: () {
                    setState(() {
                      PostGlobalData.locationArray
                          .add({'Lat': '17.441536', 'long': '78.382435'});
                      PostGlobalData.defaultLocation
                          .addAll([17.441536, 78.382435]);
                      PostGlobalData.otherLatLocation.addAll(latitudeList);
                      PostGlobalData.otherLongLocation.addAll(LongitudeList);
                      PostGlobalData.premiumLocation
                          .addAll(postFinishPremiumLocaion);
                      PostGlobalData.locationName.addAll(locationString);
                      PostGlobalData.date =
                          DateFormat('yyyy-MM-dd').format(_date);
                      print(PostGlobalData.defaultLocation);
                      print(PostGlobalData.otherLatLocation.toString());
                      print(PostGlobalData.otherLongLocation.toString());
                      print(PostGlobalData.premiumLocation.toString());
                      print(PostGlobalData.locationName);
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostFullDetailScreen(),
                      ),
                    );
                  },
                  child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: appColors.darkBlue,
                      ),
                      child: Text(
                        'Save & Continue',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      )),
                ),
                SizedBox(height: 70),

                // Container(
                //   child: ,
                // )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
