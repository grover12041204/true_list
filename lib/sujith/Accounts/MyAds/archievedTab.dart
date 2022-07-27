import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:true_list/sujith/Accounts/MyAds/constrains.dart/bottomBarArchieved.dart';
import 'package:true_list/sujith/Accounts/MyAds/jsonClasses.dart/myAdsClass.dart';
import 'package:true_list/sujith/Accounts/MyAds/sellingTab.dart';
import '../../Models/Constants.dart';
import 'myAdsTopContent.dart';
import 'package:http/http.dart' as http;

class archievedTab extends StatefulWidget {
  const archievedTab({Key? key}) : super(key: key);

  @override
  State<archievedTab> createState() => _archievedTabState();
}

class _archievedTabState extends State<archievedTab> {
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
  var Saved = " 0 Saved";
  var content = "Wrist Watch";
  var views = "0 Views";
  var dataOfPosted = "Posted on jan 10";

  @override
  void initState() {
    // TODO: implement initState
    getRequest();
    super.initState();
  }

  List<myAdsJson> data = [];
  Future<http.Response> getRequest() async {
    var url =
        Uri.parse('https://deep-nucleus1.azurewebsites.net/api/v1/getMyAds');
    http.Response response = await http.get(url);
    // print(response.body);
    listmyAds list = listmyAds.fromJson(jsonDecode(response.body));
    setState(() {
      data = list.li.toList();
    });
    print('${list.li[0].date}');
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          myAdsTopContent(),
          Expanded(
              child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return data[index].status == 'Archive'
                  ? Container(
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
                                    // color: Colors.lightBlueAccent,
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
                                                  Expanded(
                                                      child: SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          child: Center(
                                                              child: Text(
                                                                  "Posted On jan 1",
                                                                  style:
                                                                      DateTextStyle)))),
                                                  // SizedBox(width: 1.w,),
                                                  // Text("Posted Jan 10",style: TextStyle(fontFamily: 'Poppins',fontSize: 2.h,fontWeight: FontWeight.bold,color: appBackGroundcolor),),
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
                                                  Icon(Icons.arrow_forward,
                                                      color: postDate),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    views,
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
                                  myAdsArchievedBottomBar()
                                ],
                              )),
                          myAdsDivider(),
                        ],
                      ),
                    )
                  : Container();
            },
          ))
        ],
      ),
    );
  }
}
