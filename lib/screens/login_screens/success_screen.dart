import 'dart:async';

import 'package:flutter/material.dart';
import 'package:true_list/color.dart';
import 'package:true_list/screens/login_screens/profile_info.dart';
import 'package:true_list/screens/login_screens/signIn_screen.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => ProfileInfo())));
    return Scaffold(
      backgroundColor: appColors.backgroundLoginColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset('assets/success.png'),
          ),
          SizedBox(height: 5),
          Text(
            'Success!',
            style: TextStyle(
                color: appColors.darkBlue,
                fontSize: 24,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 30),
          const Text(
            'You have successfully registered',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
