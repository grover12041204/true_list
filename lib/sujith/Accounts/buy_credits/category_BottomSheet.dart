import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:true_list/sujith/Models/Constants.dart';

bool _isESelected = false;

//CB == Category Bottom Sheet
var CBDropDowntextStyle =
    TextStyle(fontSize: 4.5.w, color: postDate, fontFamily: 'poppins');

var CBHeadingtextStyle = TextStyle(
    fontSize: 4.5.w,
    color: Color(0xfff1E1E1E),
    fontFamily: 'poppins',
    fontWeight: FontWeight.bold);

class categoryBottomSheet extends StatefulWidget {
  const categoryBottomSheet({Key? key}) : super(key: key);

  @override
  State<categoryBottomSheet> createState() => _categoryBottomSheetState();
}

class _categoryBottomSheetState extends State<categoryBottomSheet> {
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
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        child: Center(
                            child: Text(
                          "Select The Category",
                          style: TextStyle(
                              fontSize: 4.5.w, fontWeight: FontWeight.bold),
                        )),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isESelected = !_isESelected;
                                });
                              },
                              child: Text(
                                "Electronic and media",
                                style: CBHeadingtextStyle,
                              )),
                          _isESelected
                              ? Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      space(),
                                      Text(
                                        "Telivison",
                                        style: CBDropDowntextStyle,
                                      ),
                                      space(),
                                      Text(
                                        "Mobile",
                                        style: CBDropDowntextStyle,
                                      ),
                                      space(),
                                      Text(
                                        "Radio",
                                        style: CBDropDowntextStyle,
                                      ),
                                      space()
                                    ],
                                  ))
                              : Container(),
                          space(),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isESelected = !_isESelected;
                                });
                              },
                              child: Text(
                                "Home & garden",
                                style: CBHeadingtextStyle,
                              )),
                          _isESelected
                              ? Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      space(),
                                      Text(
                                        "Telivison",
                                        style: CBDropDowntextStyle,
                                      ),
                                      space(),
                                      Text(
                                        "Mobile",
                                        style: CBDropDowntextStyle,
                                      ),
                                      space(),
                                      Text(
                                        "Radio",
                                        style: CBDropDowntextStyle,
                                      ),
                                      space()
                                    ],
                                  ))
                              : Container(),
                          space(),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isESelected = !_isESelected;
                                });
                              },
                              child: Text(
                                "Clothing , Shoes & Accesories",
                                style: CBHeadingtextStyle,
                              )),
                          _isESelected
                              ? Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      space(),
                                      Text(
                                        "Telivison",
                                        style: CBDropDowntextStyle,
                                      ),
                                      space(),
                                      Text(
                                        "Mobile",
                                        style: CBDropDowntextStyle,
                                      ),
                                      space(),
                                      Text(
                                        "Radio",
                                        style: CBDropDowntextStyle,
                                      ),
                                      space()
                                    ],
                                  ))
                              : Container(),
                          space(),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isESelected = !_isESelected;
                                });
                              },
                              child: Text(
                                "Electronic and media",
                                style: CBHeadingtextStyle,
                              )),
                          _isESelected
                              ? Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      space(),
                                      Text(
                                        "Telivison",
                                        style: CBDropDowntextStyle,
                                      ),
                                      space(),
                                      Text(
                                        "Mobile",
                                        style: CBDropDowntextStyle,
                                      ),
                                      space(),
                                      Text(
                                        "Radio",
                                        style: CBDropDowntextStyle,
                                      ),
                                      space()
                                    ],
                                  ))
                              : Container(),
                          space(),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isESelected = !_isESelected;
                                });
                              },
                              child: Text(
                                "Electronic and media",
                                style: CBHeadingtextStyle,
                              )),
                          _isESelected
                              ? Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      space(),
                                      Text(
                                        "Telivison",
                                        style: CBDropDowntextStyle,
                                      ),
                                      space(),
                                      Text(
                                        "Mobile",
                                        style: CBDropDowntextStyle,
                                      ),
                                      space(),
                                      Text(
                                        "Radio",
                                        style: CBDropDowntextStyle,
                                      ),
                                      space()
                                    ],
                                  ))
                              : Container(),
                          space(),
                        ],
                      )
                      // ,Container(child: Column(
                      //   children: [
                      //     Text("Electronic and media"),

                      //    ],
                      // ),)
                    ],
                  ),
                ),
                //make a x button
                Positioned(
                  left: 0,
                  top: 0,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}

class space extends StatelessWidget {
  const space({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 2.h,
    );
  }
}
