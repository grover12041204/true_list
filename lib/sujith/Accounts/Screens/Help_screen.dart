import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:true_list/sujith/Accounts/Helpscreen/chatScreen.dart';
import 'package:true_list/sujith/Accounts/Helpscreen/post_question.dart';
import 'package:true_list/sujith/Accounts/MyAds/sellingTab.dart';
import 'package:true_list/sujith/Models/Constants.dart';

//create screen as like accounts page
class helpScreen extends StatefulWidget {
  const helpScreen({Key? key}) : super(key: key);

  @override
  State<helpScreen> createState() => _helpScreenState();
}

class _helpScreenState extends State<helpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text('Account - Help'),
        backgroundColor: appBackGroundcolor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: appBackGroundcolor,
              height: 100.h,
              child: ListView(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(3.h),
                        topRight: Radius.circular(3.h),
                      ),
                    ),
                    height: 100.h,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: ListView(
                        children: [
                          HelpTopContent(),
                          SizedBox(
                            height: 1.h,
                          ),
                          GestureDetector(
                            onTap: () {
                              // navigate to post question screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => chatscreen(),
                                ),
                              );
                            },
                            child: Container(
                              height: 3.h,

                              color: Colors.grey,
                              child: Center(
                                child: Text(
                                  'Chat Screen',
                                  style: TextStyle(
                                    fontSize: 2.h,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              //child: ,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HelpTopContent extends StatelessWidget {
  const HelpTopContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            // padding: EdgeInsets.symmetric(horizontal: 3.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(3.h),
                topRight: Radius.circular(3.h),
              ),
            ),
            height: 7.h,
            child: GestureDetector(
              onTap: () {
                //navigate to question page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => questionPage(),
                  ),
                );
              },
              child: Row(
                children: [
                  Icon(
                    Icons.camera_alt,
                    color: postDate,
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Text(
                    "Post a question",
                    style: TextStyle(
                        color: postDate,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        fontSize: 17),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: myAdsDivider(),
          ),
        ],
      ),
    );
  }
}
