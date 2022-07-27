import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:true_list/sujith/Accounts/buy_credits/category_BottomSheet.dart';
import 'package:true_list/sujith/Models/Constants.dart';

class buyCredits extends StatefulWidget {
  const buyCredits({Key? key}) : super(key: key);

  @override
  State<buyCredits> createState() => _buyCreditsState();
}

class _buyCreditsState extends State<buyCredits> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buy Credits'),
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
            child: Column(
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Center(
                    child: Text(
                  "Buy the credits of your choice",
                  style: TextStyle(fontSize: 4.w, fontWeight: FontWeight.bold),
                )),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (BuildContext context) =>
                                categoryBottomSheet());
                      },
                      child: Container(
                          padding: EdgeInsets.all(3.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: appBackGroundcolor, width: .25.w),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Category",
                                style: TextStyle(
                                    fontSize: 4.w, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Icon(
                                Icons.arrow_drop_down_outlined,
                                size: 4.w,
                              ),
                            ],
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        // showModalBottomSheet(isScrollControlled: true, context: context, builder:(BuildContext context) => categoryBottomSheet());
                      },
                      child: Container(
                          padding: EdgeInsets.all(3.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: appBackGroundcolor, width: .25.w),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Duration",
                                style: TextStyle(
                                    fontSize: 4.w, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Icon(
                                Icons.arrow_drop_down_outlined,
                                size: 4.w,
                              ),
                            ],
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
