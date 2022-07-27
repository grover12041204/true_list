import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:true_list/color.dart';
import 'package:true_list/global_variables.dart';
import 'package:true_list/screens/login_screens/otp_screen.dart';
import 'package:true_list/widgets/textfeild.dart';
import 'package:http/http.dart' as http;

import '../../widgets/showsnackbar.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  TextEditingController phoneController = TextEditingController();
  List scrollImage = [
    'assets/image1.png',
    'assets/Antiques.jpg',
    'assets/Arts.jpg',
    'assets/Books.jpg',
    'assets/Farmland.jpg',
    'assets/Furniture.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
                autoPlay: true, height: 500, viewportFraction: 1),
            items: scrollImage.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      // margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(color: Colors.amber),
                      child: Image.asset(
                        i,
                        fit: BoxFit.cover,
                      ));
                },
              );
            }).toList(),
          ),
          // Container(
          //   child: Image.asset('assets/image1.png'),
          // ),
          Container(
            decoration: BoxDecoration(
              color: appColors.backgroundLoginColor,
              // borderRadius: BorderRadius.only(
              //     topLeft: Radius.circular(20),
              //     topRight: Radius.circular(20)),
            ),
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 28),
                Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Text(
                    'Login With Phone number',
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Text(
                    'We will Send you an OTP on this number',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: appColors.greyLoginText),
                  ),
                ),
                SizedBox(height: 20),
                loginTextfeild(phoneController),
                SizedBox(height: 22),
                InkWell(
                  onTap: () {
                    globalPhoneNumber = phoneController.text;
                    requestOTP(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: appColors.darkBlue),
                    margin: EdgeInsets.only(left: 32, right: 40),
                    child: Text(
                      'Get OTP',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 300),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  requestOTP(BuildContext context) async {
    try {
      print('inside block');
      var response = await http.post(
          Uri.parse(
            "https://deep-nucleus1.azurewebsites.net/getOtp",
          ),
          body: jsonEncode({
            "phoneNumber": {"text": phoneController.text},
          }),
          headers: requestHeaders);
      print('sms is working');
      var decodeJsom = jsonDecode(response.body);
      print(decodeJsom);
      if (decodeJsom["statusCode"] != 200) {
        print(decodeJsom["statusCode"]);
        print('4000');
        showInSnackBarFinal('Invalid Number', context);
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OtpScreen(),
          ),
        );
      }
      print(response.body);
    } catch (e) {
      print('not working');
      print(e);
    }
  }
}
