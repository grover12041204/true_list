import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Models/Constants.dart';
class SaveHeading extends StatelessWidget {
  const SaveHeading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
   // margin: EdgeInsets.only(top: 10),
      decoration: accountScreenboxDecoration,
      height: 8.h,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("Saves" , style: accountScreenHeadingTextStyle),),
           
        ],
      ),
    );
  }
}
