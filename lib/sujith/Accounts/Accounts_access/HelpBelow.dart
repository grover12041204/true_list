import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:true_list/sujith/Accounts/Screens/Help_screen.dart';

import '../../Models/Constants.dart';

class HelpBelow extends StatelessWidget {
  const HelpBelow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 6.h,
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        //SizedBox(height: 10,),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => helpScreen()));
          },
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Help Center", style: accountScreenTextStyle),
                accountScreenIcons(accountScreenIconsList[4]),
              ],
            ),
          ),
        ),
        DividerLine(),
      ]),
    );
  }
}
