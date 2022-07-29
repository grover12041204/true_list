import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:true_list/sujith/Accounts/Screens/myAds.dart';
import 'package:true_list/sujith/Models/Constants.dart';

import '../../../screens/account_settings/account_settings_screen.dart';

class AccountsBelow extends StatelessWidget {
  const AccountsBelow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        height: 23.h,
        width: MediaQuery.of(context).size.width,
        decoration: accountScreenboxDecoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AccountSettingScreen(),
                  ),
                );
              },
              child: Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Acounts Settings", style: accountScreenTextStyle),
                    accountScreenIcons(accountScreenIconsList[0])
                  ],
                ),
              ),
            ),
            DividerLine(),
            Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Shared Profile Link", style: accountScreenTextStyle),
                  accountScreenIcons(accountScreenIconsList[1])
                ],
              ),
            ),
            DividerLine(),
            GestureDetector(
              //navigate to myAds.dart
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => myAds()));
              },
              child: Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("My Ads", style: accountScreenTextStyle),
                  ],
                ),
              ),
            ),
            DividerLine(),
          ],
        ),
      ),
    );
  }
}
