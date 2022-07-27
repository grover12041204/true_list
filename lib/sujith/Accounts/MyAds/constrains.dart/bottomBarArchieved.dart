import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../Models/Constants.dart';
import 'bottomBar.dart';
import 'myAdsBottomBarDivider.dart';

class myAdsArchievedBottomBar extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
   
   TextStyle myAdsBottomBarTextStyle() => TextStyle(color: postDate,fontSize: 2.h,fontWeight: FontWeight.bold,fontFamily: 'Poppins');
    
    return Row(
     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
     children: [
        
        Text("Delete",style: myAdsBottomBarTextStyle(),),
         
         myAdsBottomBarDivider(),
        
        Text("Repost",style: myAdsBottomBarTextStyle(),),
        
        
        
     ], 
    );
  }

}

