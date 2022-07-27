import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';



const accountScreenHeadingTextStyle = TextStyle(
  color: Colors.black,
  fontFamily: 'Poppins',
  fontSize: 22,
  fontWeight:FontWeight.bold,
  );
var appBackGroundcolor = Color.fromRGBO(31, 42, 74, 1);

var accountScreenboxDecoration = BoxDecoration(color:Colors.white,border: Border.all(color: Colors.white),);



var accountScreenConfirmtextStyle = TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontSize: 13,fontFamily: 'Poppins',);

var accountScreenTextStyle = TextStyle(
  color:Colors.black,
  fontWeight: FontWeight.bold,
  fontFamily: 'Poppins',
  fontSize: 17);


//TextStyle for Display Content in MyAds
var postDate = Color(0XFFA9ACB8);
var productNameStyle = TextStyle(fontFamily: 'Poppins',fontSize: 5.w,fontWeight: FontWeight.bold,color: appBackGroundcolor);
var ViewsStyle = TextStyle(color: postDate , fontSize: 2.h , fontWeight: FontWeight.bold);
var DateTextStyle = TextStyle(fontFamily: 'Poppins',fontSize: 2.h,fontWeight: FontWeight.bold,color: postDate);



//TextFormField 

var bottomSheetTextFieldColor = Color(0xffF5F7FA);

class accountScreenIcons extends StatelessWidget {
 accountScreenIcons(this.icon);
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(icon);
  }

 
}
class DividerLine extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.black,width: MediaQuery.of(context).size.width,height: 1/2.h,);
  }
}
List<IconData> accountScreenIconsList = [
  Icons.settings,
  Icons.link,
  Icons.save,
  Icons.add_alert,
  Icons.help,
];
