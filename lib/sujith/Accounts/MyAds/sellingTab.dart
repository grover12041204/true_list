import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import 'package:true_list/sujith/Accounts/MyAds/constrains.dart/bottomBar.dart';
import 'package:true_list/sujith/Accounts/MyAds/myAdsTopContent.dart';
import 'package:true_list/sujith/Models/Constants.dart';
import 'constrains.dart/bottomBarDrafts.dart';
//myADsClass import
import 'jsonClasses.dart/myAdsClass.dart';

String datafromJson = '';

class sellingTab extends StatefulWidget {
  const sellingTab({Key? key}) : super(key: key);

  @override
  State<sellingTab> createState() => _sellingTabState();
}

class _sellingTabState extends State<sellingTab> {
  @override
  void initState() {
    getRequest();
    super.initState();
  }

  // Future<List<myAdsJson>> data = [];
  List<myAdsJson> data = [];

  Future<List<myAdsJson>> getRequest() async {
    const url = 'https://deep-nucleus1.azurewebsites.net/api/v1/getMyAds';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      //datafromJson = response.body;
      listmyAds list = listmyAds.fromJson(jsonDecode(response.body));
      setState(() {
        data = list.li.toList();
      });
      print(data[0].status);
      return list.li.toList();
    } else {
      throw Exception('Failed to load post');
    }
  }

//    Future<http.Response> getRequest() async{
//     var url = Uri.parse('https://deep-nucleus1.azurewebsites.net/api/v1/getMyAds');
//     http.Response response = await http.get(url);
//    // print(response.body);
//     listmyAds list = listmyAds.fromJson(jsonDecode(response.body));
//     print(list.message);
//     print('${list.li[0].title}');
//    return response;
// }
  @override
  Widget build(BuildContext context) {
    bool isPremium = true;
    bool isdata1 = true;
    bool isdata2 = true;
    bool isdata3 = true;

    var Premium = "Make Premium";
    var data1 = "Archieve";
    var data2 = "Sold ";
    var data3 = " Delete";

    int saves = 0;
    int viewed = 0;
    final date = DateTime.now();
    var Saved = " $saves Saved";
    var content = "Wrist Watch";
    var views = "$viewed Views";
    var dataOfPosted = "Posted on jan 10";

    //var data1 = selling.fromJson()
    //get the user id from class selling
    //var data = "WrisT Watch";

    return Scaffold(
      body: Column(
        children: [
          myAdsTopContent(),

          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return data[index].status == 'Selling'
                    ? Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 3.w, vertical: 2.h),
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
                                      //color: Colors.lightBlueAccent,
                                      child: Row(
                                        //mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                        children: [
                                          //image
                                          Container(
                                            width: 25.w,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(3.w),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "images/download.jpg"),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          //SizedBox(width: 1.w,),
                                          Container(
                                            padding: EdgeInsets.only(left: 3.w),
                                            color: Colors.white,
                                            width: 69.w,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                        height: 4.h,
                                                        width: 20.w,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color:
                                                              appBackGroundcolor,
                                                          border: Border.all(
                                                              color:
                                                                  appBackGroundcolor,
                                                              width: 1.w),
                                                        ),
                                                        child: Center(
                                                            child: Text(Saved,
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 13,
                                                                  fontFamily:
                                                                      'Poppins',
                                                                )))),
                                                    SizedBox(
                                                      width: 1.w,
                                                    ),
                                                    Text(
                                                      "Posted Jan 10",
                                                      style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 2.h,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: postDate),
                                                    ),
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
                                                      child: Text(
                                                          data[index].status,
                                                          style:
                                                              productNameStyle),
                                                    )),
                                                    Icon(
                                                      Icons.arrow_forward,
                                                      color: postDate,
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "0 Views",
                                                      style: ViewsStyle,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    myAdsBottomBar(
                                        isPremium: isPremium,
                                        isdata1: isdata1,
                                        isdata2: isdata2,
                                        isdata3: isdata3,
                                        Premium: Premium,
                                        data1: data1,
                                        data2: data2,
                                        data3: data3)
                                  ],
                                )),
                            myAdsDivider(),
                          ],
                        ),
                      )
                    : Container();
              },
            ),
          ),

          //  Container(
          //       margin:EdgeInsets.symmetric(horizontal: 3.w,vertical: 2.h),
          //       color: Colors.white,
          //       // total container height
          //       height: 20.h,
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Container(
          //             height:18.h,
          //             color: Colors.white,
          //             child:Column(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Container(
          //                   height: 13.h,
          //                   //color: Colors.lightBlueAccent,
          //                   child: Row(
          //                     //mainAxisAlignment:MainAxisAlignment.spaceBetween,
          //                     children: [
          //                       //image
          //                      Container(
          //                         width: 25.w,
          //                         decoration: BoxDecoration(
          //                           //border radius
          //                           borderRadius: BorderRadius.circular(3.w),
          //                           image: DecorationImage(
          //                             image: AssetImage("images/download.jpg"),
          //                             fit: BoxFit.fill,
          //                           ),
          //                         ),
          //                       ),
          //                      //SizedBox(width: 1.w,),
          //                      Container(
          //                       padding:EdgeInsets.only(left: 3.w),
          //                       color: Colors.white,
          //                       width: 69.w,
          //                        child: Column(
          //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                         children: [
          //                           Row(
          //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                             children: [
          //                               Container(
          //                                   height: 4.h,
          //                                   width:20.w,
          //                                   decoration: BoxDecoration(
          //                                     borderRadius: BorderRadius.circular(10),
          //                                     color: appBackGroundcolor,
          //                                     border: Border.all(color: appBackGroundcolor,width: 1.w),
          //                                   ),child: Center(child: Text(Saved,style:TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 13,fontFamily: 'Poppins',)))),

          //                                 SizedBox(width: 1.w,),
          //                                 Text("Expired Jan 10",style: DateTextStyle,),
          //                             ],
          //                           ),
          //                           Row(
          //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                             children: [
          //                               Expanded(child: SingleChildScrollView(
          //                                   scrollDirection: Axis.horizontal,
          //                                   child:  Text(datafromJson,style:productNameStyle),
          //                                 )),
          //                                 Icon(Icons.arrow_forward,color: postDate,),
          //                             ],
          //                           ),
          //                           Row(
          //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                             children: [
          //                               Text(views,style: ViewsStyle),

          //                             ],
          //                           ),
          //                         ],
          //                        ),
          //                      )
          //                     ],
          //                   ),
          //                 ),
          //                 myAdsBottomBar(isPremium: false, isdata1: isdata1, isdata2: isdata2, isdata3: isdata3, Premium: Premium, data1: data1, data2: data2, data3: data3)
          //               ],
          //             )
          //           ),
          //           myAdsDivider(),
          //         ],
          //       ),
          //     ) ,

          Container(
            margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
            height: 10.h,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

class myAdsDivider extends StatelessWidget {
  const myAdsDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.symmetric(horizontal: 3.w),
      color: Colors.white,
      height: 1,
      child: Container(
        color: postDate,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
