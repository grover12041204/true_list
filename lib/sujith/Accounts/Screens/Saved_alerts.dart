import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:true_list/sujith/Accounts/MyAds/sellingTab.dart';
import 'package:true_list/sujith/Accounts/SavedAlerts/bottomSheet.dart';
import 'package:true_list/sujith/Accounts/SavedAlerts/fetchData/fetchData.dart';
import 'package:true_list/sujith/Accounts/SavedAlerts/savedAlertsBottomBar.dart';
import '../../Models/Constants.dart';
import '../MyAds/constrains.dart/bottomBarArchieved.dart';
import 'package:http/http.dart' as http;

class savedAlerts extends StatefulWidget {
  const savedAlerts({Key? key}) : super(key: key);

  @override
  State<savedAlerts> createState() => _savedAlertsState();
}

class _savedAlertsState extends State<savedAlerts> {
  List<String> name = [
    'Saved Alerts',
    'Buy Credits',
    'Premium',
    'Favourite',
    'Help',
    'Logout',
  ];

  List<Alerts> data = [];

  Future getRequest() async {
    const url = 'https://deep-nucleus1.azurewebsites.net/api/getAlert';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      //datafromJson = response.body;
      alertsData list = alertsData.fromJson(jsonDecode(response.body));
      print(list.alerts[0].category);
      setState(() {
        data = list.alerts.toList();
      });
      return list.alerts.toList();
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  void initState() {
    getRequest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Saved Alerts"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
        backgroundColor: appBackGroundcolor,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            height: 10.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: (() {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (BuildContext context) => bottomSheet());
                      }),
                      child: Container(
                          margin: EdgeInsets.only(right: 3.w),
                          padding: EdgeInsets.symmetric(horizontal: 2.w),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: appBackGroundcolor,
                            ),
                            borderRadius: BorderRadius.circular(1.h),
                          ),
                          height: 7.h,
                          child: Row(
                            children: [
                              //Icon(Icons.camera_alt),
                              SizedBox(
                                width: 3.w,
                              ),
                              Text(
                                "Create a new alert",
                                style: accountScreenTextStyle,
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: myAdsDivider(),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                    color: Colors.white,
                    // total container height
                    height: 20.h,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              height: 18.h,
                              color: Colors.white,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 13.h,
                                    color: Colors.lightBlueAccent,
                                    child: Row(
                                      //mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                      children: [
                                        //image
                                        Container(
                                          width: 25.w,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "images/download.jpg"),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        //SizedBox(width: 1.w,),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 1.w),
                                          color: Colors.white,
                                          width: 69.w,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                      child:
                                                          SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Text(
                                                        data[index].category,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 5.w,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black)),
                                                  )),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                      child:
                                                          SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Text("Description",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 2.h,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: postDate)),
                                                  )),
                                                  Icon(Icons.arrow_forward,
                                                      color: postDate),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                      child:
                                                          SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Text("Arts - Modern",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 2.h,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black)),
                                                  )),
                                                  Expanded(
                                                      child:
                                                          SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Text(
                                                        "Created Jan 10",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 2.h,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: postDate)),
                                                  )),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  savedAlertsBottomBar()
                                ],
                              )),
                          myAdsDivider(),
                        ]));
              },
            ),
          ),
        ],
      ),
    );
  }
}




// ListView.builder(
//             shrinkWrap:true,
//            // physics: NeverScrollableScrollPhysics(),
//             itemBuilder: (BuildContext context, int index) { 
//               return  Container(
//             margin:EdgeInsets.symmetric(horizontal: 3.w,vertical: 2.h),
//             color: Colors.white,
//             // total container height
//             height: 20.h,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   height:18.h,
//                   color: Colors.white,
//                   child:Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(
//                         height: 13.h,
//                         color: Colors.lightBlueAccent,
//                         child: Row(
//                           //mainAxisAlignment:MainAxisAlignment.spaceBetween,
//                           children: [
//                             //image
//                            Container(
//                               width: 25.w,
//                               decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                   image: AssetImage("images/download.jpg"),
//                                   fit: BoxFit.fill,
//                                 ),
//                               ),
//                             ),
//                            //SizedBox(width: 1.w,),
//                            Container(
//                             padding:EdgeInsets.symmetric(horizontal: 1.w),
//                             color: Colors.white,
//                             width: 69.w,
//                              child: Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Expanded(child: SingleChildScrollView(
//                                         scrollDirection: Axis.horizontal,
//                                         child:  Text("Name Of THe Txt",style:TextStyle(fontFamily: 'Poppins',fontSize: 2.h,fontWeight: FontWeight.bold,color: appBackGroundcolor)),
//                                       )),
//                                   ],
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Expanded(child: SingleChildScrollView(
//                                         scrollDirection: Axis.horizontal,
//                                         child:  Text("Description",style:TextStyle(fontFamily: 'Poppins',fontSize: 2.h,fontWeight: FontWeight.bold,color: appBackGroundcolor)),
//                                       )),
//                                       Icon(Icons.arrow_forward),
//                                   ],
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Expanded(child: SingleChildScrollView(
//                                         scrollDirection: Axis.horizontal,
//                                         child:  Text("Arts - Modern",style:TextStyle(fontFamily: 'Poppins',fontSize: 2.h,fontWeight: FontWeight.bold,color: appBackGroundcolor)),
//                                       )),
//                                     Expanded(child: SingleChildScrollView(
//                                         scrollDirection: Axis.horizontal,
//                                         child:  Text("Created Jan 10",style:TextStyle(fontFamily: 'Poppins',fontSize: 2.h,fontWeight: FontWeight.bold,color: appBackGroundcolor)),
//                                       )),
//                                   ],
//                                 ),
//                               ],
//                              ),
//                            ) 
//                           ],
//                         ),
//                       ),
//                       myAdsDraftsBottomBar()
//                     ],
//                   )
//                 ),
//                 myAdsDivider(),
//               ],
//             ),
//               );        
//              },      
//       )


//  

//   children: [
          //     Container(
          //   margin:EdgeInsets.symmetric(horizontal: 3.w,vertical: 2.h),
          //   color: Colors.white,
          //   // total container height
          //   height: 20.h,
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Container(
          //         height:18.h,
          //         color: Colors.white,
          //         child:Column(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Container(
          //               height: 13.h,
          //               color: Colors.lightBlueAccent,
          //               child: Row(
          //                 //mainAxisAlignment:MainAxisAlignment.spaceBetween,
          //                 children: [
          //                   //image
          //                  Container(
          //                     width: 25.w,
          //                     decoration: BoxDecoration(
          //                       image: DecorationImage(
          //                         image: AssetImage("images/download.jpg"),
          //                         fit: BoxFit.fill,
          //                       ),
          //                     ),
          //                   ),
          //                  //SizedBox(width: 1.w,),
          //                  Container(
          //                   padding:EdgeInsets.symmetric(horizontal: 1.w),
          //                   color: Colors.white,
          //                   width: 69.w,
          //                    child: Column(
          //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                     children: [
          //                       Row(
          //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                         children: [
          //                           Expanded(child: SingleChildScrollView(
          //                               scrollDirection: Axis.horizontal,
          //                               child:  Text("Name Of THe Txt",style:TextStyle(fontFamily: 'Poppins',fontSize: 2.h,fontWeight: FontWeight.bold,color: appBackGroundcolor)),
          //                             )),
          //                         ],
          //                       ),
          //                       Row(
          //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                         children: [
          //                           Expanded(child: SingleChildScrollView(
          //                               scrollDirection: Axis.horizontal,
          //                               child:  Text("Description",style:TextStyle(fontFamily: 'Poppins',fontSize: 2.h,fontWeight: FontWeight.bold,color: appBackGroundcolor)),
          //                             )),
          //                             Icon(Icons.arrow_forward),
          //                         ],
          //                       ),
          //                       Row(
          //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                         children: [
          //                           Expanded(child: SingleChildScrollView(
          //                               scrollDirection: Axis.horizontal,
          //                               child:  Text("Arts - Modern",style:TextStyle(fontFamily: 'Poppins',fontSize: 2.h,fontWeight: FontWeight.bold,color: appBackGroundcolor)),
          //                             )),
          //                           Expanded(child: SingleChildScrollView(
          //                               scrollDirection: Axis.horizontal,
          //                               child:  Text("Created Jan 10",style:TextStyle(fontFamily: 'Poppins',fontSize: 2.h,fontWeight: FontWeight.bold,color: appBackGroundcolor)),
          //                             )),
          //                         ],
          //                       ),
          //                     ],
          //                    ),
          //                  ) 
          //                 ],
          //               ),
          //             ),
          //             myAdsDraftsBottomBar()
          //           ],
          //         )
          //       ),
          //       myAdsDivider(),
          //     ],
          //   ),
          // )    