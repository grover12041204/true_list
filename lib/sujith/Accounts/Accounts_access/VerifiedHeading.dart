import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:true_list/sujith/Models/Constants.dart';

class VerifiedHeading extends StatelessWidget {
  const VerifiedHeading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        //margin: EdgeInsets.only(top: 10),
        //padding: EdgeInsets.only(top: 10),
        decoration: accountScreenboxDecoration,
        height: 8.h,
        width: MediaQuery.of(context).size.width,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("Verified", style: accountScreenHeadingTextStyle),
            )
          ],
        ),
      ),
    );
  }
}
