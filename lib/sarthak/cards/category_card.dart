import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class CategoryCard extends StatefulWidget {
  final String imageName;
  final String text;
  final bool selected ;
  const CategoryCard({Key? key,required this.imageName,required this.text,required this.selected}) : super(key: key);

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  bool selected = false;
  int extraHeight = 15;
  int extraWidth = 15;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    extraHeight = 10;
    extraWidth = 10;
  }
  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
        height: height * 0.170 + (selected ? extraHeight : 0),
        width: width * 0.265 + (selected ? extraWidth : 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(image: AssetImage("assets/images/${widget.imageName}.png"),fit: BoxFit.cover),
        ),
        margin: EdgeInsets.all(5),
        child: Stack(
          children: [
            // Image.asset("assets/images/background.png",fit: BoxFit.fitHeight,height: height * 0.160,width:width * 0.240,),
            Container(
              height: height * 0.045 + (selected ? extraHeight : 0),
              width: width * 0.285 + (selected ? extraWidth : 0),
              margin: EdgeInsets.only(top: height * 0.125,left: 0),
              decoration: BoxDecoration(
                color: selected ? HexColor("#1F2A4A") : Colors.white.withOpacity(0.73),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.137 + (selected ? extraHeight - 5 : 0),left: (widget.text.length > 4) ? width * 0.07 + (selected ? extraWidth : 0) : width * 0.11 + (selected ? extraWidth - 4.5 : 0)),
              child: Text(widget.text,style: GoogleFonts.poppins(color: selected ? Colors.white : Colors.black,fontSize: 10,fontWeight: FontWeight.w600),textAlign: TextAlign.center),
            ),
          ],
        ),
      );
  }
}
