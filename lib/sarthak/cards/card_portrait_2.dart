import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class CardPortrait2 extends StatefulWidget {
  final String name;
  final String imageName;

  const CardPortrait2({Key? key,required this.name, required this.imageName}) : super(key: key);

  @override
  State<CardPortrait2> createState() => _CardPortrait2State();
}

class _CardPortrait2State extends State<CardPortrait2> {

  bool selected = false;

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      child: Container(
        height: height * 0.170,
        width: width * 0.250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(image: AssetImage("assets/images/${widget.imageName}.png"),fit: BoxFit.fill),
        ),
        margin: EdgeInsets.all(5),
        child: Stack(
          children: [
            // Image.asset("assets/images/background.png",fit: BoxFit.fitHeight,height: height * 0.160,width:width * 0.240,),
            Container(
              height: selected ? 50 : 38.85,
              width: width * 0.3,
              margin: EdgeInsets.only(top: selected ? 115 : 125,left: 0),
              decoration: BoxDecoration(
                color: selected ? HexColor("#1F2A4A") : Colors.white.withOpacity(0.73),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: selected ? height * 0.155 : height * 0.160,left: 25),
              child: Text("${widget.name}",style: GoogleFonts.poppins(color: selected ? Colors.white : Colors.black,fontSize: 11,fontWeight: FontWeight.w600),),
            ),
          ],
        ),
      ),
      onTap: (){
        selected = !selected;
        setState((){});
      },
    );
  }
}

