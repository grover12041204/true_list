import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import 'dart:io' show Platform;

import '../../Models/Constants.dart';

// final AdSize adSize = AdSize(width: 200, height: 700);

class favourite extends StatefulWidget {
  const favourite({Key? key}) : super(key: key);

  @override
  State<favourite> createState() => _favouriteState();
}

// ignore: camel_case_types
class _favouriteState extends State<favourite> {
  int adIndex = 3;

  int getIndex(int index) {
    int i = index ~/ adIndex;
    return index - i;
  }

  AdRequest? adRequest;
  BannerAd? bannerAd;

  bool istrue = false;
  int x = 0;
  int count = 0;
  int adjustedIndex = 0;

  List data = [false, false, true, false, true, false, true];

  List bools = [];

  @override
  void initState() {
    super.initState();
    postData();

    for (int i = 0; i < data.length; i++) {
      bools.add(false);
    }

    // below functions is for ads
    String bannerId = Platform.isAndroid
        ? "ca-app-pub-3940256099942544/6300978111"
        : "ca-app-pub-3940256099942544/2934735716";

    adRequest = const AdRequest(
      nonPersonalizedAds: false,
    );

    BannerAdListener bannerAdListener = BannerAdListener(
      onAdClosed: (ad) {
        bannerAd!.load();
      },
      onAdFailedToLoad: (ad, error) {
        bannerAd!.load();
      },
    );

    bannerAd = BannerAd(
      size: AdSize.largeBanner,
      adUnitId: bannerId,
      listener: bannerAdListener,
      request: adRequest!,
    );

    bannerAd!.load();
  }

  //dispose
  @override
  void dispose() {
    bannerAd?.dispose();
    super.dispose();
  }

  postData() async {
    const url = 'https://deep-nucleus1.azurewebsites.net/api/v1/favouriteAds';
    final response = await http.post(Uri.parse(url));
    var decodeJsom = jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    var favouritetextColor = Color(0xfff616161);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigator.pop(context);
          },
        ),
        title: const Text(
          "Favourite",
        ),
        backgroundColor: appBackGroundcolor,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.filter),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        color: appBackGroundcolor,
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(3.h),
                    topRight: Radius.circular(3.h),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 3.h,
                      ),

                      //topContent
                      Container(
                        height: 10.h,
                        color: Colors.blue,
                        child: Center(
                          child: Text("Top Content"),
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),

                      //below listview
                      Expanded(
                          child: ListView.builder(
                              itemCount: data.length +
                                  (bannerAd != null
                                      ? (data.length ~/ 2 - 1)
                                      : 0),
                              itemBuilder: (BuildContext context, index) {
                                // if and else function
                                //if the index 3 or divisible by 3 then it will return the banner ad
                                //else it will return the listview
                                if (index != 0 && index % adIndex == 0) {
                                  return bannerAd != null
                                      ? getAd()
                                      : Container();
                                } else {
                                  count++;
                                  adjustedIndex = getIndex(index);
                                  return Container(
                                      margin:
                                          EdgeInsets.symmetric(vertical: 3.w),
                                      height: 15.h,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(0.5.h)),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.grey,
                                            offset: Offset(0.0, 1.0), //(x,y)
                                            blurRadius: 6.0,
                                          ),
                                        ],
                                      ),
                                      child: Stack(
                                        children: [
                                          Row(
                                            children: [
                                              //image container
                                              Container(
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height,
                                                width: 28.w,
                                                decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        "images/car.jpg"),
                                                    fit: BoxFit.cover,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(0.5.h),
                                                    bottomLeft:
                                                        Radius.circular(0.5.h),
                                                  ),
                                                ),
                                                //color: Colors.white,
                                              ),
                                              // text contents
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 2.w),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        child: Text(
                                                          "index $index and adjusted index $adjustedIndex",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 3.5.w,
                                                              fontFamily:
                                                                  'poppins'),
                                                        )),
                                                    Container(
                                                        // : MediaQuery.of(context).size.width,
                                                        //color: Colors.blue,
                                                        constraints:
                                                            BoxConstraints(
                                                          maxWidth: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.64,
                                                        ),
                                                        child: Text(
                                                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 3.25.w,
                                                              fontFamily:
                                                                  'poppins',
                                                              color:
                                                                  favouritetextColor),
                                                        )),
                                                    Container(
                                                      //color: Colors.blue,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.64,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "\$250",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 3.w,
                                                                color:
                                                                    favouritetextColor,
                                                                fontFamily:
                                                                    'Poppins'),
                                                          ),
                                                          //Text("250",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 1.5.h),),
                                                          Row(
                                                            children: [
                                                              //heart icon
                                                              IconButton(
                                                                onPressed: () {
                                                                  setState(() {
                                                                    print(
                                                                        "$index index $adjustedIndex clicked");
                                                                    bools[
                                                                        getIndex(
                                                                            index)] = !bools[
                                                                        getIndex(
                                                                            index)];
                                                                  });
                                                                },
                                                                icon: Icon(
                                                                  Icons
                                                                      .favorite,
                                                                  color: bools[
                                                                          getIndex(
                                                                              index)]
                                                                      ? Colors
                                                                          .red
                                                                      : Colors
                                                                          .black,
                                                                ),
                                                                iconSize: 2.h,
                                                              ),
                                                              //SizedBox(width: 0.5.h,),
                                                              // Icon(Icons.,color: Colors.yellow,),
                                                              Text(
                                                                "Saved on 1 Mar",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        3.w,
                                                                    color:
                                                                        favouritetextColor,
                                                                    fontFamily:
                                                                        'Poppins'),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    // Text("1 year",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 1.5.h),),
                                                    // Text("1.5 km",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 1.5.h),),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          // stack posititon
                                          data[adjustedIndex]
                                              ? Positioned.fill(
                                                  child: Container(
                                                  color: Colors.white
                                                      .withOpacity(0.75),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(1.h),
                                                        child: Text("Sold Out",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'poppins',
                                                                color:
                                                                    Colors.red,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 4.w)),
                                                      ),
                                                      IconButton(
                                                        icon: const Icon(
                                                          Icons.close,
                                                          color: Colors.red,
                                                        ),
                                                        onPressed: () {},
                                                      ),
                                                    ],
                                                  ),
                                                ))
                                              : Container(),
                                        ],
                                      ));
                                }
                              }))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget getAd() {
  BannerAdListener bannerAdListener =
      BannerAdListener(onAdWillDismissScreen: (ad) {
    ad.dispose();
  }, onAdClosed: (ad) {
    debugPrint("Ad Got Closeed");
  });
  BannerAd bannerAd = BannerAd(
    size: AdSize.banner,
    adUnitId: Platform.isAndroid
        ? "ca-app-pub-3940256099942544/6300978111"
        : "ca-app-pub-3940256099942544/2934735716",
    listener: bannerAdListener,
    request: const AdRequest(),
  );

  bannerAd.load();

  return SizedBox(
    height: 10.h,
    width: 20.w,
    child: AdWidget(ad: bannerAd),
  );
}
