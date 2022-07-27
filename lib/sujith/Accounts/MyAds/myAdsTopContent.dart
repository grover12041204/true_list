import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:true_list/sujith/Accounts/MyAds/sellingTab.dart';

import '../../Models/Constants.dart';

class myAdsTopContent extends StatelessWidget {
  const myAdsTopContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            color: Colors.white,
            height: 7.h,
            child: Row(
              children: [
                Icon(
                  Icons.camera_alt,
                  color: postDate,
                ),
                SizedBox(
                  width: 3.w,
                ),
                Text(
                  "Post an item",
                  style: TextStyle(
                      color: postDate,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      fontSize: 17),
                ),
              ],
            ),
          ),
          myAdsDivider(),
        ],
      ),
    );
  }
}
