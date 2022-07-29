import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:true_list/color.dart';

import '../../global_variables.dart';

class FullPremiumadList extends StatefulWidget {
  const FullPremiumadList({Key? key}) : super(key: key);

  @override
  State<FullPremiumadList> createState() => _FullPremiumadListState();
}

class _FullPremiumadListState extends State<FullPremiumadList> {
  bool selected = false;
  int? favIndex;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: appColors.darkBlue,
      body: Column(
        children: [
          SizedBox(height: size.height * 0.060),
          Row(
            children: [
              SizedBox(width: 10),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image.asset(
                  'assets/icons/left_arrow.png',
                  height: 24,
                ),
              ),
              Text(
                'Home - Premium Ads ',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              Spacer(),
              Text(
                'Cancel',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              SizedBox(
                width: 19,
              )
            ],
          ),
          Flexible(
              child: Container(
            padding: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25),
                )),
            width: double.infinity,
            child: GridView.builder(
                padding:
                    EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 500),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: (177 / 244),
                  crossAxisCount: 2,
                ),
                shrinkWrap: true,
                itemCount: globalPremiumadData[0]['PremiumAds'].length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 270,
                    width: 184,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(globalPremiumadData[0]
                              ['PremiumAds'][index]['image_url'][0]),
                          fit: BoxFit.fill),
                    ),
                    margin: EdgeInsets.all(5),
                    child: Stack(
                      children: [
                        // Image.asset("assets/images/background.png",fit: BoxFit.fitHeight,height: height * 0.160,width:width * 0.240,),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            padding: EdgeInsets.only(left: 5, right: 5),
                            height: 38.85,
                            // width: width * 0.285,
                            decoration: BoxDecoration(
                                // color: Colors.red,
                                color: Colors.white.withOpacity(0.73),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "sdfdsf",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      String.fromCharCodes(Runes("\u0024")) +
                                          "\$2334",
                                      style: GoogleFonts.poppins(
                                          color: HexColor("#616161"),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Spacer(),
                                    Text(
                                      "3km",
                                      style: GoogleFonts.poppins(
                                          color: HexColor("#616161"),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        GestureDetector(
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: favIndex == index
                                  ? FaIcon(
                                      FontAwesomeIcons.solidHeart,
                                      color: HexColor("#F50D0D"),
                                      size: 20,
                                    )
                                  : FaIcon(
                                      FontAwesomeIcons.heart,
                                      color: HexColor("#F3F3F4"),
                                      size: 20,
                                    ),
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              if (favIndex == index) {
                                favIndex = -1;
                              } else {
                                favIndex = index;
                              }
                            });
                          },
                        )
                      ],
                    ),
                  );
                  ;
                }),
          )),
        ],
      ),
    );
  }
}
