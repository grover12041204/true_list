import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:true_list/sujith/Accounts/Screens/Saved_alerts.dart';

import '../../Models/Constants.dart';

class SavesBelow extends StatelessWidget {
  const SavesBelow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 15.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white),
        //borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //SizedBox(height: 20,),
          GestureDetector(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Saved Drafts", style: accountScreenTextStyle),
                  accountScreenIcons(accountScreenIconsList[2]),
                ],
              ),
            ),
          ),
          DividerLine(),

          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => savedAlerts()));
            },
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Saved Alerts", style: accountScreenTextStyle),
                  accountScreenIcons(accountScreenIconsList[3])
                ],
              ),
            ),
          ),
          DividerLine(),
        ],
      ),
    );
  }
}
