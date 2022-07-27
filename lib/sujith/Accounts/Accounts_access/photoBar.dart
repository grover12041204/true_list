import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:true_list/sujith/Models/Constants.dart';

class PhotoBar extends StatelessWidget {
  const PhotoBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          padding: EdgeInsets.only(top: 2.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(3.h),
              topRight: Radius.circular(3.h),
            ),
            border: Border.all(color: Colors.white),
          ),
          height: 25.h,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 8.h,
                backgroundColor: appBackGroundcolor,
                //backgroundImage: AssetImage('assets/images/profile.jpg'),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text('Change Your Profile', style: accountScreenTextStyle),
            ],
          )),
    );
  }
}
