import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:true_list/sarthak/categories.dart';
import 'package:true_list/screens/account_settings/new_home_screen.dart';
import 'package:true_list/sujith/Accounts/buy_credits/category_BottomSheet.dart';

import '../../../global_variables.dart';
import '../../cards/card_landscape.dart';
import '../../cards/category.dart';
import '../../cards/gridview.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String current_text = "Hitech City, Hyderabad";
  // List<Widget> carousals = List.generate(
  //     globalPremiumadData[0]['PremiumAds'].length - 1,
  //     (index) => InkWell(
  //           onTap: () {
  //             int getID = index;
  //           },
  //           child: CardLandscape(
  //             image: globalPremiumadData[0]['PremiumAds'][index]['image_url']
  //                 [0],
  //             name: globalPremiumadData[0]['PremiumAds'][index]['title'],
  //             price: globalPremiumadData[0]['PremiumAds'][index]['price'],
  //             distance: "3",
  //           ),
  //         ));
  int current_index = 0;
  List<String> name = [
    "Posh Villa A for Sale",
    "Posh Villa B for Sale",
    "Posh Villa C for Sale",
    "Posh Villa D for Sale",
    "Posh Villa E for Sale",
    "Posh Villa F for Sale",
  ];
  List<String> image_name = ["car", "building", "grafiti", "laptop", "clothes"];
  List<double> heights = [
    50,
    50,
    50,
    50,
    50,
  ];
  List<double> widths = [
    50,
    60,
    50,
    60,
    50,
  ];
  int category_index = 0;
  List<String> category_name = [
    "Vehicles",
    "Housing",
    "Arts",
    "Electronics",
    "Fashion"
  ];
  List<Widget> grids = List.empty(growable: true);
  List<Widget> containers = List.empty(growable: true);
  int grids_count = 50;
  int rows = 1;

  @override
  initState() {
    super.initState();
    rows = ((globalPremiumadData[0]['PremiumAds'].length +
                globalPremiumadData[0]['RecentAds'].length) /
            9)
        .toInt();
    for (var i = 0; i < rows; i++) {
      grids.add(CustomGrid(count: 9));
      containers.add(Container(
        height: 100,
        width: double.maxFinite,
        color: Colors.white12,
        child: Center(
          child: Text(
            "Google Ad",
            style: GoogleFonts.poppins(fontSize: 15),
          ),
        ),
      ));
    }
    // grids.fillRange(0,rows,CustomGrid(count: 9));
    if (grids_count % 9 != 0) {
      grids.add(CustomGrid(count: grids_count % 9));
      containers.add(Container(
        height: 100,
        width: double.maxFinite,
        color: Colors.white12,
        child: Center(
          child: Text(
            "Google Ad",
            style: GoogleFonts.poppins(fontSize: 15),
          ),
        ),
      ));
      rows += 1;
    }
    // Add listeners to this class
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: HexColor("#1F2A4A"),
      body: SafeArea(
        child: Container(
          // height: currentHeight,
          width: width,
          constraints:
              BoxConstraints(maxHeight: double.infinity, minHeight: height),
          child: ListView(
            shrinkWrap: true,
            // clipBehavior: Clip.none,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 5, left: 23),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          child: Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 18,
                          ),
                          onTap: () async {
                            var res = await Navigator.pushNamed(
                                context, '/home_search');
                            setState(() {
                              current_text = res
                                  .toString()
                                  .substring(1, res.toString().length - 1);
                            });
                          },
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        current_text.length > "Hitech City, Hyderabad".length
                            ? Text(
                                current_text.substring(
                                        0, "Hitech City, Hyderabad".length) +
                                    "....",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400))
                            : (current_text.length <= 2)
                                ? Text("Hitech City, Hyderabad",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400))
                                : Text(current_text,
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400)),
                        SizedBox(
                          width: width * 0.25,
                        ),
                        Container(
                          height: 26,
                          width: 26,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: HexColor("#1F2A4A"),
                              border: Border.all(
                                  color: Colors.white,
                                  width: 1,
                                  style: BorderStyle.solid)),
                          child: GestureDetector(
                            child: Icon(Icons.search,
                                color: Colors.white, size: 22),
                            onTap: () {
                              setState(() {
                                // if(gridItems.length % 9 == 0 && gridItems.length >=18)
                                //   {
                                //     containers.add(Container(
                                //       height: 100,
                                //       width: double.maxFinite,
                                //       color: Colors.white12,
                                //       child: Center(child: Text(" Google Ad",style: GoogleFonts.poppins(fontSize: 15),
                                //       ),
                                //       ),
                                //     ));
                                //   }
                                // gridItems.add(CardPortrait(name: "Posh Villa", price: "345", distance: "65", isPremium: false));
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 26,
                          width: 26,
                          decoration: BoxDecoration(
                            color: HexColor("#1F2A4A"),
                            border: Border.all(color: Colors.white, width: 1),
                          ),
                          alignment: Alignment.center,
                          child: FaIcon(
                            FontAwesomeIcons.sliders,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.maxFinite,
                // height: height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0, left: 23),
                      child: Text(
                        "Premium Ads",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                    ),
                    Row(
                      children: [
                        Spacer(),
                        Text(
                          "Show all",
                          style: GoogleFonts.poppins(
                              color: HexColor("#A9ACB8"),
                              fontSize: 10,
                              fontWeight: FontWeight.w500),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: HexColor("#A9ACB8"),
                          size: 10,
                        ),
                        SizedBox(width: 20),
                      ],
                    ),

                    // Container(
                    //   height: 120,
                    //   child: ListView.builder(
                    //     dragStartBehavior: DragStartBehavior.start,
                    //     physics: BouncingScrollPhysics(),
                    //     shrinkWrap: true,
                    //     itemCount: name.length,
                    //         scrollDirection: Axis.horizontal,
                    //         itemBuilder: (context,index){
                    //       current_index = index;
                    //         return CardLandscape(name: name[current_index], price: price[current_index], distance: distance[current_index]);
                    //         },
                    //   ),
                    // ),
                    Container(
                      height: 120,
                      width: double.maxFinite,
                      padding: EdgeInsets.only(left: 17),
                      child: CarouselSlider(
                        items: List.generate(
                            globalPremiumadData[0]['PremiumAds'].length - 1,
                            (index) => InkWell(
                                  onTap: () {
                                    print(index);
                                    print(globalPremiumadData[0]['PremiumAds']
                                        [index]['_id']);
                                    getHomeScreen(globalPremiumadData[0]
                                        ['PremiumAds'][index]['_id']);
                                  },
                                  child: CardLandscape(
                                    image: globalPremiumadData[0]['PremiumAds']
                                        [index]['image_url'][0],
                                    name: globalPremiumadData[0]['PremiumAds']
                                        [index]['title'],
                                    price: globalPremiumadData[0]['PremiumAds']
                                        [index]['price'],
                                    distance: "3",
                                  ),
                                )),
                        options: CarouselOptions(
                            scrollPhysics: BouncingScrollPhysics(),
                            viewportFraction: 0.5,
                            padEnds: false,
                            initialPage: 0,
                            enableInfiniteScroll: false,
                            reverse: false,
                            autoPlay: false,
                            enlargeCenterPage: false,
                            scrollDirection: Axis.horizontal,
                            onPageChanged: (index, reason) {
                              setState(() {
                                current_index = index;
                              });
                            }),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.35),
                      child: DotsIndicator(
                        dotsCount:
                            globalPremiumadData[0]['PremiumAds'].length - 1,
                        position: current_index.toDouble(),
                        decorator: DotsDecorator(
                            color: HexColor("#D9D9D9"),
                            activeColor: HexColor("#1F2A4A"),
                            size: Size.fromRadius(3),
                            activeSize: Size.fromRadius(3),
                            spacing: EdgeInsets.all(2)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0, left: 23),
                      child: Text(
                        "Categories",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                    ),
                    Row(
                      children: [
                        Spacer(),
                        GestureDetector(
                          child: Text(
                            "Show all",
                            style: GoogleFonts.poppins(
                                color: HexColor("#A9ACB8"),
                                fontSize: 10,
                                fontWeight: FontWeight.w500),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Categories()));
                            // Navigator.pushNamed(context, '/categories');
                          },
                        ),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: HexColor("#A9ACB8"),
                          size: 10,
                        ),
                        SizedBox(width: 20),
                      ],
                    ),
                    SizedBox(
                      height: 90,
                      width: double.maxFinite,
                      child: ListView.builder(
                        padding: EdgeInsets.only(left: 18),
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: false,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            child: Categorywidget(
                              image_name: image_name[index],
                              name: category_name[index],
                              height: heights[index],
                              width: widths[index],
                            ),
                            onTap: () {
                              setState(() {
                                category_index = index;
                                print(category_index);
                              });
                            },
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0, left: 20),
                      child: Text(
                        "Recent",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: rows,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            grids[index],
                            containers[index],
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Map<String, String> requestHeaders = {
  //   // 'Authorization':
  //   //     'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3Bob25lTnVtYmVyIjoiOTQ2MjQ0NTg5MyIsInVzZXJfSUQiOiI2MmRhNDNjYzE4MDkxNDZjMDRkM2UwZTgiLCJpYXQiOjE2NTg0NzY3MjIsImV4cCI6MTY1ODUxOTkyMn0.I48tRW_ka0CWvkKlKxkRZuI-dpiIA_XCvYRRBCWqlqk',
  //   'Content-type': 'application/json',
  //   'Accept': 'application/json',
  // };

  // _jsonData() async {
  //   try {
  //     print('inside block');
  //     var response = await http.post(
  //         Uri.parse(
  //           "https://deep-nucleus1.azurewebsites.net/api/v1/home?lat=17.450877&lng=78.390452&maxDistance=2000",
  //         ),
  //         headers: requestHeaders);
  //     var decodeJsom = jsonDecode(response.body);

  //     globalPremiumadData = decodeJsom;
  //     print(decodeJsom);
  //     print(decodeJsom[0]['PremiumAds']);
  //     print('data');
  //     // return decodeJsom;
  //     print(globalPremiumadData[0]['PremiumAds'][0]['_id']);
  //   } catch (e) {
  //     print('not working');
  //     print(e);
  //     print('Grover is hungry');
  //     // return e;
  //   }
  // }
  Map<String, String> requestHeaders = {
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3Bob25lTnVtYmVyIjoiOTQ2MjQ0NTg5MyIsInVzZXJfSUQiOiI2MmRhNDNjYzE4MDkxNDZjMDRkM2UwZTgiLCJpYXQiOjE2NTg4OTY0MDQsImV4cCI6MTY1ODk4MjgwNH0.zw65synT2RelIhkdJbMU4KdPr1DUg8EFLmQJ5RnbySs',
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  getHomeScreen(String id) async {
    try {
      print('inside block');
      var response = await http.post(
          Uri.parse(
            "https://deep-nucleus1.azurewebsites.net/api/v1/get-particular-ad-details",
          ),
          body: jsonEncode({
            "ad_id": id,
          }),
          headers: requestHeaders);
      var decodeJsom = jsonDecode(response.body);

      globalGetHomeScreen = decodeJsom;
      print(decodeJsom);
      print(decodeJsom['message']);
      print(decodeJsom['AdDetails'][0]['image_url']);
      // print(globalGetHomeScreen['image_url'][0]);
      // print(decodeJsom[0]['PremiumAds']);
      // print('data');
      // // return decodeJsom;
      // print(globalPremiumadData[0]['PremiumAds'][0]['_id']);
      // print(globalPremiumadData[0]);
      // print(globalPremiumadData[0]['RecentAds'][0]['image_url'][0]);
      // print(globalPremiumadData[0]['PremiumAds'][0]['image_url'][0]);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NewHomeScreen(),
        ),
      );
    } catch (e) {
      print('not working');
      print(e);
      print('Grover is hungry');
      // return e;
    }
  }
}
