import 'dart:convert';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:true_list/Chat/pages/home_page.dart';
import 'package:true_list/global_variables.dart';
import 'package:true_list/sarthak/Home/BottomBarPages/home.dart';
import 'package:true_list/screens/post_screens/post_photo_screen.dart';
import 'package:true_list/sujith/Accounts/Screens/Accounts_page.dart';

import '../../sujith/Accounts/Screens/favourite.dart';
import '../cards/card_landscape.dart';
import '../cards/gridview.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int rows = 1;
  List<String> name = [
    "Posh Villa A for Sale",
    "Posh Villa B for Sale",
    "Posh Villa C for Sale",
    "Posh Villa D for Sale",
    "Posh Villa E for Sale",
    "Posh Villa F for Sale",
  ];
  List<String> price = [
    "250000",
    "300000",
    "350000",
    "400000",
    "450000",
    "500000"
  ];
  List<String> distance = ["3", "5", "7", "9", "11", "13"];
  List<String> image_name = ["car", "building", "grafiti", "laptop", "clothes"];
  List<String> category_name = [
    "Vehicles",
    "Housing",
    "Arts",
    "Electronics",
    "Fashion"
  ];
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
  int current_index = 0;
  List<Widget> carousals = List.generate(
      6,
      (index) => CardLandscape(
          image:
              'https://cdn.pixabay.com/photo/2021/11/19/08/20/strawberries-6808367_960_720.jpg',
          name: "Posh Villa A for Sale",
          price: "250000",
          distance: "3"));
  int grids_count = 50;
  List<Widget> grids = List.empty(growable: true);
  int currenIndexBottomNavBar = 0;
  // List<bool> bottomNavBools = [true,false,false,false,false];
  String current_text = "Hitech City, Hyderabad";
  int category_index = 0;
  List<Widget> screens = [
    Home(),
    favourite(),
    PostPhotoScreen(),
    // Chat(),
    HomePage(),
    accountspage(),
  ];

  @override
  initState() {
    super.initState();
    // globalPremiumadData = _jsonData();
    rows = (grids_count / 9).toInt();
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

  List<Widget> containers = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // var status_bar_height = MediaQuery.of(context).viewPadding.top;

    return Scaffold(
      backgroundColor: HexColor("#1F2A4A"),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currenIndexBottomNavBar = index;
            print(currenIndexBottomNavBar);
            // for(var i = 0 ; i < bottomNavBools.length ; i++)
            // {
            //   if(i == currenIndexBottomNavBar)
            //   {
            //     bottomNavBools[i] = true;
            //   }
            //   else
            //   {
            //     bottomNavBools[i] = false;
            //   }
            // }
          });
        },
        currentIndex: currenIndexBottomNavBar,
        iconSize: 18,
        // unselectedItemColor: HexColor("#838383"),
        selectedItemColor: HexColor("#1F2A4A"),
        backgroundColor: HexColor("#F3F4F8"),
        selectedLabelStyle: GoogleFonts.poppins(
            color: HexColor("#1F2A4A"),
            fontSize: 12,
            fontWeight: FontWeight.w500),
        unselectedLabelStyle: GoogleFonts.poppins(
            color: HexColor("#838383"),
            fontSize: 12,
            fontWeight: FontWeight.w500),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            // icon: bottomNavBools[0] ? ImageIcon(AssetImage("assets/images/home.png"),color: HexColor("#1F2A4A"),) : ImageIcon(AssetImage("assets/images/home_inactive.png"),) ,
            icon: currenIndexBottomNavBar == 0
                ? Column(
                    children: [
                      Container(
                        height: 4,
                        width: 66,
                        margin: EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: HexColor("#1F2A4A")),
                      ),
                      ImageIcon(
                        AssetImage("assets/images/home.png"),
                      ),
                    ],
                  )
                : ImageIcon(
                    AssetImage("assets/images/home_inactive.png"),
                  ),
            label: "Home",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            // icon: bottomNavBools[1] ? ImageIcon(AssetImage("assets/images/favourite.png"),color: HexColor("#1F2A4A"),) : ImageIcon(AssetImage("assets/images/favourite_inactive.png"),) ,
            icon: currenIndexBottomNavBar == 1
                ? Column(
                    children: [
                      Container(
                        height: 4,
                        width: 66,
                        margin: EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: HexColor("#1F2A4A")),
                      ),
                      ImageIcon(
                        AssetImage("assets/images/favourite.png"),
                      ),
                    ],
                  )
                : ImageIcon(
                    AssetImage("assets/images/favourite_inactive.png"),
                  ),
            label: "Favourites",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            // icon: bottomNavBools[2] ? ImageIcon(AssetImage("assets/images/post.png"),color: HexColor("#1F2A4A"),) : ImageIcon(AssetImage("assets/images/post_inactive.png"),) ,
            icon: currenIndexBottomNavBar == 2
                ? Column(
                    children: [
                      Container(
                        height: 4,
                        width: 66,
                        margin: EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: HexColor("#1F2A4A")),
                      ),
                      ImageIcon(
                        AssetImage("assets/images/post.png"),
                      ),
                    ],
                  )
                : ImageIcon(
                    AssetImage("assets/images/post_inactive.png"),
                  ),
            label: "Post",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            // icon: bottomNavBools[3] ? ImageIcon(AssetImage("assets/images/inbox.png"),color: HexColor("#1F2A4A"),) : ImageIcon(AssetImage("assets/images/inbox_inactive.png"),) ,
            icon: currenIndexBottomNavBar == 3
                ? Column(
                    children: [
                      Container(
                        height: 4,
                        width: 66,
                        margin: EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: HexColor("#1F2A4A")),
                      ),
                      ImageIcon(
                        AssetImage("assets/images/inbox.png"),
                      ),
                    ],
                  )
                : ImageIcon(
                    AssetImage("assets/images/inbox_inactive.png"),
                  ),
            label: "Inbox",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            // icon: bottomNavBools[4] ? ImageIcon(AssetImage("assets/images/account.png"),color: HexColor("#1F2A4A"),) : ImageIcon(AssetImage("assets/images/account_inactive.png"),) ,
            icon: currenIndexBottomNavBar == 4
                ? Column(
                    children: [
                      Container(
                        height: 4,
                        width: 66,
                        margin: EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: HexColor("#1F2A4A")),
                      ),
                      ImageIcon(
                        AssetImage("assets/images/account.png"),
                      ),
                    ],
                  )
                : ImageIcon(
                    AssetImage("assets/images/account_inactive.png"),
                  ),
            label: "Account",
            backgroundColor: Colors.black,
          ),
        ],
      ),
      // body: SafeArea(
      //   child: Container(
      //     // height: currentHeight,
      //     width: width,
      //     constraints: BoxConstraints(
      //         maxHeight: double.infinity,
      //         minHeight: height
      //     ),
      //     child: ListView(
      //       shrinkWrap: true,
      //       // clipBehavior: Clip.none,
      //       // mainAxisAlignment: MainAxisAlignment.start,
      //       children: [
      //         Column(
      //           children: [
      //             Container(
      //               margin: EdgeInsets.only(top: 5,left: 23),
      //               child: Row(
      //                 mainAxisAlignment: MainAxisAlignment.start,
      //                 children: [
      //                   GestureDetector(child: Icon(Icons.location_on,color: Colors.white,size: 18,),onTap: () async{
      //                     var res = await Navigator.pushNamed(context, '/home_search');
      //                     setState(() {
      //                       current_text = res.toString().substring(1,res.toString().length - 1);
      //                     });
      //                   },),
      //                   SizedBox(width: 5,),
      //                   current_text.length > "Hitech City, Hyderabad".length ? Text(current_text.substring(0,"Hitech City, Hyderabad".length) + "....", style: GoogleFonts.poppins(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400)) : (current_text.length <= 2) ? Text("Hitech City, Hyderabad", style: GoogleFonts.poppins(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400)) : Text(current_text, style: GoogleFonts.poppins(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400)),
      //                   SizedBox(width: width * 0.25,),
      //                   Container(
      //                     height: 26,
      //                     width: 26,
      //                     alignment: Alignment.center,
      //                     decoration: BoxDecoration(
      //                         color: HexColor("#1F2A4A"),
      //                         border: Border.all(color: Colors.white,width: 1,style: BorderStyle.solid)
      //                     ),
      //                     child: GestureDetector(child: Icon(Icons.search,color: Colors.white,size: 22),onTap: (){
      //                       setState((){
      //                         // if(gridItems.length % 9 == 0 && gridItems.length >=18)
      //                         //   {
      //                         //     containers.add(Container(
      //                         //       height: 100,
      //                         //       width: double.maxFinite,
      //                         //       color: Colors.white12,
      //                         //       child: Center(child: Text(" Google Ad",style: GoogleFonts.poppins(fontSize: 15),
      //                         //       ),
      //                         //       ),
      //                         //     ));
      //                         //   }
      //                         // gridItems.add(CardPortrait(name: "Posh Villa", price: "345", distance: "65", isPremium: false));
      //                       });
      //                     },),
      //                   ),
      //                   SizedBox(width: 10,),
      //                   Container(
      //                     height: 26,
      //                     width: 26,
      //                     decoration: BoxDecoration(
      //                       color: HexColor("#1F2A4A"),
      //                       border: Border.all(color: Colors.white,width: 1),
      //                     ),
      //                     alignment: Alignment.center,
      //                     child:FaIcon(FontAwesomeIcons.sliders,color: Colors.white,size: 15,),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ],
      //         ),
      //         SizedBox(height: 10,),
      //         Container(
      //           width: double.maxFinite,
      //           // height: height,
      //           decoration: BoxDecoration(
      //             color: Colors.white,
      //             borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
      //           ),
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               Padding(
      //                 padding: const EdgeInsets.only(top: 30.0,left: 23),
      //                 child: Text("Premium Ads",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 20),),
      //               ),
      //               Padding(
      //                 padding: const EdgeInsets.only(left: 340.0),
      //                 child: Row(
      //                   children: [
      //                     Text("Show all",style: GoogleFonts.poppins(color: HexColor("#A9ACB8"),fontSize: 10,fontWeight: FontWeight.w500),),
      //                     Icon(Icons.arrow_forward_ios_outlined,color: HexColor("#A9ACB8"),size: 10,)
      //                   ],
      //                 ),
      //               ),
      //
      //               // Container(
      //               //   height: 120,
      //               //   child: ListView.builder(
      //               //     dragStartBehavior: DragStartBehavior.start,
      //               //     physics: BouncingScrollPhysics(),
      //               //     shrinkWrap: true,
      //               //     itemCount: name.length,
      //               //         scrollDirection: Axis.horizontal,
      //               //         itemBuilder: (context,index){
      //               //       current_index = index;
      //               //         return CardLandscape(name: name[current_index], price: price[current_index], distance: distance[current_index]);
      //               //         },
      //               //   ),
      //               // ),
      //               Container(
      //                 height: 120,
      //                 width: double.maxFinite,
      //                 padding: EdgeInsets.only(left: 17),
      //                 child: CarouselSlider(
      //                   items: carousals,
      //                   options: CarouselOptions(
      //                       scrollPhysics: BouncingScrollPhysics(),
      //                       viewportFraction: 0.5,
      //                       padEnds: false,
      //                       initialPage: 0,
      //                       enableInfiniteScroll: false,
      //                       reverse: false,
      //                       autoPlay: false,
      //                       enlargeCenterPage: false,
      //                       scrollDirection: Axis.horizontal,
      //                       onPageChanged: (index,reason){
      //                         setState((){
      //                           current_index  = index;
      //                         });
      //                       }
      //                   ),
      //
      //                 ),
      //               ),
      //               Padding(
      //                 padding: EdgeInsets.only(left: width * 0.35),
      //                 child: DotsIndicator(
      //                   dotsCount: name.length,
      //                   position: current_index.toDouble(),
      //                   decorator: DotsDecorator(
      //                       color: HexColor("##D9D9D9"),
      //                       activeColor: HexColor("##1F2A4A"),
      //                       size: Size.fromRadius(3),
      //                       activeSize: Size.fromRadius(3),
      //                       spacing: EdgeInsets.all(2)
      //                   ),
      //                 ),
      //               ),
      //               Padding(
      //                 padding: const EdgeInsets.only(top: 30.0,left: 23),
      //                 child: Text("Categories",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 20),),
      //               ),
      //               Padding(
      //                 padding: const EdgeInsets.only(left: 340.0),
      //                 child: Row(
      //                   children: [
      //                     GestureDetector(child: Text("Show all",style: GoogleFonts.poppins(color: HexColor("#A9ACB8"),fontSize: 10,fontWeight: FontWeight.w500),),onTap: (){
      //                       Navigator.pushNamed(context, '/categories');
      //                     },),
      //                     Icon(Icons.arrow_forward_ios_outlined,color: HexColor("#A9ACB8"),size: 10,)
      //                   ],
      //                 ),
      //               ),
      //               SizedBox(
      //                 height: 90,
      //                 width: double.maxFinite,
      //                 child: ListView.builder(
      //                   padding: EdgeInsets.only(left: 18),
      //                   physics: BouncingScrollPhysics(),
      //                   scrollDirection: Axis.horizontal,
      //                   shrinkWrap: false,
      //                   itemCount: 5,
      //                   itemBuilder: (context,index){
      //                     return GestureDetector(child: Categorywidget(image_name: image_name[index], name: category_name[index],height: heights[index],width: widths[index],),onTap: (){
      //                       setState((){
      //                         category_index = index;
      //                         print(category_index);
      //                       });
      //                     },);
      //                   },
      //                 ),
      //               ),
      //               Padding(
      //                 padding: const EdgeInsets.only(top: 30.0,left: 20),
      //                 child: Text("Recent",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 20),),
      //               ),
      //               SizedBox(height: 10,),
      //               ListView.builder(
      //                 physics: NeverScrollableScrollPhysics(),
      //                 shrinkWrap: true,
      //                 itemCount: rows,
      //                 itemBuilder: (context,index){
      //                   return Column(
      //                     children: [
      //                       grids[index],
      //                       containers[index],
      //                     ],
      //                   );
      //                 },
      //               ),
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      body: screens[currenIndexBottomNavBar],
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

  //     // globalPremiumadData = decodeJsom;
  //     print(decodeJsom);
  //     print(decodeJsom[0]['PremiumAds']);
  //     print('data');
  //     return decodeJsom;
  //     // print(globalPremiumadData[0]['PremiumAds'][0]['_id']);
  //   } catch (e) {
  //     print('not working');
  //     print(e);
  //     print('Grover is hungry');
  //     return e;
  //   }
  // }
}
