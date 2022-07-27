import 'package:flutter/material.dart';
import 'package:true_list/color.dart';

Widget loginTextfeild(TextEditingController phone) {
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        alignment: Alignment.center,
        height: 62,
        margin: EdgeInsets.only(
          left: 25,
          right: 23,
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 5),
              child: Text(
                '+ 91',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: VerticalDivider(
                  thickness: 3,
                  width: 18,
                  color: appColors.greyTextColor,
                )),
            Container(
              width: 200,
              height: 50,
              margin: EdgeInsets.only(left: 10),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: phone,
                style: TextStyle(fontSize: 22),
                maxLength: 10,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter your Mobile Number',
                  counterText: '',
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 24),
      Padding(
        padding: EdgeInsets.only(left: 25, right: 30),
        child: Text(
            'Your number is safe with us, we dont use your number  for any unsolicited communication.'),
      ),
    ],
  );
}

Widget otpTextfield(TextEditingController otp, BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
    ),
    width: 44,
    height: 50,
    alignment: Alignment.center,
    child: TextField(
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      keyboardType: TextInputType.number,
      controller: otp,
      autofocus: true,
      textInputAction: TextInputAction.next,
      textAlign: TextAlign.center,
      // controller: phone,
      style: TextStyle(fontSize: 22),
      maxLength: 1,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.black),
          borderRadius: BorderRadius.circular(5),
        ),
        counterText: '',
      ),
    ),
  );
}

Widget postTextfield(TextEditingController text) {
  return Container(
    color: appColors.postBackgroundColor,
    height: 50,
    padding: EdgeInsets.only(left: 14),
    child: TextField(
      controller: text,
      style: TextStyle(fontSize: 22),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Enter the title here..',
        counterText: '',
      ),
    ),
  );
}

Widget postDetailfield(String tx, TextEditingController controller) {
  return Container(
    color: appColors.postBackgroundColor,
    height: 50,
    margin: EdgeInsets.symmetric(horizontal: 20),
    padding: EdgeInsets.only(left: 14),
    child: TextField(
      controller: controller,
      style: TextStyle(fontSize: 22),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: tx,
        counterText: '',
      ),
    ),
  );
}
