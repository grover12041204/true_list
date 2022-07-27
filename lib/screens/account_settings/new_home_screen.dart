import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:true_list/color.dart';

import '../../global_variables.dart';

class NewHomeScreen extends StatefulWidget {
  const NewHomeScreen({Key? key}) : super(key: key);

  @override
  State<NewHomeScreen> createState() => _NewHomeScreenState();
}

class _NewHomeScreenState extends State<NewHomeScreen> {
  Completer<GoogleMapController> _controller = Completer();
  int imageIndex = 0;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(
        globalGetHomeScreen['AdDetails'][0]['ad_present_location'][0]['lat'],
        globalGetHomeScreen['AdDetails'][0]['ad_present_location'][0]['lng']),
    zoom: 14.4746,
  );
  static final Marker _myLocationmarker = Marker(
    markerId: MarkerId('_myLocaton'),
    infoWindow: InfoWindow(title: 'my location'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(
        globalGetHomeScreen['AdDetails'][0]['ad_present_location'][0]['lat'],
        globalGetHomeScreen['AdDetails'][0]['ad_present_location'][0]['lng']),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.newHomeScreenBackground,
      body: Container(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              width: double.infinity,
              height: 350,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(globalGetHomeScreen['AdDetails'][0]
                        ['image_url'][imageIndex])),
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
                        ))),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      color: Color.fromRGBO(243, 244, 248, 0.2),
                      height: 66,
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              globalGetHomeScreen['AdDetails'][0]['title'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  '\$${globalGetHomeScreen['AdDetails'][0]['price']}',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                                Spacer(),
                                Text(
                                  '3KM Around you ',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(width: 20),
                              ],
                            )
                          ],
                        ),
                      )),
                ),
              ]),
              // child: Image.asset('assets/image2.png'),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              color: Colors.white,
              height: 104,
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Container(
                    height: 60,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: globalGetHomeScreen['AdDetails'][0]
                              ['image_url']
                          .length,
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
                                    image: NetworkImage(
                                        globalGetHomeScreen['AdDetails'][0]
                                            ['image_url'][index])),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Ad Id: ',
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        globalGetHomeScreen['AdDetails'][0]['_id'],
                        style: TextStyle(
                            fontSize: 10,
                            color: appColors.standartBlueColor,
                            fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      Text(
                        'Posted on: ',
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        globalGetHomeScreen['AdDetails'][0]['ad_promoted_date'],
                        style: TextStyle(
                            fontSize: 10,
                            color: appColors.standartBlueColor,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 19),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                ' Key Information',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.only(left: 10),
              height: 85,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Wrap(
                spacing: 20,
                runSpacing: 6.0,
                children: [
                  Container(
                      // color: Colors.amber,
                      child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Brand  ',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        'S-cross',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      )
                    ],
                  )),
                  Container(
                      // color: Colors.amber,
                      child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Age  ',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        '3 Years',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      )
                    ],
                  )),
                  Container(
                      // color: Colors.amber,
                      child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Location   ',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        'Grover',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      )
                    ],
                  )),
                  Container(
                      // color: Colors.amber,
                      child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Location  ',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        'S-cross',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      )
                    ],
                  )),
                  Container(
                    // color: Colors.amber,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Brand ',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          'S-cross',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 19),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                'Special Mentions',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
              // height: 85,
              constraints:
                  BoxConstraints(minHeight: 60, maxHeight: double.infinity),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Wrap(
                spacing: 5,
                runSpacing: 6.0,
                children: [
                  for (int i = 0;
                      i <
                          globalGetHomeScreen['AdDetails'][0]['special_mention']
                              .length;
                      i++)
                    Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 1,
                              color: Colors.black,
                            )),
                        child: Text(
                          globalGetHomeScreen['AdDetails'][0]['special_mention']
                              [i],
                          // style: TextStyle(
                          //     fontSize: 16,
                          //     fontWeight: FontWeight.w600,
                          //     color: Colors.black),
                        )),
                ],
              ),
            ),
            // SizedBox(height: 19),
            // const Padding(
            //   padding: EdgeInsets.only(left: 10.0),
            //   child: Text(
            //     'Amenities/Near by',
            //     style: TextStyle(
            //       fontWeight: FontWeight.w500,
            //       color: Colors.black,
            //       fontSize: 16,
            //     ),
            //   ),
            // ),
            // Container(
            //   alignment: Alignment.centerLeft,
            //   margin: EdgeInsets.symmetric(horizontal: 10),
            //   padding: EdgeInsets.only(left: 10),
            //   height: 85,
            //   decoration: BoxDecoration(
            //       color: Colors.white, borderRadius: BorderRadius.circular(10)),
            // ),
            SizedBox(height: 19),
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                'Description',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.only(left: 10, right: 10),
              constraints:
                  BoxConstraints(minHeight: 40, maxHeight: double.infinity),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(globalGetHomeScreen['AdDetails'][0]['description']),
            ),
            SizedBox(height: 19),
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                'Details',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.only(left: 10, right: 10),
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListView.builder(
                    itemCount: globalGetHomeScreen['AdDetails'][0]
                            ['special_mention']
                        .length,
                    itemBuilder: (BuildContext context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Category',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: appColors.greyTextColor,
                                  fontSize: 16,
                                ),
                              ),
                              Spacer(),
                              Text(
                                'Pets',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Divider(thickness: 0.8),
                        ],
                      );
                      // Divider(thickness: 0.8);
                    })
                // Column(
                // children: [
                //   SizedBox(height: 15),
                //   Row(
                //     children: [
                //       Text(
                //         'Category',
                //         style: TextStyle(
                //           fontWeight: FontWeight.w500,
                //           color: appColors.greyTextColor,
                //           fontSize: 16,
                //         ),
                //       ),
                //       Spacer(),
                //       Text(
                //         'Pets',
                //         style: TextStyle(
                //           fontWeight: FontWeight.w500,
                //           color: Colors.black,
                //           fontSize: 16,
                //         ),
                //       ),
                //     ],
                //   ),
                //   Divider(thickness: 0.8),
                //   Row(
                //     children: [
                //       Text(
                //         'Category',
                //         style: TextStyle(
                //           fontWeight: FontWeight.w500,
                //           color: appColors.greyTextColor,
                //           fontSize: 16,
                //         ),
                //       ),
                //       Spacer(),
                //       Text(
                //         'Pets',
                //         style: TextStyle(
                //           fontWeight: FontWeight.w500,
                //           color: Colors.black,
                //           fontSize: 16,
                //         ),
                //       ),
                //     ],
                //   ),
                //   Divider(thickness: 0.8),
                //   Row(
                //     children: [
                //       Text(
                //         'Breed',
                //         style: TextStyle(
                //           fontWeight: FontWeight.w500,
                //           color: appColors.greyTextColor,
                //           fontSize: 16,
                //         ),
                //       ),
                //       Spacer(),
                //       Text(
                //         'Dogs',
                //         style: TextStyle(
                //           fontWeight: FontWeight.w500,
                //           color: Colors.black,
                //           fontSize: 16,
                //         ),
                //       ),
                //     ],
                //   ),
                //   Divider(thickness: 0.8),
                //   Row(
                //     children: [
                //         Text(
                //           'Category',
                //           style: TextStyle(
                //             fontWeight: FontWeight.w500,
                //             color: appColors.greyTextColor,
                //             fontSize: 16,
                //           ),
                //         ),
                //         Spacer(),
                //         Text(
                //           'Pets',
                //           style: TextStyle(
                //             fontWeight: FontWeight.w500,
                //             color: Colors.black,
                //             fontSize: 16,
                //           ),
                //         ),
                //       ],
                //     ),
                //     Divider(thickness: 0.8),
                //   ],
                // ),
                ),
            SizedBox(height: 19),
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                'Map',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: appColors.darkBlue,
                // border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              width: double.infinity,
              height: 180,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: GoogleMap(
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
            ),
            SizedBox(height: 19),
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                'From',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            InkWell(
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
            SizedBox(height: 50),
            SizedBox(height: 90)
          ],
        ),
      ),
    );
  }
}




// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:mongo_dart/mongo_dart.dart';
// import 'package:true_list/color.dart';
// import 'package:true_list/global_variables.dart';
// import 'package:true_list/sujith/Accounts/buy_credits/category_BottomSheet.dart';


 
// class NewHomeScreen extends StatelessWidget {
//   NewHomeScreen({Key? key}) : super(key: key);
//   Completer<GoogleMapController> _controller = Completer();

//   static final CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(17.441536, 78.382435),
//     zoom: 14.4746,
//   );
//   static final Marker _myLocationmarker = Marker(
//     markerId: MarkerId('_myLocaton'),
//     infoWindow: InfoWindow(title: 'Rend a Desk'),
//     icon: BitmapDescriptor.defaultMarker,
//     position: LatLng(17.441536, 78.382435),
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: appColors.newHomeScreenBackground,
//       body: Container(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             Container(
//               width: double.infinity,
//               height: 350,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                     fit: BoxFit.cover,
//                     image: NetworkImage(
//                         globalGetHomeScreen['AdDetails'][0]['image_url'][0])),
//               ),

//               child: Stack(children: [
//                 Align(
//                     alignment: Alignment.topLeft,
//                     child: Padding(
//                         padding: const EdgeInsets.only(left: 20, top: 38),
//                         child: IconButton(
//                           icon: Icon(
//                             Icons.arrow_back,
//                             size: 35,
//                             color: Colors.white,
//                           ),
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                         ))),
//                 Align(
//                   alignment: Alignment.bottomCenter,
//                   child: Container(
//                       color: Color.fromRGBO(243, 244, 248, 0.2),
//                       height: 66,
//                       width: double.infinity,
//                       child: Padding(
//                         padding: EdgeInsets.only(left: 10),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Hyndai 250 CC White Car',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white,
//                                 fontSize: 20,
//                               ),
//                             ),
//                             SizedBox(height: 10),
//                             Row(
//                               children: [
//                                 Text(
//                                   '\$25000',
//                                   style: TextStyle(
//                                       fontSize: 16,
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                                 Spacer(),
//                                 Text(
//                                   '3KM Around you ',
//                                   style: TextStyle(
//                                       fontSize: 16,
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                                 SizedBox(width: 20),
//                               ],
//                             )
//                           ],
//                         ),
//                       )),
//                 ),
//               ]),
//               // child: Image.asset('assets/image2.png'),
//             ),
//             Container(
//               padding: EdgeInsets.only(left: 10),
//               color: Colors.white,
//               height: 104,
//               width: double.infinity,
//               child: Column(
//                 children: [
//                   SizedBox(height: 10),
//                   Row(
//                     children: [
//                      Container(
//               // decoration: BoxDecoration(
//               //     color: Colors.amber,
//               //     borderRadius: BorderRadius.only(
//               //       topLeft: Radius.circular(30),
//               //       topRight: Radius.circular(30),
//               //     )),
//               height: 60,
//               child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: globalGetHomeScreen['AdDetails'][0]['image_url'].length,
//                   itemBuilder: (BuildContext context, index) {
//                     return Padding(
//                       padding: EdgeInsets.only(left: 10, right: 5),
//                       child: InkWell(
//                         onTap: () {
//                           setState(() {
//                             imageIndex = index;
//                           });
//                         },
//                         child: Container(
//                           width: 55,
//                           height: 50,
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                                 fit: BoxFit.cover,
//                                 image: NetworkImage(globalGetHomeScreen['AdDetails'][0]['image_url'][0])),
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                         ),
//                       ),
//                     );
//                   })),
//                     ],
//                   ),
//                   SizedBox(height: 15),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Ad Id: ',
//                         style: TextStyle(
//                             fontSize: 10,
//                             color: Colors.black,
//                             fontWeight: FontWeight.w500),
//                       ),
//                       Text(
//                         '20000',
//                         style: TextStyle(
//                             fontSize: 10,
//                             color: appColors.standartBlueColor,
//                             fontWeight: FontWeight.w500),
//                       ),
//                       Spacer(),
//                       Text(
//                         'Posted on: ',
//                         style: TextStyle(
//                             fontSize: 10,
//                             color: Colors.black,
//                             fontWeight: FontWeight.w500),
//                       ),
//                       Text(
//                         '14 March 2022',
//                         style: TextStyle(
//                             fontSize: 10,
//                             color: appColors.standartBlueColor,
//                             fontWeight: FontWeight.w500),
//                       ),
//                       SizedBox(width: 10),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 19),
//             Padding(
//               padding: EdgeInsets.only(left: 10.0),
//               child: Text(
//                 ' Key Information',
//                 style: TextStyle(
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black,
//                   fontSize: 16,
//                 ),
//               ),
//             ),
//             Container(
//               alignment: Alignment.centerLeft,
//               margin: EdgeInsets.symmetric(horizontal: 10),
//               padding: EdgeInsets.only(left: 10),
//               height: 85,
//               decoration: BoxDecoration(
//                   color: Colors.white, borderRadius: BorderRadius.circular(10)),
//               child: Wrap(
//                 spacing: 20,
//                 runSpacing: 6.0,
//                 children: [
//                   Container(
//                       // color: Colors.amber,
//                       child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Text(
//                         'Brand  ',
//                         style: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           color: Colors.black,
//                           fontSize: 10,
//                         ),
//                       ),
//                       Text(
//                         'S-cross',
//                         style: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           color: Colors.black,
//                           fontSize: 14,
//                         ),
//                       )
//                     ],
//                   )),
//                   Container(
//                       // color: Colors.amber,
//                       child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Text(
//                         'Age  ',
//                         style: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           color: Colors.black,
//                           fontSize: 10,
//                         ),
//                       ),
//                       Text(
//                         '3 Years',
//                         style: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           color: Colors.black,
//                           fontSize: 14,
//                         ),
//                       )
//                     ],
//                   )),
//                   Container(
//                       // color: Colors.amber,
//                       child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Text(
//                         'Location   ',
//                         style: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           color: Colors.black,
//                           fontSize: 10,
//                         ),
//                       ),
//                       Text(
//                         'Grover',
//                         style: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           color: Colors.black,
//                           fontSize: 14,
//                         ),
//                       )
//                     ],
//                   )),
//                   Container(
//                       // color: Colors.amber,
//                       child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Text(
//                         'Location  ',
//                         style: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           color: Colors.black,
//                           fontSize: 10,
//                         ),
//                       ),
//                       Text(
//                         'S-cross',
//                         style: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           color: Colors.black,
//                           fontSize: 14,
//                         ),
//                       )
//                     ],
//                   )),
//                   Container(
//                     // color: Colors.amber,
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Text(
//                           'Brand ',
//                           style: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             color: Colors.black,
//                             fontSize: 10,
//                           ),
//                         ),
//                         Text(
//                           'S-cross',
//                           style: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             color: Colors.black,
//                             fontSize: 14,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 19),
//             Padding(
//               padding: EdgeInsets.only(left: 10.0),
//               child: Text(
//                 'Special Mentions',
//                 style: TextStyle(
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black,
//                   fontSize: 16,
//                 ),
//               ),
//             ),
//             Container(
//               alignment: Alignment.centerLeft,
//               margin: EdgeInsets.symmetric(horizontal: 10),
//               padding: EdgeInsets.only(left: 10),
//               height: 85,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Wrap(
//                 spacing: 5,
//                 runSpacing: 6.0,
//                 children: [
//                   Container(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 10,
//                       vertical: 5,
//                     ),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         border: Border.all(
//                           width: 1,
//                           color: Colors.black,
//                         )),
//                     child: Text('Leather Seats'),
//                   ),
//                   Container(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 10,
//                       vertical: 5,
//                     ),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         border: Border.all(
//                           width: 1,
//                           color: Colors.black,
//                         )),
//                     child: Text('Show room services'),
//                   ),
//                   Container(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 10,
//                       vertical: 5,
//                     ),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         border: Border.all(
//                           width: 1,
//                           color: Colors.black,
//                         )),
//                     child: Text('Single owner'),
//                   ),
//                   Container(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 10,
//                       vertical: 5,
//                     ),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         border: Border.all(
//                           width: 1,
//                           color: Colors.black,
//                         )),
//                     child: Text('New Tyres'),
//                   ),
//                   Container(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 10,
//                       vertical: 5,
//                     ),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         border: Border.all(
//                           width: 1,
//                           color: Colors.black,
//                         )),
//                     child: Text('Insurance till 2025'),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 19),
//             const Padding(
//               padding: EdgeInsets.only(left: 10.0),
//               child: Text(
//                 'Amenities/Near by',
//                 style: TextStyle(
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black,
//                   fontSize: 16,
//                 ),
//               ),
//             ),
//             Container(
//               alignment: Alignment.centerLeft,
//               margin: EdgeInsets.symmetric(horizontal: 10),
//               padding: EdgeInsets.only(left: 10),
//               height: 85,
//               decoration: BoxDecoration(
//                   color: Colors.white, borderRadius: BorderRadius.circular(10)),
//             ),
//             SizedBox(height: 19),
//             const Padding(
//               padding: EdgeInsets.only(left: 10.0),
//               child: Text(
//                 'Description',
//                 style: TextStyle(
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black,
//                   fontSize: 16,
//                 ),
//               ),
//             ),
//             Container(
//               alignment: Alignment.centerLeft,
//               margin: EdgeInsets.symmetric(horizontal: 10),
//               padding: EdgeInsets.only(left: 10, right: 10),
//               height: 85,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: const Text(
//                   'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been industry\'s standard dummy text ever since the 1500s.'),
//             ),
//             SizedBox(height: 19),
//             const Padding(
//               padding: EdgeInsets.only(left: 10.0),
//               child: Text(
//                 'Details',
//                 style: TextStyle(
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black,
//                   fontSize: 16,
//                 ),
//               ),
//             ),
//             Container(
//               alignment: Alignment.centerLeft,
//               margin: EdgeInsets.symmetric(horizontal: 10),
//               padding: EdgeInsets.only(left: 10, right: 10),
//               height: 215,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Column(
//                 children: [
//                   SizedBox(height: 15),
//                   Row(
//                     children: [
//                       Text(
//                         'Category',
//                         style: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           color: appColors.greyTextColor,
//                           fontSize: 16,
//                         ),
//                       ),
//                       Spacer(),
//                       Text(
//                         'Pets',
//                         style: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           color: Colors.black,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Divider(thickness: 0.8),
//                   Row(
//                     children: [
//                       Text(
//                         'Category',
//                         style: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           color: appColors.greyTextColor,
//                           fontSize: 16,
//                         ),
//                       ),
//                       Spacer(),
//                       Text(
//                         'Pets',
//                         style: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           color: Colors.black,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Divider(thickness: 0.8),
//                   Row(
//                     children: [
//                       Text(
//                         'Breed',
//                         style: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           color: appColors.greyTextColor,
//                           fontSize: 16,
//                         ),
//                       ),
//                       Spacer(),
//                       Text(
//                         'Dogs',
//                         style: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           color: Colors.black,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Divider(thickness: 0.8),
//                   Row(
//                     children: [
//                       Text(
//                         'Category',
//                         style: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           color: appColors.greyTextColor,
//                           fontSize: 16,
//                         ),
//                       ),
//                       Spacer(),
//                       Text(
//                         'Pets',
//                         style: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           color: Colors.black,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Divider(thickness: 0.8),
//                 ],
//               ),
//             ),
//             SizedBox(height: 19),
//             const Padding(
//               padding: EdgeInsets.only(left: 10.0),
//               child: Text(
//                 'Map',
//                 style: TextStyle(
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black,
//                   fontSize: 16,
//                 ),
//               ),
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 color: appColors.darkBlue,
//                 // border: Border.all(width: 1),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               width: double.infinity,
//               height: 180,
//               margin: EdgeInsets.symmetric(horizontal: 10),
//               child: GoogleMap(
//                 myLocationButtonEnabled: false,
//                 scrollGesturesEnabled: false,
//                 markers: {_myLocationmarker},
//                 myLocationEnabled: true,
//                 mapType: MapType.normal,
//                 initialCameraPosition: _kGooglePlex,
//                 onMapCreated: (GoogleMapController controller) {
//                   _controller.complete(controller);
//                 },
//               ),
//             ),
//             SizedBox(height: 19),
//             const Padding(
//               padding: EdgeInsets.only(left: 10.0),
//               child: Text(
//                 'From',
//                 style: TextStyle(
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black,
//                   fontSize: 16,
//                 ),
//               ),
//             ),
//             SizedBox(height: 90)
//           ],
//         ),
//       ),
//     );
//   }
// }
