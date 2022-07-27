import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class Categorywidget extends StatefulWidget {
  const Categorywidget({Key? key,required this.image_name,required this.name,required this.height,required this.width}) : super(key: key);

  final String image_name;
  final String name;
  final double height;
  final double width;

  @override
  State<Categorywidget> createState() => _CategorywidgetState();
}

class _CategorywidgetState extends State<Categorywidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 80,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: HexColor("#F3F4F8"),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset("assets/images/${widget.image_name}.png",fit: BoxFit.contain,height: widget.height,width: widget.width,),
          SizedBox(height: 5,),
          Text("${widget.name}",style: GoogleFonts.poppins(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w500),)
        ],
      ),
    );
  }
}
