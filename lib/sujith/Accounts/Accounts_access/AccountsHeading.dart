import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Models/Constants.dart';

class AccountsHeading extends StatelessWidget {
  const AccountsHeading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      child: Container(
         decoration: accountScreenboxDecoration,
         height: 8.h,
         width: MediaQuery.of(context).size.width,
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Padding(
               padding: const EdgeInsets.all(10.0),
               child: Text("Account" , style: accountScreenHeadingTextStyle),),
               Container(
                 margin: EdgeInsets.all(5),
                 height: 40,
                 width: 100,
                 
                 decoration: BoxDecoration(
                   color: appBackGroundcolor,
                   borderRadius: BorderRadius.circular(10),
                  
                 ),
                 
                 child: Center(
                   child: Text("English",style: TextStyle(
                     color: Colors.white,
                     fontFamily: 'Poppins',
                     fontSize: 18,
                     fontWeight: FontWeight.bold
                   ),),
                 ),
               )
           ],
         ),
       ),
    );
  }
}
