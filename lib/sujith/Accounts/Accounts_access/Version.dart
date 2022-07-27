import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:true_list/sujith/Models/Constants.dart';

class Version extends StatelessWidget {
  const Version({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 4.h,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("App Version", style: accountScreenConfirmtextStyle),
          Text("v1.0.0", style: accountScreenConfirmtextStyle),
        ],
      ),
    );
  }
}
