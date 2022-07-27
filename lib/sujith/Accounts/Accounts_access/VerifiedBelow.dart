import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:true_list/sujith/Models/Constants.dart';

class VerifiedBelow extends StatelessWidget {
  const VerifiedBelow({
    Key? key,
    required this.isVerified,
    required this.isUpload,
  }) : super(key: key);

  final bool isVerified;
  final bool isUpload;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        height: 15.h,
        // color: Colors.yellow,
        decoration: accountScreenboxDecoration,
        width: MediaQuery.of(context).size.width,

        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          //SizedBox(height: 10,),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Email", style: accountScreenTextStyle),
                isVerified
                    ? Text("Updated", style: accountScreenConfirmtextStyle)
                    : Text("Verify", style: accountScreenConfirmtextStyle),
              ],
            ),
          ),
          DividerLine(),

          Container(
            //margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Govt ID", style: accountScreenTextStyle),
                isUpload
                    ? Text("Uploaded", style: accountScreenConfirmtextStyle)
                    : Text("Upload", style: accountScreenConfirmtextStyle),
              ],
            ),
          ),
          DividerLine(),
        ]),
      ),
    );
  }
}
