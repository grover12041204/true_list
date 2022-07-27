import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:true_list/sujith/Models/Constants.dart';

class CreditsBelow extends StatelessWidget {
  const CreditsBelow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.white),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              height: 7.h,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
              ),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Premium",
                    style: accountScreenTextStyle,
                  ),
                  Text(
                    "10 Available",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: 4.h,
                          width: 18.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border:
                                Border.all(color: appBackGroundcolor, width: 2),
                          ),
                          child: Center(
                              child: Text("Activate",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    fontFamily: 'Poppins',
                                  )))),
                      SizedBox(
                        width: 1.w,
                      ),
                      Container(
                          height: 4.h,
                          width: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: appBackGroundcolor,
                            border:
                                Border.all(color: appBackGroundcolor, width: 2),
                          ),
                          child: Center(
                              child: Text("Buy More",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    fontFamily: 'Poppins',
                                  )))),
                      //divider
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: DividerLine(),
            ),
          ],
        ),
      ),
    );
  }
}
