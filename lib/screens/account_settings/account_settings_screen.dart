import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:true_list/color.dart';
import 'package:true_list/widgets/profile_pick_image.dart';
import 'package:http/http.dart' as http;

import '../../widgets/showsnackbar.dart';

class AccountSettingScreen extends StatefulWidget {
  AccountSettingScreen({Key? key}) : super(key: key);

  @override
  State<AccountSettingScreen> createState() => _AccountSettingScreenState();
}

class _AccountSettingScreenState extends State<AccountSettingScreen> {
  bool nameStatus = false;
  bool emailStatus = false;
  bool phoneStatus = false;
  String radioButtonItem = 'ONE';
  int id = 0;
  int id2 = 0;
  Uint8List? _image;
  DateTime? _dateTime;
  String? photoUrl;
  bool _isloading = false;
  DateTime _date = DateTime.now();
  TextEditingController dateCtl = TextEditingController();

  void selectImageFromGallery() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  void selectImageFromCamera() async {
    Uint8List im = await pickImage(ImageSource.camera);
    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: appColors.darkBlue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: size.height * 0.060),
          Row(
            children: [
              SizedBox(width: 10),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image.asset(
                  'assets/icons/left_arrow.png',
                  height: 24,
                ),
              ),
              Text(
                'Account Settings',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              Spacer(),
              InkWell(
                onTap: () => showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Container(
                            height: 122,
                            width: 315,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 15),
                                Text(
                                  'Do you want to delete it ?',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(height: 10),
                                Divider(thickness: 1.5),
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: appColors.greyTextColor),
                                        )),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "Save as Draft",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: appColors.postMapBlueColor),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )),
                      );
                    }),
                child: Text(
                  'Cancel',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              SizedBox(
                width: 19,
              )
            ],
          ),
          Flexible(
              child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25),
                )),
            child: ListView(
                // padding: EdgeInsets.zero,
                children: [
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(right: 40.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text('Save'),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: 163,
                              // color: Colors.green,
                              child: Column(
                                children: [
                                  SizedBox(height: 19),
                                  Row(
                                    children: [
                                      SizedBox(width: 40),
                                      const Text(
                                        'Profile Photo',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Spacer(),
                                      IconButton(
                                        onPressed: () => Navigator.pop(context),
                                        icon: Icon(
                                            Icons.cancel_presentation_sharp),
                                      ),
                                      SizedBox(width: 20),
                                    ],
                                  ),
                                  // SizedBox(height: 15),
                                  Row(
                                    children: [
                                      SizedBox(width: 30),
                                      IconButton(
                                        onPressed: () {
                                          selectImageFromCamera();
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(
                                            Icons.camera_alt_outlined,
                                            size: 25),
                                      ),
                                      SizedBox(width: 68),
                                      IconButton(
                                        onPressed: () {
                                          selectImageFromGallery();
                                          Navigator.pop(context);
                                        },
                                        icon: Icon(Icons.image_outlined,
                                            size: 25),
                                      ),
                                      SizedBox(width: 68),
                                      _image != null
                                          ? IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  _image = null;
                                                });
                                                Navigator.pop(context);
                                              },
                                              icon: Icon(
                                                Icons.delete_forever_outlined,
                                                size: 25,
                                              ),
                                            )
                                          : SizedBox()
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(width: 30),
                                      Text(
                                        'Camera',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(width: 55),
                                      Text(
                                        'Gallery',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(width: 55),
                                      _image != null
                                          ? Text(
                                              'Delete',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400),
                                            )
                                          : SizedBox()
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: _image != null
                          ? CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 80,
                              backgroundImage: MemoryImage(_image!))
                          : CircleAvatar(
                              radius: 80,
                              backgroundImage:
                                  AssetImage('assets/default.jpeg')),
                    ),
                  ),

                  SizedBox(height: 13),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Table(
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      children: [
                        TableRow(children: [
                          Align(
                              alignment: Alignment.center,
                              child: Text('Followers')),
                          Align(
                              alignment: Alignment.center,
                              child: Text('Following')),
                          Align(
                              alignment: Alignment.center,
                              child: Text('Rated')),
                        ]),
                        TableRow(children: [
                          Align(
                              alignment: Alignment.center, child: Text('20K')),
                          Align(
                              alignment: Alignment.center, child: Text('500')),
                          Align(
                              alignment: Alignment.center, child: Text('3.25')),
                        ]),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Text(
                          'Accounts Settings',
                          style: TextStyle(
                            // color: appColors.standartBlueColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 17),
                        Text(
                          'Name',
                          style: TextStyle(
                            color: appColors.greyTextColor,
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Shyamala',
                          style: TextStyle(
                            // color: appColors.greyTextColor,
                            fontSize: 17,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child: Divider(thickness: 2),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              'Email',
                              style: TextStyle(
                                color: appColors.greyTextColor,
                                fontSize: 17,
                              ),
                            ),
                            Spacer(),
                            Container(
                              child: FlutterSwitch(
                                inactiveToggleBorder:
                                    Border.all(width: 3, color: Colors.black),
                                inactiveColor: Colors.white,
                                switchBorder:
                                    Border.all(width: 3, color: Colors.black),
                                activeText: '',
                                inactiveText: '',
                                activeColor: Colors.black,
                                activeToggleColor: Colors.white,
                                inactiveToggleColor: Colors.white,
                                width: 55,
                                height: 30,
                                toggleSize: 25,
                                value: emailStatus,
                                borderRadius: 70,
                                showOnOff: true,
                                onToggle: (val) {
                                  setState(() {
                                    emailStatus = val;
                                  });
                                },
                              ),
                            ),
                            SizedBox(width: 29),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 290,
                              height: 30,
                              child: Text(
                                'Shyamala@gmail.com',
                                style: TextStyle(
                                  // color: appColors.greyTextColor,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            emailStatus == true
                                ? Text(
                                    'Public',
                                    style: TextStyle(fontSize: 16),
                                  )
                                : Text(
                                    'Private',
                                    style: TextStyle(fontSize: 16),
                                  ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child: Divider(thickness: 2),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              'Phone',
                              style: TextStyle(
                                color: appColors.greyTextColor,
                                fontSize: 17,
                              ),
                            ),
                            Spacer(),
                            Container(
                              child: FlutterSwitch(
                                inactiveToggleBorder:
                                    Border.all(width: 3, color: Colors.black),
                                inactiveColor: Colors.white,
                                switchBorder:
                                    Border.all(width: 3, color: Colors.black),
                                activeText: '',
                                inactiveText: '',
                                activeColor: Colors.black,
                                activeToggleColor: Colors.white,
                                inactiveToggleColor: Colors.white,
                                width: 55,
                                height: 30,
                                toggleSize: 25,
                                value: emailStatus,
                                borderRadius: 70,
                                showOnOff: true,
                                onToggle: (val) {
                                  setState(() {
                                    emailStatus = val;
                                  });
                                },
                              ),
                            ),
                            SizedBox(width: 29),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 290,
                              height: 30,
                              child: Text(
                                '1234567890',
                                style: TextStyle(
                                  // color: appColors.greyTextColor,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            emailStatus == true
                                ? Text(
                                    'Public',
                                    style: TextStyle(fontSize: 16),
                                  )
                                : Text(
                                    'Private',
                                    style: TextStyle(fontSize: 16),
                                  ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child: Divider(thickness: 2),
                        ),
                        // 11
                        Text(
                          'DOB ',
                          style: TextStyle(
                            color: appColors.greyTextColor,
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '25th Feb 2000',
                          style: TextStyle(
                            // color: appColors.greyTextColor,
                            fontSize: 17,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child: Divider(thickness: 2),
                        ),
                        SizedBox(height: 5),
                        // 22
                        Text(
                          'Gender',
                          style: TextStyle(
                            color: appColors.greyTextColor,
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Female',
                          style: TextStyle(
                            // color: appColors.greyTextColor,
                            fontSize: 17,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child: Divider(thickness: 2),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Status',
                          style: TextStyle(
                            color: appColors.greyTextColor,
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Owner',
                          style: TextStyle(
                            // color: appColors.greyTextColor,
                            fontSize: 17,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child: Divider(thickness: 2),
                        ),
                        SizedBox(height: 5),

                        Row(
                          children: [
                            Text(
                              'City ',
                              style: TextStyle(
                                color: appColors.greyTextColor,
                                fontSize: 17,
                              ),
                            ),
                            Spacer(),
                            Container(
                              child: FlutterSwitch(
                                inactiveToggleBorder:
                                    Border.all(width: 3, color: Colors.black),
                                inactiveColor: Colors.white,
                                switchBorder:
                                    Border.all(width: 3, color: Colors.black),
                                activeText: '',
                                inactiveText: '',
                                activeColor: Colors.black,
                                activeToggleColor: Colors.white,
                                inactiveToggleColor: Colors.white,
                                width: 55,
                                height: 30,
                                toggleSize: 25,
                                value: emailStatus,
                                borderRadius: 70,
                                showOnOff: true,
                                onToggle: (val) {
                                  setState(() {
                                    emailStatus = val;
                                  });
                                },
                              ),
                            ),
                            SizedBox(width: 29),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 290,
                              height: 30,
                              child: Text(
                                'Indore',
                                style: TextStyle(
                                  // color: appColors.greyTextColor,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            emailStatus == true
                                ? Text(
                                    'Public',
                                    style: TextStyle(fontSize: 16),
                                  )
                                : Text(
                                    'Private',
                                    style: TextStyle(fontSize: 16),
                                  ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child: Divider(thickness: 2),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              'About ',
                              style: TextStyle(
                                color: appColors.greyTextColor,
                                fontSize: 17,
                              ),
                            ),
                            Spacer(),
                            Container(
                              child: FlutterSwitch(
                                inactiveToggleBorder:
                                    Border.all(width: 3, color: Colors.black),
                                inactiveColor: Colors.white,
                                switchBorder:
                                    Border.all(width: 3, color: Colors.black),
                                activeText: '',
                                inactiveText: '',
                                activeColor: Colors.black,
                                activeToggleColor: Colors.white,
                                inactiveToggleColor: Colors.white,
                                width: 55,
                                height: 30,
                                toggleSize: 25,
                                value: emailStatus,
                                borderRadius: 70,
                                showOnOff: true,
                                onToggle: (val) {
                                  setState(() {
                                    emailStatus = val;
                                  });
                                },
                              ),
                            ),
                            SizedBox(width: 29),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 290,
                              child: Text(
                                "I’m simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's and also standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic and also typesetting, remaining essentially unchanged can be.",
                                style: TextStyle(
                                  // color: appColors.greyTextColor,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child: Divider(thickness: 2),
                        ),
                      ],
                    ),
                  ),

                  //
                  //
                  // email

                  SizedBox(height: 50),
                  InkWell(
                    onTap: () {
                      GetProfileData(context);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: appColors.darkBlue),
                      child: Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                ]),
          )),
        ],
      ),
    );
  }

  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };
  GetProfileData(BuildContext context) async {
    try {
      print('inside block');
      var response = await http.post(
          Uri.parse(
            "https://deep-nucleus1.azurewebsites.net/api/v1/getProfile",
          ),
          headers: requestHeaders);

      var decodeJsom = jsonDecode(response.body);
      print(decodeJsom);
      // print(decodeJsom["statusCode"]);
      // if (decodeJsom["statusCode"] != 200) {
      //   print(decodeJsom["statusCode"]);
      //   print('4000');
      //   showInSnackBarFinal('Invalid OTP', context);
      // } else {
      //   // Navigator.push(
      //   //   context,
      //   //   MaterialPageRoute(
      //   //     builder: (context) => SuccessScreen(),
      //   //   ),
      //   // );
      // }

      print(response.body);
      print(decodeJsom['date_of_birth']);
    } catch (e) {
      print('not working');
      print(e);
      print('Grover is hungry');
    }
    print('kamalesh');
  }
}
