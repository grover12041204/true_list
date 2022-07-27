import 'package:flutter/material.dart';
//import sizer package
import 'package:sizer/sizer.dart';
import 'package:true_list/sujith/Models/Constants.dart';

class premiumActivate extends StatelessWidget {
  const premiumActivate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Activate Premium'),
          backgroundColor: appBackGroundcolor,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: appBackGroundcolor,
            //height: 85.h,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Activate ',
                                style: TextStyle(
                                  fontSize: 4.5.w,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                  height: 4.h,
                                  width: 20.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: appBackGroundcolor,
                                    border: Border.all(
                                        color: appBackGroundcolor, width: 2),
                                  ),
                                  child: Center(
                                      child: Text("Buy More",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                            fontFamily: 'Poppins',
                                          )))),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Category",
                                style: accountScreenTextStyle,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                "Count",
                                style: accountScreenTextStyle,
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                              Text(
                                "Duration",
                                style: accountScreenTextStyle,
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                              Text(
                                "Status",
                                style: accountScreenTextStyle,
                              ),
                            ],
                          ),
                          Divider(
                            color: appBackGroundcolor,
                            thickness: .25.w,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                //mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Housing - Plot"),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Text("data"),
                                ],
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Text("data"),
                              SizedBox(
                                width: 1.w,
                              ),
                              Text("data"),
                              SizedBox(
                                width: 1.w,
                              ),
                              Text("data"),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 20.h,
                    )
                  ],
                ),
              ),
              //  height: 100.h,
            ),
          ),
        ));
  }
}

// Row(
//mainAxisAlignment: MainAxisAlignment.spaceBetween,
//children: [
//Text("data"),
//SizedBox(width: 8.w,),
//Text("data"),
//SizedBox(width: 2.w,),
//Text("data"),
// SizedBox(width: 2.w,),
//Text("data"),
// ],
//)