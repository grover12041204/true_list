import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:true_list/Chat/pages/home_page.dart';
import 'package:true_list/Chat/services/cloud_storage_service.dart';
import 'package:true_list/Chat/services/database_service.dart';
import 'package:true_list/color.dart';
import 'package:true_list/global_variables.dart';
import 'package:true_list/sarthak/Home/home_screen.dart';
import 'package:true_list/screens/post_screens/post_photo_screen.dart';
import 'package:true_list/widgets/profile_pick_image.dart';
import 'package:http/http.dart' as http;
import 'package:true_list/widgets/showsnackbar.dart';

class ProfileInfo extends StatefulWidget {
  ProfileInfo({Key? key}) : super(key: key);

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  late CloudStorageService _cloudStorage;
  late DatabaseService _db;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String token = 'dfsf';
  }

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
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

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
    _cloudStorage = GetIt.instance.get<CloudStorageService>();
    _db = GetIt.instance.get<DatabaseService>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: appColors.backgroundColor1,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 41),
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
                                    icon: Icon(Icons.cancel_presentation_sharp),
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
                                    icon: const Icon(Icons.camera_alt_outlined,
                                        size: 25),
                                  ),
                                  SizedBox(width: 68),
                                  IconButton(
                                    onPressed: () {
                                      selectImageFromGallery();
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(Icons.image_outlined, size: 25),
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
                          backgroundImage: AssetImage('assets/default.jpeg')),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Upload Profile Photo',
                style: TextStyle(
                  color: appColors.standartBlueColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 17),
              Row(
                children: [
                  SizedBox(width: 24),
                  Text(
                    'Name *',
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
                      switchBorder: Border.all(width: 3, color: Colors.black),
                      activeText: '',
                      inactiveText: '',
                      activeColor: Colors.black,
                      activeToggleColor: Colors.white,
                      inactiveToggleColor: Colors.white,
                      width: 55,
                      height: 30,
                      toggleSize: 25,
                      value: nameStatus,
                      borderRadius: 70,
                      showOnOff: true,
                      onToggle: (val) {
                        setState(() {
                          nameStatus = val;
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
                      margin: EdgeInsets.only(left: 24),
                      width: 280,
                      height: 30,
                      child: TextField(
                        controller: _nameController,
                        keyboardType: TextInputType.name,
                      )),
                  nameStatus == true
                      ? Text(
                          'Public',
                          style: TextStyle(fontSize: 16),
                        )
                      : Text(
                          'Private',
                          style: TextStyle(fontSize: 16),
                        ),
                  SizedBox(width: 25)
                ],
              ),
              SizedBox(height: 5),
              //
              //
              // email
              Row(
                children: [
                  SizedBox(width: 24),
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
                      switchBorder: Border.all(width: 3, color: Colors.black),
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
                      margin: EdgeInsets.only(left: 24),
                      width: 280,
                      height: 30,
                      child: TextField()),
                  emailStatus == true
                      ? Text(
                          'Public',
                          style: TextStyle(fontSize: 16),
                        )
                      : Text(
                          'Private',
                          style: TextStyle(fontSize: 16),
                        ),
                  SizedBox(width: 25)
                ],
              ),
              SizedBox(height: 5),
              //
              // DOB
              Row(
                children: [
                  SizedBox(width: 24),
                  Text(
                    'DOB *',
                    style: TextStyle(
                      color: appColors.greyTextColor,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(width: 29),
                ],
              ),
              Row(children: [
                Container(
                  padding: EdgeInsets.only(left: 24),
                  width: 280,
                  height: 30,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Select',
                      labelStyle: TextStyle(color: Colors.blue),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                    readOnly: true,
                    controller: dateCtl,
                    onTap: () async {
                      await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1930),
                        lastDate: DateTime(2025),
                      ).then((selectedDate) {
                        if (selectedDate != null) {
                          dateCtl.text =
                              DateFormat('yyyy-MM-dd').format(selectedDate);
                        }
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter date.';
                      }
                      return null;
                    },
                  ),
                ),
              ]),
              Padding(
                padding: EdgeInsets.only(left: 24, right: 24),
                child: Divider(
                  thickness: 2,
                ),
              ),
              // SizedBox(height: 5),
              //
              //
              Row(
                children: [
                  SizedBox(width: 24),
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
                      switchBorder: Border.all(width: 3, color: Colors.black),
                      activeText: '',
                      inactiveText: '',
                      activeColor: Colors.black,
                      activeToggleColor: Colors.white,
                      inactiveToggleColor: Colors.white,
                      width: 55,
                      height: 30,
                      toggleSize: 25,
                      value: phoneStatus,
                      borderRadius: 70,
                      showOnOff: true,
                      onToggle: (val) {
                        setState(() {
                          phoneStatus = val;
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
                      margin: EdgeInsets.only(left: 24),
                      width: 280,
                      height: 30,
                      child: TextField()),
                  phoneStatus == true
                      ? Text(
                          'Public',
                          style: TextStyle(fontSize: 16),
                        )
                      : Text(
                          'Private',
                          style: TextStyle(fontSize: 16),
                        ),
                  SizedBox(width: 25)
                ],
              ),
              SizedBox(height: 22),
              Container(
                margin: EdgeInsets.only(left: 31, right: 19),
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Row(
                        children: [
                          Radio(
                              activeColor: appColors.darkBlue,
                              value: 1,
                              groupValue: id,
                              onChanged: (val) {
                                setState(() {
                                  radioButtonItem = 'ONE';
                                  id = 1;
                                });
                              }),
                          Expanded(
                              child: Text(
                            'Male',
                            maxLines: 2,
                          ))
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Row(
                        children: [
                          Radio(
                              activeColor: appColors.darkBlue,
                              value: 2,
                              groupValue: id,
                              onChanged: (val) {
                                setState(() {
                                  radioButtonItem = 'TWO';
                                  id = 2;
                                });
                              }),
                          Text('Female')
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Row(
                        children: [
                          Radio(
                              activeColor: appColors.darkBlue,
                              value: 3,
                              groupValue: id,
                              onChanged: (index) {
                                setState(() {
                                  radioButtonItem = 'Three';
                                  id = 3;
                                });
                              }),
                          Text('Others')
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 31, right: 19),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Radio(
                            activeColor: appColors.darkBlue,
                            value: 1,
                            groupValue: id2,
                            onChanged: (val) {
                              setState(() {
                                id2 = 1;
                              });
                            }),
                        Text('Owner')
                      ],
                    ),
                    SizedBox(width: 22),
                    Row(
                      children: [
                        Radio(
                            activeColor: appColors.darkBlue,
                            value: 2,
                            groupValue: id2,
                            onChanged: (val) {
                              setState(() {
                                id2 = 2;
                              });
                            }),
                        Text('Agent')
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  SizedBox(width: 32),
                  Text(
                    'Language Preferrence',
                    style:
                        TextStyle(color: appColors.greyTextColor, fontSize: 17),
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                        color: appColors.darkBlue,
                        borderRadius: BorderRadius.circular(8)),
                    alignment: Alignment.center,
                    width: 101,
                    height: 25,
                    child: Text(
                      'English',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 25),
                ],
              ),

              SizedBox(height: 50),
              InkWell(
                onTap: () {
                  createProfile(context);
                },
                child: Container(
                  width: 349,
                  height: 62,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: appColors.darkBlue),
                  child: Text(
                    'Done',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Map<String, String> requestHeaders = {
    'Authorization': 'Bearer $globalToken',
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  createProfile(BuildContext context) async {
    print(globalToken);
    try {
      print('inside block');
      var response = await http.post(
          Uri.parse(
            "https://deep-nucleus1.azurewebsites.net/api/v1/createProfile",
          ),
          body: jsonEncode({
            "name": _nameController.text,
            "country_code": "+91",
            "date_of_birth": "03/01/2000",
            "email": "raj123123@city.com",
            "age": 23,
            "gender": "Male",
            "user_type": "Agent",
            "language_preference": "English",
            "city": "Hyderabad",
            "about": "Nothing",
            "free_credit": 200,
            "premium_credit": 0,
            "profile_url":
                "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/c4681367-74e7-4852-870a-826804c9c314/dbkw7z3-21d5376c-c7a9-40ec-8e39-1fb90707a8ae.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2M0NjgxMzY3LTc0ZTctNDg1Mi04NzBhLTgyNjgwNGM5YzMxNFwvZGJrdzd6My0yMWQ1Mzc2Yy1jN2E5LTQwZWMtOGUzOS0xZmI5MDcwN2E4YWUucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.JmzRDNGcy3qJgswcziFJxZJfHKW_e31_uJKpYIuCV7g"
          }),
          headers: requestHeaders);
      print('sms is working');
      var decodeJsom = jsonDecode(response.body);
      print(decodeJsom);
      print(decodeJsom["statusCode"]);
      print(decodeJsom["Profile_Data"]['_id']);
      mongoId = decodeJsom["Profile_Data"]['_id'];
      print(mongoId);
      if (userExistingMongo != true) {
        String uid = decodeJsom["Profile_Data"]['_id'];
        String? _imageURL = await _cloudStorage.saveUserImageToStorage2(
            uid, decodeJsom["Profile_Data"]['profile_url']);
        await _db.createUser(
            uid,
            decodeJsom["Profile_Data"]['userNumber']['text'],
            // decodeJsom["Profile_Data"]['name'],
            _nameController.text,
            _imageURL!);
      }
      if (decodeJsom["statusCode"] != 200) {
        print(decodeJsom["statusCode"]);
        print('4000');
        showInSnackBarFinal('Invalid User', context);
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
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


//  if (_registerFormKey.currentState!.validate() &&
//             _profileImage != null) {
//           _registerFormKey.currentState!.save();
//           String? _uid = await _auth.registerUserUsingEmailAndPassword(
//               _email!, _password!);
//           String? _imageURL =
//               await _cloudStorage.saveUserImageToStorage(_uid!, _profileImage!);
//           await _db.createUser(_uid, _email!, _name!, _imageURL!);
//           await _auth.logout();
//           await _auth.loginUsingEmailAndPassword(_email!, _password!);
//         }