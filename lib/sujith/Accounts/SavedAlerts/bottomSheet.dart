import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
//import http
import 'package:http/http.dart' as http;
import 'package:true_list/sujith/Models/Constants.dart';

class bottomSheet extends StatefulWidget {
  const bottomSheet({Key? key}) : super(key: key);

  @override
  State<bottomSheet> createState() => _bottomSheetState();
}

class _bottomSheetState extends State<bottomSheet> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();

  @override
  void initState() {
    //postData();
    super.initState();
  }

  postDataServer() async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    var response = await http.post(
        Uri.parse(
          "https://deep-nucleus1.azurewebsites.net/api/createAlert",
        ),
        body: jsonEncode({
          "category": "Vehicle",
          "sub_category": "Car",
          "name": "Sujit11",
          "keyword": ["aSDasqwdqwed", "qweqwe2e213"],
          "activate_status": "true"
        }),
        headers: requestHeaders);
    print('working');
    var decodeJsom = jsonDecode(response.body);
    print(decodeJsom);
  }

  // postData() async{
  //   try {
  //     var response = await http.post(Uri.parse("https://deep-nucleus1.azurewebsites.net/api/createAlert"),
  //     body: jsonEncode(<String,dynamic>{
  //           "category":"ELECTRONICS",
  //           "sub_category":"pET",
  //           "name":"Sujit",
  //           "keyword":[
  //             "aSDasd".toString(),
  //             "ASFEWRR".toString()].toList(),
  //           "activate_status":"true"
  //       }));
  //     print(response.body);
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80.h,
        color: Color(0xff757575),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(1.h),
              topRight: Radius.circular(1.h),
            ),
          ),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: ListView(
                  children: [
                    //heading
                    Container(
                      color: Colors.red,
                      height: 7.h,
                      // color: Colors.red,
                      child: Center(
                          child: Text(
                        "Create an alert",
                        style: accountScreenHeadingTextStyle,
                      )),
                    ),

                    //categories
                    Container(
                      height: 25.h,
                      color: Colors.white,
                      //color: Colors.blue.shade100,
                      child: Center(
                          child: Text(
                        'Categories',
                        style: accountScreenHeadingTextStyle,
                      )),
                    ),

                    //Subcategories
                    Container(
                      height: 25.h,
                      color: Colors.blue,
                      //color: Colors.blue.shade200,
                      child: Center(
                          child: Text(
                        'Subcategories',
                        style: accountScreenHeadingTextStyle,
                      )),
                    ),

                    //Text
                    Container(
                      height: 10.h,
                      color: Colors.white,
                      //color: Colors.blue.shade100,
                      child: Center(
                          child: Text(
                        'Please provide precise keywords to create accurate alerts for your choice',
                        style: TextStyle(
                          color: appBackGroundcolor,
                          fontSize: 3.5.w,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      )),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    //Alerts Name
                    Container(
                      height: 4.h,
                      //color: Colors.green,
                      child: Text(
                        'Name the Alert (required)',
                        style: accountScreenTextStyle,
                      ),
                    ),

                    //SizedBox(height: 2.h,),
                    TextFormField(
                      controller: controller1,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: bottomSheetTextFieldColor,
                          border: InputBorder.none,
                          //borderRadius: BorderRadius.circular(10),
                          //labelText: 'Enter Name',
                          //contentPadding: EdgeInsets.symmetric(horizontal: 0,vertical: 7.h),
                          hintText: 'Enter Your Name'),
                    ),
                    //Precise Keyword
                    Container(
                      height: 4.h,
                      //color: Colors.green,
                      //color: Colors.white10,Text('Precise KeyWords (required)',style: accountScreenTextStyle,),
                      child: Text(
                        'Precise KeyWords (required)',
                        style: accountScreenTextStyle,
                      ),
                    ),

                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.w),
                      // width: MediaQuery.of(context).size.width,
                      // height: 30.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        // borderRadius: BorderRadius.circular(10.h),
                        border: Border.all(
                          color: bottomSheetTextFieldColor,
                          width: 1.w,
                        ),
                      ),

                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: bottomSheetTextFieldColor,
                              border: InputBorder.none,
                              //borderRadius: BorderRadius.circular(10),
                              //labelText: 'Enter Name',
                              //contentPadding: EdgeInsets.symmetric(horizontal: 0,vertical: 7.h),
                              //hintText: 'Enter Your Name'
                            ),
                          ),
                          SizeBetween(),
                          TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: bottomSheetTextFieldColor,
                              border: InputBorder.none,
                              //borderRadius: BorderRadius.circular(10),
                              //labelText: 'Enter Name',
                              //contentPadding: EdgeInsets.symmetric(horizontal: 0,vertical: 7.h),
                              //hintText: 'Enter Your Name'
                            ),
                          ),
                          SizeBetween(),
                          TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: bottomSheetTextFieldColor,
                              border: InputBorder.none,
                              //borderRadius: BorderRadius.circular(10),
                              //labelText: 'Enter Name',
                              //contentPadding: EdgeInsets.symmetric(horizontal: 0,vertical: 7.h),
                              //hintText: 'Enter Your Name'
                            ),
                          ),
                          SizeBetween(),
                          TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: bottomSheetTextFieldColor,
                              border: InputBorder.none,
                              //borderRadius: BorderRadius.circular(10),
                              //labelText: 'Enter Name',
                              //contentPadding: EdgeInsets.symmetric(horizontal: 0,vertical: 7.h),
                              //hintText: 'Enter Your Name'
                            ),
                          ),
                          SizeBetween(),
                          TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: bottomSheetTextFieldColor,
                              border: InputBorder.none,
                              //borderRadius: BorderRadius.circular(10),
                              //labelText: 'Enter Name',
                              //contentPadding: EdgeInsets.symmetric(horizontal: 0,vertical: 7.h),
                              //hintText: 'Enter Your Name'
                            ),
                          ),
                        ],
                      ),
                    ),

                    //TextFeild 1
                    //Example Keyword
                    Container(
                      height: 4.h,
                      //color: Colors.blue,
                      //color: Colors.blue.shade200,
                      child: Center(
                          child: Text(
                        'For example: Ravi varma, Picasso, Italian etc.',
                        style: TextStyle(
                          color: postDate,
                          fontSize: 3.5.w,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      )),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Under ' + 'Arts' + ' - ' + 'Modern',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),

                    //safty Container
                    Container(
                      height: 5.h,
                    )
                  ],
                ),
              ),

              //top cross signs
              Positioned(
                left: 0,
                top: 0,
                child: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),

              //save and delete buttons
              Positioned(
                  bottom: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 5.h,
                    color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            setState(() {
                              postDataServer();
                            });
                          },
                          child: Container(
                            child: Center(
                              child: Text(
                                'Save',
                                style: TextStyle(
                                  fontSize: 5.w,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'Delete',
                          style: TextStyle(
                            fontSize: 5.w,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }
}

//Size between each text field
class SizeBetween extends StatelessWidget {
  const SizeBetween({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.h,
    );
  }
}
