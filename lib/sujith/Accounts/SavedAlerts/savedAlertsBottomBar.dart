import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:true_list/sujith/Models/Constants.dart';

import '../MyAds/draftsTab.dart';

class savedAlertsBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle myAdsBottomBarTextStyle() => TextStyle(
        color: postDate,
        fontSize: 2.h,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins');

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "Edit",
          style: myAdsBottomBarTextStyle(),
        ),
        myAdsBottomBarDivider(),
        Text(
          "Delete",
          style: myAdsBottomBarTextStyle(),
        ),
      ],
    );
  }
}
