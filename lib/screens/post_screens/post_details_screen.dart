import 'package:flutter/material.dart';
import 'package:true_list/color.dart';
import 'package:true_list/global_variables.dart';
import 'package:true_list/screens/post_data/postDetailSubFeild.dart';
import 'package:true_list/screens/post_data/post_detail_data.dart';
import 'package:true_list/screens/post_screens/post_full_detail_screen.dart';
import 'package:true_list/screens/post_screens/post_price_screen.dart';
import 'package:true_list/widgets/post_detail_textfield.dart';

class postDetailScreen extends StatefulWidget {
  const postDetailScreen({Key? key}) : super(key: key);

  @override
  State<postDetailScreen> createState() => _postDetailScreenState();
}

class _postDetailScreenState extends State<postDetailScreen> {
  TextEditingController _specailController = TextEditingController();
  TextEditingController _specailController2 = TextEditingController();
  TextEditingController _specailController3 = TextEditingController();
  TextEditingController _specailController4 = TextEditingController();
  TextEditingController _specailController5 = TextEditingController();

  TextEditingController _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: appColors.darkBlue,
      body: Column(
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
                'Details',
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
                children: [
                  // SizedBox(height: ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Table(
                      children: [
                        TableRow(children: [
                          Image.asset('assets/icons/post_current_bar.png'),
                          Image.asset('assets/icons/post_current_bar.png'),
                          Image.asset('assets/icons/post_bar2.png'),
                          Image.asset('assets/icons/post_bar2.png'),
                        ]),
                        TableRow(children: [
                          SizedBox(height: 15),
                          SizedBox(height: 10),
                          SizedBox(height: 10),
                          SizedBox(height: 10),
                        ]),
                        TableRow(children: [
                          Center(child: Text("1. Photo")),
                          Center(child: Text("2. Details")),
                          Center(child: Text('3. Price')),
                          Center(child: Text('4. Finish')),
                        ]),
                      ],
                    ),
                  ),
                  SizedBox(height: 25),
                  postDetailTextfield(tx: 'Category'),

                  postGlobalValue == true
                      ? Container(
                          constraints: BoxConstraints(
                              maxHeight: json[postMainCategory]
                                          [postGlobalCategory]
                                      .length *
                                  90.toDouble()),
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: json[postMainCategory]
                                      [postGlobalCategory]
                                  .length,
                              itemBuilder: (BuildContext context, index) {
                                return PostDetainSubFeild(
                                  index: index,
                                );
                              }),
                        )
                      : SizedBox(),
                  //
                  //
                  SizedBox(height: 26),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Special Mentions (optional)',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 0.5, color: appColors.greyTextColor)),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: appColors.postBackgroundColor,
                              borderRadius: BorderRadius.circular(10),
                              // border: Border.all(
                              //     width: 0.5, color: appColors.greyTextColor),
                            ),
                            padding: EdgeInsets.only(left: 20),
                            child: TextField(
                              controller: _specailController,
                              maxLength: 15,
                              style: TextStyle(fontSize: 18),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '1',
                                  counterText: ''),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                              color: appColors.postBackgroundColor,
                              borderRadius: BorderRadius.circular(10),
                              // border: Border.all(
                              //     width: 0.5, color: appColors.greyTextColor),
                            ),
                            padding: EdgeInsets.only(left: 20),
                            child: TextField(
                              controller: _specailController2,
                              maxLength: 15,
                              style: TextStyle(fontSize: 18),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '2',
                                  counterText: ''),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                              color: appColors.postBackgroundColor,
                              borderRadius: BorderRadius.circular(10),
                              // border: Border.all(
                              //     width: 0.5, color: appColors.greyTextColor),
                            ),
                            padding: EdgeInsets.only(left: 20),
                            child: TextField(
                              controller: _specailController3,
                              maxLength: 15,
                              style: TextStyle(fontSize: 18),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '3',
                                  counterText: ''),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                              color: appColors.postBackgroundColor,
                              borderRadius: BorderRadius.circular(10),
                              // border: Border.all(
                              //     width: 0.5, color: appColors.greyTextColor),
                            ),
                            padding: EdgeInsets.only(left: 20),
                            child: TextField(
                              controller: _specailController4,
                              maxLength: 15,
                              style: TextStyle(fontSize: 18),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '4',
                                  counterText: ''),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                              color: appColors.postBackgroundColor,
                              borderRadius: BorderRadius.circular(10),
                              // border: Border.all(
                              //     width: 0.5, color: appColors.greyTextColor),
                            ),
                            padding: EdgeInsets.only(left: 20),
                            child: TextField(
                              controller: _specailController5,
                              maxLength: 15,
                              style: TextStyle(fontSize: 18),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '5',
                                  counterText: ''),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 26),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Description (optional)',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      height: 130,
                      padding: EdgeInsets.only(left: 10),
                      color: appColors.postBackgroundColor,
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        minLines: 1,
                        maxLines: 4,
                        controller: _descriptionController,
                        style: TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText:
                              'Items with a detailed description sell faster!',
                          counterText: '',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  InkWell(
                    onTap: () {
                      setState(() {
                        PostGlobalData.category = postGlobalCategory.toString();
                        PostGlobalData.subcategory =
                            postMainCategory.toString();
                        print(PostGlobalData.subcategory[1].toString() +
                            'adfsfdsdfsf');
                        print(json[postMainCategory][postGlobalCategory]);
                        print(PostGlobalData.category + 'dfsdfadfasdfas');

                        if (_specailController.text.isNotEmpty) {
                          print('grodver');
                          PostGlobalData.specailMentions
                              .add(_specailController.text);
                        }
                        ;
                        if (_specailController2.text.isNotEmpty) {
                          PostGlobalData.specailMentions
                              .add(_specailController2.text);
                        }
                        ;
                        if (_specailController3.text.isNotEmpty) {
                          PostGlobalData.specailMentions
                              .add(_specailController3.text);
                        }
                        ;
                        if (_specailController4.text.isNotEmpty) {
                          PostGlobalData.specailMentions
                              .add(_specailController4.text);
                        }
                        ;
                        if (_specailController5.text.isNotEmpty) {
                          PostGlobalData.specailMentions
                              .add(_specailController5.text);
                        }
                        ;
                        print('funny it not working');
                        print(PostGlobalData.specailMentions);

                        PostGlobalData.description =
                            _descriptionController.text;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PostPriceScreen(),
                        ),
                      );
                    },
                    child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: appColors.darkBlue,
                        ),
                        child: Text(
                          'Save & Continue',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        )),
                  ),
                  SizedBox(height: 30)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
