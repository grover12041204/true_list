import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../Models/Constants.dart';
import 'myAdsBottomBarDivider.dart';

class myAdsBottomBar extends StatelessWidget{
  myAdsBottomBar({required this.isPremium,required this.isdata1,required this.isdata2,required this.isdata3, required this.Premium,required this.data1,required this.data2,required this.data3,});

  bool isPremium = false;
  bool isdata1 = false;
  bool isdata2 = false;
  bool isdata3 = false;

  var Premium = " ";
  var data1 = " ";
  var data2 = "";
  var data3 = " ";
  @override
  Widget build(BuildContext context) {
   
   TextStyle myAdsBottomBarTextStyle() => TextStyle(color: postDate,fontSize: 2.h,fontWeight: FontWeight.bold,fontFamily: 'Poppins');
    
    return Row(
     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
     children: [
        isPremium ?Text(Premium,style: TextStyle(color: Color(0xFF23842D),fontSize: 2.h,fontWeight: FontWeight.w900,fontFamily: 'Poppins'),) : Container(),
        isPremium && isdata1 ? myAdsBottomBarDivider():Container(),
        
        isdata1?Text(data1,style: myAdsBottomBarTextStyle(),):Container(),
        isdata1 && isdata2 ? myAdsBottomBarDivider():Container(),
        
        isdata2?Text(data2,style: myAdsBottomBarTextStyle(),):Container(),
        isdata2 && isdata3 ? myAdsBottomBarDivider():Container(),
        
        isdata3?Text(data3,style: myAdsBottomBarTextStyle(),):Container(),
        // isdata3?myAdsBottomBarDivider():Container(),
     ], 
    );
  }

}

