import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class CardPortrait extends StatefulWidget {
  final String name;
  final String price;
  final String distance;
  final bool isPremium;
  final bool isAd;
  final String image;

  const CardPortrait(
      {Key? key,
      required this.image,
      required this.name,
      required this.price,
      required this.distance,
      required this.isPremium,
      required this.isAd})
      : super(key: key);

  @override
  State<CardPortrait> createState() => _CardPortraitState();
}

class _CardPortraitState extends State<CardPortrait> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.170,
      width: width * 0.250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
            image: NetworkImage(widget.image), fit: BoxFit.fill),
      ),
      margin: EdgeInsets.all(5),
      child: Stack(
        children: [
          // Image.asset("assets/images/background.png",fit: BoxFit.fitHeight,height: height * 0.160,width:width * 0.240,),
          Container(
            height: 38.85,
            width: width * 0.285,
            margin: EdgeInsets.only(top: 85, left: 0),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.73),
              // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100.0, left: 3, right: 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  String.fromCharCodes(Runes("\u0024")) + "${widget.price}",
                  style: GoogleFonts.poppins(
                      color: HexColor("#616161"),
                      fontSize: 10,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 45,
                ),
                Text(
                  "${widget.distance}km",
                  style: GoogleFonts.poppins(
                      color: HexColor("#616161"),
                      fontSize: 10,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 83.0, left: 1),
            child: Text(
              "${widget.name}",
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 11,
                  fontWeight: FontWeight.w700),
            ),
          ),
          selected
              ? GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 80.0, top: 10),
                    child: FaIcon(
                      FontAwesomeIcons.solidHeart,
                      color: HexColor("#F50D0D"),
                      size: 15,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      selected = !selected;
                    });
                  },
                )
              : GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 80.0, top: 10),
                    child: FaIcon(
                      FontAwesomeIcons.heart,
                      color: HexColor("#F3F3F4"),
                      size: 15,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      selected = !selected;
                    });
                  },
                ),
          widget.isPremium
              ? Container(
                  height: 12,
                  width: 37,
                  margin: EdgeInsets.only(top: 14),
                  padding: EdgeInsets.only(left: 3),
                  decoration: BoxDecoration(
                      color: HexColor("#D2520A"),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5),
                          bottomRight: Radius.circular(5))),
                  child: Text(
                    "Premium",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 7),
                  ),
                )
              : Container(
                  height: 0,
                  width: 0,
                ),
          widget.isAd
              ? Container(
                  height: 12,
                  width: 30,
                  margin: EdgeInsets.only(top: 14),
                  padding: EdgeInsets.only(left: 3),
                  decoration: BoxDecoration(
                      color: HexColor("#474641"),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5),
                          bottomRight: Radius.circular(5))),
                  child: Text(
                    "Ad",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              : Container(
                  height: 0,
                  width: 0,
                )
        ],
      ),
    );
  }
}
