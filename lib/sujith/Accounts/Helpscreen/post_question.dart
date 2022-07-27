import 'dart:ffi';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sizer/sizer.dart';
import 'package:true_list/sujith/Models/Constants.dart';

class questionPage extends StatefulWidget {
  const questionPage({Key? key}) : super(key: key);

  @override
  State<questionPage> createState() => _questionPageState();
}

final controller1 = TextEditingController();

class _questionPageState extends State<questionPage> {
  void info() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    setState(() {
      controller1.text =
          androidInfo.device.toString() + ' , ' + androidInfo.model.toString();
    });
    //print('Running on ${androidInfo.device}');
  }

  @override
  void initState() {
    info();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var helpScreenTitleColor = Color(0xfff1e1e1e);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Account - Help'),
        backgroundColor: appBackGroundcolor,
        elevation: 0,
      ),
      body: Container(
        color: appBackGroundcolor,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(1.h),
                topRight: Radius.circular(1.h),
              )),
          child: ListView(
            children: [
              SizedBox(
                height: 5.h,
              ),

              Container(
                height: 4.h,
                width: MediaQuery.of(context).size.width,
                //color: Colors.blue,
                child: Text(
                  'Please share your input/concern.',
                  style: TextStyle(
                      color: appBackGroundcolor,
                      fontSize: 4.w,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),

              //phone information
              Container(
                height: 4.h,
                width: MediaQuery.of(context).size.width,
                //color: Colors.blue,
                child: Text(
                  'Phone information',
                  style: TextStyle(
                    color: helpScreenTitleColor,
                    fontSize: 4.w,
                    fontFamily: 'poppins',
                  ),
                ),
              ),
              //phone information TextField
              TextFormField(
                controller: controller1,
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
              SizedBox(
                height: 2.h,
              ),

              //Title
              Container(
                height: 4.h,
                width: MediaQuery.of(context).size.width,
                //color: Colors.blue,
                child: Text(
                  'Title(required)',
                  style: TextStyle(
                    color: helpScreenTitleColor,
                    fontSize: 4.w,
                    fontFamily: 'poppins',
                  ),
                ),
              ),
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
              SizedBox(
                height: 2.h,
              ),

              //Description
              Container(
                height: 4.h,
                width: MediaQuery.of(context).size.width,
                //color: Colors.blue,
                child: Text(
                  'Description(required)',
                  style: TextStyle(
                    color: helpScreenTitleColor,
                    fontSize: 4.w,
                    fontFamily: 'poppins',
                  ),
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                      bottom: 15.h,
                      top: 1.h,
                    ),
                    filled: true,
                    fillColor: bottomSheetTextFieldColor,
                    border: InputBorder.none,
                    //borderRadius: BorderRadius.circular(10),
                    //labelText: 'Enter Name',
                    //contentPadding: EdgeInsets.symmetric(horizontal: 0,vertical: 7.h),
                    hintText: 'Enter the description'),
              ),
              SizedBox(
                height: 2.h,
              ),

              Container(
                height: 4.h,
                width: MediaQuery.of(context).size.width,
                //color: Colors.blue,
                child: Text(
                  'Attachment',
                  style: TextStyle(
                    color: helpScreenTitleColor,
                    fontSize: 4.w,
                    fontFamily: 'poppins',
                  ),
                ),
              ),
              //photo attachment container
              Container(
                height: 20.h,
                width: MediaQuery.of(context).size.width,
                color: bottomSheetTextFieldColor,
                child: Center(
                    child: Text(
                  'Add your photo here',
                  style: TextStyle(
                    color: helpScreenTitleColor,
                    fontSize: 4.w,
                    fontFamily: 'poppins',
                  ),
                )),
              ),
              SizedBox(
                height: 2.h,
              ),

              Container(
                //olor: Colors.amber,
                height: 8.h,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      imageContainer(),
                      imageContainer(),
                      imageContainer(),
                      imageContainer()
                    ]),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 4.h,
                decoration: BoxDecoration(
                  color: appBackGroundcolor,
                ),
                child: Center(
                    child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                )),
              ),

              Container(
                height: 2.h,
                color: Colors.white,
              )

              //     Container(
              //   //width: 25.w,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(3.w),
              //     image: DecorationImage(
              //       image: AssetImage("images/download.jpg"),
              //       fit: BoxFit.fill,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class imageContainer extends StatelessWidget {
  const imageContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.w),
        image: DecorationImage(
          image: AssetImage("images/download.jpg"),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

//  SizedBox(height: 5.h,),
//               //information display
//               Container(
//                 height: 4.h,
//                 width: MediaQuery.of(context).size.width,
//                 //color: Colors.blue,
//                 child: Text('Please share your input/concern.',style: TextStyle(color: appBackGroundcolor,fontSize: 4.w,fontFamily:'poppins',fontWeight: FontWeight.bold),),) ,
//               //SizedBox(height: 5.h,),
//               //phone information
//               Container(
//                 height: 4.h,
//                 width: MediaQuery.of(context).size.width,
//                 //color: Colors.blue,
//                 child: Text('Phone information',style: TextStyle(color: helpScreenTitleColor,fontSize: 4.w,fontFamily:'poppins',),),) ,

//               //phone information TextField
//               TextFormField (
//                 decoration: InputDecoration(
//                 filled: true,
//                 fillColor: bottomSheetTextFieldColor,
//                 border: InputBorder.none,
//                 //borderRadius: BorderRadius.circular(10),
//                 //labelText: 'Enter Name',
//                 //contentPadding: EdgeInsets.symmetric(horizontal: 0,vertical: 7.h),
//                 //hintText: 'Enter Your Name'
//                 ),
//                 ),
//               SizedBox(height: 2.h,),

//               //Title
//               Container(
//                 height: 4.h,
//                 width: MediaQuery.of(context).size.width,
//                 //color: Colors.blue,
//                 child: Text('Title(required)',style: TextStyle(color: helpScreenTitleColor,fontSize: 4.w,fontFamily:'poppins',),),) ,
//               TextFormField (
//                 decoration: InputDecoration(
//                 filled: true,
//                 fillColor: bottomSheetTextFieldColor,
//                 border: InputBorder.none,
//                 //borderRadius: BorderRadius.circular(10),
//                 //labelText: 'Enter Name',
//                 //contentPadding: EdgeInsets.symmetric(horizontal: 0,vertical: 7.h),
//                 //hintText: 'Enter Your Name'
//                 ),
//                 ),
//               SizedBox(height: 2.h,),

//               //Description
//               Container(
//                 height: 4.h,
//                 width: MediaQuery.of(context).size.width,
//                 //color: Colors.blue,
//                 child: Text('Description(required)',style: TextStyle(color: helpScreenTitleColor,fontSize: 4.w,fontFamily:'poppins',),),) ,
//                TextFormField (
//                 keyboardType: TextInputType.multiline,
//                 maxLines: null,
//                 decoration: InputDecoration(
//                 contentPadding: EdgeInsets.only(bottom: 15.h,top:1.h,),
//                 filled: true,
//                 fillColor: bottomSheetTextFieldColor,
//                 border: InputBorder.none,
//                 //borderRadius: BorderRadius.circular(10),
//                 //labelText: 'Enter Name',
//                 //contentPadding: EdgeInsets.symmetric(horizontal: 0,vertical: 7.h),
//                 hintText: 'Enter the description'
//                 ),
//                 ),
//               SizedBox(height: 2.h,),

//               //attachment
//               Container(
//                 height: 4.h,
//                 width: MediaQuery.of(context).size.width,
//                 //color: Colors.blue,
//                 child: Text('Attachment',style: TextStyle(color: helpScreenTitleColor,fontSize: 4.w,fontFamily:'poppins',),),) ,
//               //photo attachment container

//               Container(
//                 height: 20.h,
//                 width: MediaQuery.of(context).size.width,
//                 color: bottomSheetTextFieldColor,
//                 child: Center(child: Text('Add your photo here',style: TextStyle(color: helpScreenTitleColor,fontSize: 4.w,fontFamily:'poppins',),)),) ,
//               SizedBox(height: 2.h,),

//             Container(
//                       width: 25.w,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(3.w),
//                         image: DecorationImage(
//                           image: AssetImage("images/download.jpg"),
//                           fit: BoxFit.fill,
//                         ),
//                       ),
//                     ),
