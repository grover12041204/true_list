import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:true_list/color.dart';
import 'package:true_list/global_variables.dart';
import 'package:true_list/screens/login_screens/signIn_screen.dart';
import 'package:true_list/screens/login_screens/success_screen.dart';
import 'package:true_list/widgets/showsnackbar.dart';
import 'package:true_list/widgets/textfeild.dart';
import 'package:http/http.dart' as http;

class OtpScreen extends StatelessWidget {
  OtpScreen({Key? key}) : super(key: key);
  TextEditingController otp1 = TextEditingController();
  TextEditingController otp2 = TextEditingController();
  TextEditingController otp3 = TextEditingController();
  TextEditingController otp4 = TextEditingController();
  TextEditingController otp5 = TextEditingController();
  TextEditingController otp6 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.backgroundLoginColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Image.asset('assets/image1.png'),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 31),
                  Padding(
                    padding: EdgeInsets.only(left: 28),
                    child: Text(
                      'OTP has been sent to ' + globalPhoneNumber.toString(),
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(left: 28),
                    child: InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInScreen(),
                        ),
                      ),
                      child: Text(
                        'Change Number',
                        style: TextStyle(
                          color: appColors.standartBlueColor,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 23),
                  Row(
                    children: [
                      SizedBox(width: 24),
                      otpTextfield(otp1, context),
                      SizedBox(width: 16),
                      otpTextfield(otp2, context),
                      SizedBox(width: 16),
                      otpTextfield(otp3, context),
                      SizedBox(width: 16),
                      otpTextfield(otp4, context),
                      SizedBox(width: 16),
                      otpTextfield(otp5, context),
                      SizedBox(width: 16),
                      otpTextfield(otp6, context),
                    ],
                  ),
                  SizedBox(height: 25),
                  InkWell(
                    onTap: () {
                      submitOTP(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: appColors.darkBlue),
                      margin: EdgeInsets.only(left: 30, right: 30),
                      child: Text(
                        'Verify',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  submitOTP(BuildContext context) async {
    try {
      print('inside block');
      var response = await http.post(
          Uri.parse(
            "https://deep-nucleus1.azurewebsites.net/verifyOtp",
          ),
          body: jsonEncode({
            "phoneNumber": {"text": globalPhoneNumber.toString()},
            "otp": otp1.text +
                otp2.text +
                otp3.text +
                otp4.text +
                otp5.text +
                otp6.text,
          }),
          headers: requestHeaders);
      print(
        'sms is working' +
            otp1.text +
            otp2.text +
            otp3.text +
            otp4.text +
            otp5.text +
            otp6.text,
      );
      var decodeJsom = jsonDecode(response.body);
      print(decodeJsom);
      print(decodeJsom["statusCode"]);
      print(decodeJsom['token']);
      userExistingMongo = decodeJsom['existingUser'];
      print(userExistingMongo);
      globalToken = decodeJsom['token'];
      print(globalToken);
      if (decodeJsom["statusCode"] != 200) {
        print(decodeJsom["statusCode"]);
        print('4000');
        showInSnackBarFinal('Invalid OTP', context);
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SuccessScreen(),
          ),
        );
      }

      print(response.body);
    } catch (e) {
      print('not working');
      print(e);
      print('Grover is hungry');
    }
  }
}
