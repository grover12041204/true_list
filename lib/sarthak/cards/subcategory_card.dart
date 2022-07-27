import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class SubcategoryCard extends StatefulWidget {
  final String text;
  final bool selected;
  const SubcategoryCard(this.text,this.selected);

  @override
  State<SubcategoryCard> createState() => _SubcategoryCardState();
}

class _SubcategoryCardState extends State<SubcategoryCard> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
                border: Border.all(color: HexColor("#1F2A4A"),width: 1,style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(10),
      color: widget.selected ? HexColor("#1F2A4A") : Colors.white,
              ),
      child: Text(widget.text,style: GoogleFonts.poppins(color:widget.selected ? Colors.white : HexColor("#1F2A4A"),fontWeight: FontWeight.w600,fontSize: 16),),
    );
  }
}
