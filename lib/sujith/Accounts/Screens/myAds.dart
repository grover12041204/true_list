import 'dart:convert';

//import 'package:depp_nucleus/Accounts/MyAds/constrains.dart/SellingJsonClass.dart';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import 'package:true_list/sujith/Accounts/MyAds/archievedTab.dart';
import 'package:true_list/sujith/Accounts/MyAds/draftsTab.dart';
import 'package:true_list/sujith/Accounts/MyAds/sellingTab.dart';
import 'package:true_list/sujith/Models/Constants.dart';

class myAds extends StatefulWidget {
  const myAds({Key? key}) : super(key: key);

  @override
  State<myAds> createState() => _myAdsState();
}

class _myAdsState extends State<myAds> {
  //var url = Uri.parse('https://www.googleapis.com/books/v1/volumes?q={http}');

// Future<selling> fetchAlbum() async {
//   final response = await http
//       .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

//   if (response.statusCode == 200) {
//     return selling.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to load album');
//   }
// }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Account-My Ads"),
          leading: IconButton(
              onPressed: Navigator.of(context).pop,
              icon: Icon(Icons.arrow_back)),
          backgroundColor: appBackGroundcolor,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: appBackGroundcolor,
                height: 100.h,
                child: ListView(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(3.h),
                          topRight: Radius.circular(3.h),
                        ),
                      ),
                      height: 100.h,
                      child: Column(
                        children: [
                          Container(
                            height: 5.h,
                            child: TabBar(
                              tabs: [
                                Tab(
                                  text: 'Selling',
                                ),
                                Tab(
                                  text: 'Archieved',
                                ),
                                Tab(
                                  text: 'Drafts',
                                ),
                              ],
                              labelColor: appBackGroundcolor,
                              indicatorColor: appBackGroundcolor,
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                sellingTab(),
                                archievedTab(),
                                draftsTab(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
