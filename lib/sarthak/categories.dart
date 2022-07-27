import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:true_list/sarthak/cards/categories_gridview.dart';
import 'package:true_list/sarthak/cards/subcategory_card.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> imageNames = List.generate(17, (index) {
    if (index % 3 == 0) {
      return 'background';
    } else if (index % 3 == 1) {
      return 'ad';
    } else {
      return 'grafiti';
    }
  });
  List<Map<String, Map<String, List<String>>>> categories_texts = [
    {
      "Pets": {
        "items": ["Food", "Pet Type", "House", "Other"],
        "booleans": ["true", "false", "false", "false"]
      }
    },
    {
      "Vehicles": {
        "items": [
          "Cars",
          "Bikes",
          "Electric Cars",
          "Electric Bikes",
          "Cycle",
          "Autos",
          "Van",
          "Lorries",
          "Tractors",
          "Buses",
          "Other"
        ],
        "booleans": [
          "true",
          "false",
          "false",
          "false",
          "false",
          "false",
          "false",
          "false",
          "false",
          "false",
          "false",
        ]
      }
    },
    {
      "Properties": {
        "items": [
          "Plot/Land",
          "Flat",
          "House/Villa",
          "Agriculture",
          "Commercial"
        ],
        "booleans": ["true", "false", "false", "false", "false"]
      }
    },
    {
      "Electronics": {
        "items": [
          "Mobiles",
          "Laptops",
          "TV's",
          "Desktops",
          "Cameras",
          "Drones",
          "Go Pro",
          "Watches",
          "Accessories",
          "Other"
        ],
        "booleans": [
          "true",
          "false",
          "false",
          "false",
          "false",
          "false",
          "false",
          "false",
          "false",
          "false"
        ]
      }
    },
    {
      "Home Appliances": {
        "items": [
          "Fridge",
          "Microwave",
          "Washing Machine",
          "Air Conditioners",
          "Geysers",
          "Fans",
          "Inverters",
          "Batteries",
          "Other"
        ],
        "booleans": [
          "true",
          "false",
          "false",
          "false",
          "false",
          "false",
          "false",
          "false",
          "false"
        ]
      }
    },
    {
      "Kitchen Appliances": {
        "items": [
          "Water Purifier",
          "Dish Washer",
          "Mixer",
          "Grinder",
          "Juicer",
          "Electric Cooker",
          "General Cooker",
          "Coffee Maker",
          "Other"
        ],
        "booleans": [
          "true",
          "false",
          "false",
          "false",
          "false",
          "false",
          "false",
          "false",
          "false"
        ]
      }
    },
    {
      "Fashion": {
        "items": [
          "Watches",
          "Jackets",
          "Shoes",
          "Dresses",
          "Jewellery",
          "Bags",
          "Bag Packs",
          "Belts",
          "Sunglasses",
          "Wallets",
          "Hats",
          "Other"
        ],
        "booleans": [
          "true",
          "false",
          "false",
          "false",
          "false",
          "false",
          "false",
          "false",
          "false",
          "false",
          "false",
          "false"
        ]
      }
    },
    {
      "Sports": {
        "items": [
          "Outdoor",
          "Fitness",
          "Team",
          "Water",
          "Target",
          "Rollers",
          "Other"
        ],
        "booleans": [
          "true",
          "false",
          "false",
          "false",
          "false",
          "false",
          "false"
        ]
      }
    },
    {
      "Furniture": {
        "items": [
          "Sofa",
          "Beds",
          "Mattress",
          "Chairs",
          "Office Tables",
          "Dining Tables",
          "Cupboards",
          "Other"
        ],
        "booleans": [
          "true",
          "false",
          "false",
          "false",
          "false",
          "false",
          "false",
          "false"
        ]
      }
    },
    {
      "Arts and Antiques": {
        "items": [
          "Sketching",
          "Stencils",
          "Oil Painting",
          "Water Painting",
          "Antiques",
          "Coins",
          "Stamps",
          "Other"
        ],
        "booleans": [
          "true",
          "false",
          "false",
          "false",
          "false",
          "false",
          "false",
          "false"
        ]
      }
    },
    {
      "Books, Papers and Posters": {
        "items": [
          "Academic",
          "Children",
          "Novels",
          "Old Papers",
          "Old Comics",
          "Posters"
        ],
        "booleans": ["true", "false", "false", "false", "false", "false"]
      }
    },
    {
      "Musical Instruments": {
        "items": [
          "Guitar",
          "Keyboard",
          "Drums",
          "Piano",
          "Flute",
          "Trumpet",
          "Violin",
          "Sitar",
          "Bongo",
          "Saxophone",
          "harmonica",
          "Accordion",
          "Bugle",
          "Clarinet",
          "Tabla",
          "Shenai",
          "Mridangam",
          "Other"
        ],
        "booleans": [
          "true",
          "false",
          "false",
          "false",
          "false",
          "false",
          "false",
          "false",
          "false",
          "false",
          "false",
          "false",
          "false",
          "false",
          "false",
          "false",
          "false",
          "false",
        ]
      }
    },
    {
      "Machines": {
        "items": [
          "Medical",
          "Agricultural",
          "Industrial",
          "Electrical",
          "Mechanical",
          "Construction",
          "Other"
        ],
        "booleans": [
          "true",
          "false",
          "false",
          "false",
          "false",
          "false",
          "false"
        ]
      }
    },
    {
      "Services": {
        "items": [
          "Coaching",
          "Technical Services",
          "Electrical Services",
          "Software",
          "Other"
        ],
        "booleans": ["true", "false", "false", "false", "false"]
      }
    },
    {
      "Business for Sale & Investment": {
        "items": ["Sale", "Pre launch Investments", "Partnership"],
        "booleans": ["true", "false", "false"]
      }
    },
    {
      "Memberships & Tickets": {
        "items": ["Event Tickets", "Tickets", "Memberships"],
        "booleans": ["true", "false", "false"]
      }
    },
    {
      "Jobs": {
        "items": [
          "Teacher",
          "Software",
          "Accountant",
          "Designer",
          "Sales & Marketing",
          "Office Assistant",
          "Driver",
          "Cook",
          "Security Guards",
          "Other"
        ],
        "booleans": [
          "true",
          "false",
          "false",
          "false",
          "false",
          "false",
          "false",
          "false",
          "false",
          "false"
        ]
      }
    }
  ]; // for categories
  List<bool> selected = List.generate(17, (index) => false); // for categories
  List<String> subcategories = [
    "Pencil Paintings",
    "Oil Paintings",
    "Raw",
    "Sketching",
    "Modern"
  ];
  List<bool> selected_or_not =
      List.generate(5, (index) => (index == 0) ? true : false, growable: true);
  int subcatgeory_index = 0;
  int extraHeight = 20;
  int extraWidth = 20;
  int category_index = 0;
  List<Widget> grids = List.empty(growable: true);
  int rows = 1;
  late int grids_count;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    grids_count = categories_texts.length;
    rows = (grids_count / 3).toInt();

    for (var i = 0; i < rows; i++) {
      grids.add(CategoryGridView(
        count: 3,
        row: i,
      ));
    }
    // grids.fillRange(0,rows,CustomGrid(count: 9));
    if (grids_count % 3 != 0) {
      rows += 1;
      grids.add(CategoryGridView(
        count: grids_count % 3,
        row: rows - 1,
      ));
    }
    print(grids_count);
    print(rows);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // var status_bar_height = MediaQuery.of(context).viewPadding.top;

    return Scaffold(
      backgroundColor: HexColor("#1F2A4A"),
      body: Container(
        // height: currentHeight,
        width: width,
        constraints: BoxConstraints(
          maxHeight: double.infinity,
          // minHeight: height
        ),
        child: ListView(
          shrinkWrap: true,

          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          // clipBehavior: Clip.none,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 20,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Categories",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                ],
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Container(
              width: width,
              height: 800, // remove this
              constraints: BoxConstraints(maxHeight: double.infinity),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
              ),
              padding: EdgeInsets.only(left: 5, right: 5, top: 34),
              child: Column(
                children: [
                  Container(
                    height: height * 0.19,
                    width: width,
                    padding: EdgeInsets.only(left: 0),
                    child: CarouselSlider(
                      items: [
                        for (int i = 0; i < categories_texts.length; i++)
                          GestureDetector(
                            child: Container(
                              height: height * 0.170 +
                                  (selected[i] ? extraHeight : 0),
                              width: width * 0.265 +
                                  (selected[i] ? extraWidth : 0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/${imageNames[i]}.png"),
                                    fit: BoxFit.cover),
                              ),
                              // margin: EdgeInsets.all(5),
                              child: Stack(
                                children: [
                                  // Image.asset("assets/images/background.png",fit: BoxFit.fitHeight,height: height * 0.160,width:width * 0.240,),
                                  Container(
                                    height: height * 0.045 +
                                        (selected[i] ? extraHeight : 0),
                                    width: width * 0.285 +
                                        (selected[i] ? extraWidth : 0),
                                    margin: EdgeInsets.only(
                                        top: selected[i]
                                            ? height * 0.125
                                            : height * 0.145,
                                        left: 0),
                                    decoration: BoxDecoration(
                                        color: selected[i]
                                            ? HexColor("#1F2A4A")
                                            : Colors.white.withOpacity(0.73),
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10))),
                                  ),
                                  // Padding(
                                  //   padding: EdgeInsets.only(top: height * 0.095 + (selected[i] ? extraHeight * 2.2 : height * 0.06),left: (categories_texts[i].length > 4) ? width * 0.03 + (selected[i] ? extraWidth * 1.35 : 0) : width * 0.11 + (selected[i] ? extraWidth - 10 : 0)),
                                  //   child: Text(categories_texts[i],style: GoogleFonts.poppins(color: selected[i] ? Colors.white : Colors.black,fontSize: 10,fontWeight: FontWeight.w600),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 1,),
                                  // ),
                                  Container(
                                    height: height * 0.045 +
                                        (selected[i] ? extraHeight : 0),
                                    width: width * 0.285 +
                                        (selected[i] ? extraWidth : 0),
                                    margin: EdgeInsets.only(
                                        top: selected[i]
                                            ? height * 0.125
                                            : height * 0.145,
                                        left: 0),
                                    padding: EdgeInsets.only(
                                        top: selected[i]
                                            ? height * 0.022
                                            : height * 0.010),
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10))),
                                    child: Text(
                                      categories_texts[i].keys.first,
                                      style: GoogleFonts.poppins(
                                          color: selected[i]
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600),
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                category_index = i;
                                for (int i = 0; i < selected.length; i++) {
                                  selected[i] = false;
                                }
                                selected[category_index] = true;
                              });
                            },
                          ),
                      ],
                      options: CarouselOptions(
                        scrollPhysics: BouncingScrollPhysics(),
                        viewportFraction: 0.4,
                        padEnds: false,
                        initialPage: 0,
                        enableInfiniteScroll: false,
                        reverse: false,
                        autoPlay: false,
                        enlargeCenterPage: false,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ),
                  Divider(
                    height: height * 0.08,
                    thickness: 1,
                    color: HexColor("#E1E1E1"),
                    indent: width * 0.05,
                    endIndent: width * 0.05,
                  ),
                  SizedBox(
                    height: height * 0.034,
                  ),
                  Wrap(
                    direction: Axis.horizontal,
                    spacing: 5,
                    runSpacing: 5,
                    children: <Widget>[
                      for (int j = 0;
                          j <
                              categories_texts[category_index][
                                      categories_texts[category_index]
                                          .keys
                                          .first]!
                                  .values
                                  .first
                                  .length;
                          j++)
                        GestureDetector(
                          child: SubcategoryCard(
                              categories_texts[category_index][
                                      categories_texts[category_index]
                                          .keys
                                          .first]!
                                  .values
                                  .first[j],
                              (categories_texts[category_index][
                                              categories_texts[category_index]
                                                  .keys
                                                  .first]!
                                          .values
                                          .last[j]) ==
                                      "true"
                                  ? true
                                  : false),
                          onTap: () {
                            // print(categories_texts[category_index][categories_texts[category_index].keys.first]!.length);
                            // print(categories_texts[category_index][categories_texts[category_index].keys.first]!.keys.first); // items
                            // print(categories_texts[category_index][categories_texts[category_index].keys.first]!.keys.last); // booleans
                            print(categories_texts[category_index][
                                    categories_texts[category_index]
                                        .keys
                                        .first]!
                                .values
                                .first); // items
                            print(categories_texts[category_index][
                                    categories_texts[category_index]
                                        .keys
                                        .first]!
                                .values
                                .last); // booleans

                            setState(() {
                              subcatgeory_index = categories_texts[
                                          category_index][
                                      categories_texts[category_index]
                                          .keys
                                          .first]!
                                  .values
                                  .first
                                  .indexWhere((element) =>
                                      element ==
                                      categories_texts[category_index][
                                              categories_texts[category_index]
                                                  .keys
                                                  .first]!
                                          .values
                                          .first[j]);
                              print("Subcategory Index: $subcatgeory_index");
                              for (int k = 0;
                                  k <
                                      categories_texts[category_index][
                                              categories_texts[category_index]
                                                  .keys
                                                  .first]!
                                          .values
                                          .last
                                          .length;
                                  k++) {
                                if (k == subcatgeory_index)
                                  categories_texts[category_index][
                                          categories_texts[category_index]
                                              .keys
                                              .first]!
                                      .values
                                      .last[k] = "true";
                                else
                                  categories_texts[category_index][
                                          categories_texts[category_index]
                                              .keys
                                              .first]!
                                      .values
                                      .last[k] = "false";
                              }
                              // selected_or_not[subcatgeory_index] = !selected_or_not[subcatgeory_index];
                            });
                          },
                        ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.019,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.7),
                    child: Text(
                      "Done",
                      style: GoogleFonts.poppins(
                          color: HexColor("#0F4BF6"),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              // Divider(height: height * 0.04,thickness: 1,color: HexColor("#E1E1E1"),indent: width * 0.05,endIndent:  width * 0.05,),
              // GridView.builder(
              //   physics: NeverScrollableScrollPhysics(),
              //   padding: EdgeInsets.only(left: 5,right: 5),
              //   shrinkWrap: true,
              //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 3,
              //     ),
              //     itemCount: 20,
              //     itemBuilder: (context,index){
              //       return Container(
              //         width: width * 0.250,
              //         constraints: BoxConstraints(maxHeight: double.infinity),
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(10),
              //           image: DecorationImage(image: AssetImage("assets/images/background.png"),fit: BoxFit.fill),
              //         ),
              //         margin: EdgeInsets.all(5),
              //         child: Stack(
              //           children: [
              //             // Image.asset("assets/images/background.png",fit: BoxFit.fitHeight,height: height * 0.160,width:width * 0.240,),
              //             Container(
              //               height: height * 0.038,
              //               width: width * 0.31,
              //               margin: EdgeInsets.only(top: height * 0.111),
              //               decoration: BoxDecoration(
              //                 color: Colors.white.withOpacity(0.73),
              //                 // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))
              //               ),
              //             ),
              //             Padding(
              //                 padding: EdgeInsets.only(top: height * 0.11),
              //               // padding: EdgeInsets.zero,
              //             child: Center(child: Text("Kitchen Appliances",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 10),textAlign: TextAlign.center,)),)
              //           ],
              //         ),
              //       );
              //     },
              // )
              // child: GridView.builder(
              //             physics: NeverScrollableScrollPhysics(),
              //             padding: EdgeInsets.all(5),
              //             shrinkWrap: true,
              //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //               childAspectRatio: 6/8,
              //               crossAxisSpacing: 5,
              //               mainAxisSpacing: 5,
              //               crossAxisCount: 3,
              //             ),
              //             itemCount: grids_count,
              //             itemBuilder: (context,i){
              //               // for(int i = 0 ; i < categories_texts.length ; i++)
              //               {
              //                 return GestureDetector(
              //                       child: Container(
              //                         height: height * 0.30 + (selected[i] ? extraHeight : 0),
              //                         width: width * 0.255 + (selected[i] ? extraWidth : 0),
              //                         decoration: BoxDecoration(
              //                           borderRadius: BorderRadius.circular(10),
              //                           image: DecorationImage(image: AssetImage("assets/images/${imageNames[i]}.png"),fit: BoxFit.cover),
              //                         ),
              //                         // margin: EdgeInsets.all(5),
              //                         child: Stack(
              //                           children: [
              //                             // Image.asset("assets/images/${imageNames[i]}.png",fit: BoxFit.cover,height: height * 0.14,width: width * 0.4,),
              //                             Container(
              //                               height: height * 0.078 + (selected[i] ? extraHeight : 0),
              //                               width: width * 0.32 + (selected[i] ? extraWidth : 0),
              //                               margin: EdgeInsets.only(top: selected[i] ? height * 0.135 : height * 0.15,left: 0),
              //                               decoration: BoxDecoration(
              //                                 color: selected[i] ? HexColor("#1F2A4A") : Colors.white.withOpacity(0.73),
              //                                 borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
              //                                 // border: selected[i] ? Border.all(color: Colors.white,width: 2) : Border.all(color: Colors.white,width: 0),
              //                               ),
              //                             ),
              //                             // Padding(
              //                             //   padding: EdgeInsets.only(top: height * 0.095 + (selected[i] ? extraHeight * 2.2 : height * 0.06),left: (categories_texts[i].length > 4) ? width * 0.03 + (selected[i] ? extraWidth * 1.35 : 0) : width * 0.11 + (selected[i] ? extraWidth - 10 : 0)),
              //                             //   child: Text(categories_texts[i],style: GoogleFonts.poppins(color: selected[i] ? Colors.white : Colors.black,fontSize: 10,fontWeight: FontWeight.w600),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 1,),
              //                             // ),
              //                             Container(
              //                               height: height * 0.045 + (selected[i] ? extraHeight : 0),
              //                               width: width * 0.285 + (selected[i] ? extraWidth : 0),
              //                               margin: EdgeInsets.only(top: selected[i] ? height * 0.135 : height * 0.155,left: 0),
              //                               padding: EdgeInsets.only(top: selected[i] ? height * 0.022 : height * 0.010),
              //                               decoration: BoxDecoration(
              //                                   color: Colors.transparent,
              //                                   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))
              //                               ),
              //                               child: Text(categories_texts[i].keys.first,style: GoogleFonts.poppins(color: selected[i] ? Colors.white : Colors.black,fontSize: 10,fontWeight: FontWeight.w600),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 2,),
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                       onTap: (){
              //                         setState((){
              //                           category_index = i;
              //                           for(int i = 0 ; i < selected.length ; i++)
              //                           {
              //                             selected[i] = false;
              //                           }
              //                           selected[category_index] = true;
              //                         });
              //                       },
              //                     );
              //                     // Container(height: 10,width: 10,color: Colors.black,),
              //
              //               }
              //             },
              //           ),

              // child: ListView.builder(
              //   physics: NeverScrollableScrollPhysics(),
              //   shrinkWrap: true,
              //   itemCount: 1,
              //   itemBuilder: (context,index){
              //     return Column(
              //       children: [
              //         grids[index],
              //       ],
              //     );
              //   },
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
