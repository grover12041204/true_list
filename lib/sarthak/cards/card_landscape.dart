import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class CardLandscape extends StatefulWidget {
  final String name;
  final String price;
  final String distance;
  final String image;
  const CardLandscape(
      {Key? key,
      required this.name,
      required this.price,
      required this.distance,
      required this.image})
      : super(key: key);

  @override
  State<CardLandscape> createState() => _CardLandscapeState();
}

class _CardLandscapeState extends State<CardLandscape> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.1 * 2.5,
      width: width * 0.18 * 2.5,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.white),
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
            image: NetworkImage(widget.image), fit: BoxFit.cover),
      ),
      child: SafeArea(
        child: Stack(
          children: [
            // Image.network(
            //   widget.image,
            //   fit: BoxFit.contain,
            // ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: height * 0.039,
                // margin: EdgeInsets.only(top: height * 0.075),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.73),
                  // borderRadius: BorderRadius.only(
                  //     bottomLeft: Radius.circular(10),
                  //     bottomRight: Radius.circular(10)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.108, left: 6, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    String.fromCharCodes(Runes("\u0024")) + "${widget.price}",
                    style: GoogleFonts.poppins(
                        color: HexColor("#616161"),
                        fontSize: 10,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "${widget.distance}km away",
                    style: GoogleFonts.poppins(
                        color: HexColor("#616161"),
                        fontSize: 10,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.087, left: 1),
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
                      padding: EdgeInsets.only(left: width * 0.36, top: 10),
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
                      padding: EdgeInsets.only(left: width * 0.36, top: 10),
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
                  )
          ],
        ),
      ),
    );
  }
}
