import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:true_list/color.dart';
import 'package:true_list/global_variables.dart';
import 'package:true_list/screens/google_maps/search_map.dart';
import 'package:http/http.dart' as http;
import 'package:cross_file_image/cross_file_image.dart';

class PostFullDetailScreen extends StatefulWidget {
  const PostFullDetailScreen({Key? key}) : super(key: key);

  @override
  State<PostFullDetailScreen> createState() => _PostFullDetailScreenState();
}

class _PostFullDetailScreenState extends State<PostFullDetailScreen> {
  DateTime _date = DateTime.now();
  int imageIndex = 0;
  Completer<GoogleMapController> _controller = Completer();
  // String im2 = FileImage(FilteringTextInputFormatter);
  Widget createTabl1() {
    List<TableRow> rows = [];
    for (int i = 0; i < PostGlobalData.fields.length; i++) {
      rows.add(TableRow(children: [
        Center(
          child: Text(PostGlobalData.subcategory[i]),
        )
      ]));
    }
    return Table(children: rows);
  }

  Widget createTabl2() {
    List<TableRow> rows = [];
    for (int i = 0; i < PostGlobalData.fields.length; i++) {
      rows.add(TableRow(children: [
        Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: appColors.postBackgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              PostGlobalData.fields[i],
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            )),
      ]));
    }
    return Table(children: rows);
  }

  @override
  Widget build(BuildContext context) {
    // fullImage = globla_images;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: ListView(padding: EdgeInsets.zero, children: [
          Container(
            width: double.infinity,
            height: 350,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: XFileImage(globla_images![imageIndex])),
            ),

            child: Stack(children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                      padding: const EdgeInsets.only(left: 20, top: 38),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          size: 35,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )))
            ]),
            // child: Image.asset('assets/image2.png'),
          ),
          SizedBox(height: 15),
          Container(
              // decoration: BoxDecoration(
              //     color: Colors.amber,
              //     borderRadius: BorderRadius.only(
              //       topLeft: Radius.circular(30),
              //       topRight: Radius.circular(30),
              //     )),
              height: 60,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: globla_images!.length,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 10, right: 5),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            imageIndex = index;
                          });
                        },
                        child: Container(
                          width: 55,
                          height: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: XFileImage(globla_images![index])),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    );
                  })),
          SizedBox(height: 20),
          Divider(thickness: 2, indent: 5),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Table(children: [
              TableRow(children: [
                createTabl1(),
                // Container(
                //   height: 25,
                //   child: ListView.builder(
                //       scrollDirection: Axis.horizontal,
                //       itemCount: PostGlobalData.subcategory.length > 4
                //           ? 4
                //           : PostGlobalData.subcategory.length,
                //       itemBuilder: (context, index) {
                //         return Center(
                //           child: Text(PostGlobalData.subcategory[index]),
                //         );
                //       }),
                // ),
                SizedBox(width: 100),
              ]),
              TableRow(children: [
                createTabl2(),
                // Container(
                //   height: 25,
                //   child: ListView.builder(
                //       scrollDirection: Axis.horizontal,
                //       itemCount: PostGlobalData.fields.length > 4
                //           ? 4
                //           : PostGlobalData.fields.length,
                //       itemBuilder: (context, index) {
                //         return Container(
                //             alignment: Alignment.center,
                //             decoration: BoxDecoration(
                //               color: appColors.postBackgroundColor,
                //               borderRadius: BorderRadius.circular(10),
                //             ),
                //             child: Text(
                //               PostGlobalData.fields[index],
                //               style: TextStyle(
                //                   fontWeight: FontWeight.w700, fontSize: 16),
                //             ));
                //       }),
                // ),
                SizedBox(width: 100),
              ]),
            ]),
          ),

          //  Table(
          //     children: [
          //       TableRow(children: [
          //         Center(child: Text("Year")),
          //         Center(child: Text("Model")),
          //         Center(child: Text('Millege')),
          //         Center(child: Text('Brand')),
          //         SizedBox(width: 100),
          //       ]),
          //       TableRow(children: [
          //         Container(
          //             alignment: Alignment.center,
          //             decoration: BoxDecoration(
          //               color: appColors.postBackgroundColor,
          //               borderRadius: BorderRadius.circular(10),
          //             ),
          //             child: Text(
          //               "2013",
          //               style:
          //                   TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          //             )),
          //         Container(
          //             margin: EdgeInsets.symmetric(horizontal: 10),
          //             alignment: Alignment.center,
          //             decoration: BoxDecoration(
          //               color: appColors.postBackgroundColor,
          //               borderRadius: BorderRadius.circular(10),
          //             ),
          //             child: Text(
          //               "Honda",
          //               style:
          //                   TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          //             )),

          SizedBox(height: 10),
          Divider(thickness: 2),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              'Special Mentions',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: appColors.greyTextColor,
              ),
            ),
          ),
          SizedBox(height: 6),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Wrap(children: <Widget>[
              Wrap(direction: Axis.horizontal, children: [
                for (int i = 0; i < PostGlobalData.specailMentions.length; i++)
                  Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: appColors.postBackgroundColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        PostGlobalData.specailMentions[i],
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ))
              ]
                  // PostGlobalData.specailMentions
                  //     .map((i) => Text(PostGlobalData
                  //         .specailMentions[int.parse(i)]
                  //         .toString()))
                  //     .toList(),
                  )
              // Container(
              //   height: 136,
              //   child: ListView.builder(
              //       shrinkWrap: true,
              //       itemCount: PostGlobalData.specailMentions.length,
              //       itemBuilder: (context, index) {
              // return specialContainer(
              //     PostGlobalData.specailMentions[index], 131, context);
              //       }),
              // )
            ]),
          ),
          SizedBox(height: 5),
          Divider(thickness: 2),
          Row(
            children: [
              SizedBox(width: 20),
              Text(
                '₹ ${PostGlobalData.price}',
                style: TextStyle(
                    fontSize: 20,
                    color: appColors.greyTextColor,
                    fontWeight: FontWeight.w600),
              ),
              Spacer(),
              Text(
                'Posted on',
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
              SizedBox(width: 7),
              Text(
                DateFormat('yyyy-MM-dd').format(_date),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: appColors.standartBlueColor,
                ),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          SizedBox(height: 7),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              PostGlobalData.imageTitle,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
          ),
          SizedBox(height: 5),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              PostGlobalData.description,
              style: TextStyle(color: appColors.greyTextColor),
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              'Ad set location ',
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(height: 15),
          Container(
            decoration: BoxDecoration(
                color: appColors.darkBlue,
                // border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(20)),
            width: double.infinity,
            height: 250,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
              children: [
                GoogleMap(
                  myLocationButtonEnabled: false,
                  scrollGesturesEnabled: false,
                  markers: {_myLocationmarker},
                  myLocationEnabled: true,
                  mapType: MapType.normal,
                  initialCameraPosition: _kGooglePlex,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 15.0, bottom: 15.0),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MapSearch()),
                        );
                      },
                      icon: Icon(
                        Icons.integration_instructions_outlined,
                        size: 40,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              'Ad post location',
              style: TextStyle(fontSize: 18),
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
                                      postFinishPremiumLocaion.removeAt(index);
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
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: GoogleMap(
                                initialCameraPosition: CameraPosition(
                                    target: LatLng(
                                      latitudeList[index],
                                      LongitudeList[index],
                                    ),
                                    zoom: 12),
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
              : SizedBox(height: 20),
          InkWell(
            onTap: postData,
            child: Container(
                height: 50,
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: appColors.darkBlue,
                ),
                child: Text(
                  'Post',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                )),
          ),
          SizedBox(height: 50)
        ]),
      ),
    );
  }

  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  postData() async {
    try {
      var response = await http.post(
          Uri.parse(
            "https://deep-nucleus1.azurewebsites.net/api/createAd",
          ),
          body: jsonEncode({
            "category": PostGlobalData.category,
            "sub_category": PostGlobalData.subcategory,
            // "field": [
            //   {"lat": 50.3293714, "lng": 3.9389939}
            // ],
            "price": PostGlobalData.price,
            // "image_url": PostGlobalData.image,
            "description": PostGlobalData.description,
            "special_mention": PostGlobalData.specailMentions,
            "title": PostGlobalData.imageTitle,
            "ad_present_location": PostGlobalData.locationArray,
            // "ad_posted_location": [
            //   {"lat": 50.3293714, "lng": 3.9389939, "is_premium": "true"},
            //   {"lat": 50.3293284, "lng": 6.9389634}
            // ],
            // "reported_ad_count": 12,
            // "reported_by": {
            //   "user_id": "123456",
            //   "reason": "dummy reason",
            //   "report_date": "2020-07-10 15:00:00.000"
            // },
            // "ad_expire_date": "2020-07-10 15:00:00.000",
            // "ad_promoted": "yes",
            "ad_promoted_date": PostGlobalData.date,
            // "ad_promoted_expire_date": "2020-07-10 15:00:00.000",
            "is_negotiable": PostGlobalData.priceNegotiable.toString(),
            // "is_ad_posted": PostGlobalData.date.toString(),
            // "loc": {
            //   "type": "Point",
            //   "coordinates": [79.419182, 13.628756]
            // }
          }),
          headers: requestHeaders);
      print(response.body);
    } catch (e) {
      print(e);
      print('Grover is hungry');
    }
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(17.441536, 78.382435),
    zoom: 14.4746,
  );
  static final Marker _myLocationmarker = Marker(
    markerId: MarkerId('_myLocaton'),
    infoWindow: InfoWindow(title: 'Rend a Desk'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(17.441536, 78.382435),
  );
}

Widget specialContainer(String tx) {
  return Container(
    padding: EdgeInsets.all(10),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: appColors.postBackgroundColor,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Text(
      tx,
      style: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
    ),
  );
}




// ListView(scrollDirection: Axis.horizontal, children: [
//               SizedBox(width: 10),
//               InkWell(
//                 onTap: () {
//                   setState(() {
//                     im = 'assets/image1.png';
//                   });
//                 },
//                 child: globla_images != null
//                     ? Container(
//                         width: 55,
//                         height: 50,
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             image: AssetImage(im),
//                             fit: BoxFit.cover,
//                           ),
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                       )
//                     : SizedBox(),
//               ),
//               SizedBox(width: 5),
//               InkWell(
//                 onTap: () {
//                   setState(() {
//                     im = 'assets/image2.png';
//                   });
//                 },
//                 child: Container(
//                   width: 55,
//                   height: 50,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                         image: AssetImage('assets/image2.png'),
//                         fit: BoxFit.cover),
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                 ),
//               ),
//               SizedBox(width: 5),
//               InkWell(
//                 onTap: () {
//                   setState(() {
//                     im = 'assets/image1.png';
//                   });
//                 },
//                 child: Container(
//                   width: 55,
//                   height: 50,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                         image: AssetImage('assets/image1.png'),
//                         fit: BoxFit.cover),
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                 ),
//               ),
//               SizedBox(width: 5),
//               InkWell(
//                 onTap: () {
//                   setState(() {
//                     im = 'assets/image2.png';
//                   });
//                 },
//                 child: Container(
//                   width: 55,
//                   height: 50,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                         image: AssetImage('assets/image2.png'),
//                         fit: BoxFit.cover),
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                 ),
//               ),
//               SizedBox(width: 5),
//             ]),