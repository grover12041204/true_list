import 'package:flutter/material.dart';
import 'package:true_list/color.dart';
import 'package:true_list/global_variables.dart';
import 'package:true_list/screens/post_data/post_detail_data.dart';
import 'package:true_list/screens/post_screens/post_details_screen.dart';
import 'package:true_list/widgets/subcategory.dart';

class postDetailTextfield extends StatefulWidget {
  final String tx;
  postDetailTextfield({Key? key, required this.tx}) : super(key: key);

  @override
  State<postDetailTextfield> createState() => _postDetailTextfieldState();
}

class _postDetailTextfieldState extends State<postDetailTextfield> {
  bool sub = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 5),
            child: Text(
              widget.tx,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            // : Text(
            //     widget.tx,
            //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            //   ),
          ),
        ),
        SizedBox(height: 15),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Container(
              color: appColors.postBackgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  postGlobalValue == false
                      ? Text('Clothing, Shoes, & Accessories, other -')
                      : Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(postGlobalCategory.toString())),
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: 700,
                              child: Column(
                                children: [
                                  SizedBox(height: 27),
                                  Row(
                                    children: [
                                      SizedBox(width: 20),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Image.asset(
                                          'assets/icons/add_icon.png',
                                          height: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        'Category',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Spacer(),
                                      InkWell(
                                          onTap: () {
                                            if (postGlobalValue == true) {
                                              setState(() {
                                                postGlobalValue = true;
                                              });
                                            }

                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        postDetailScreen()));
                                          },
                                          child: Container(
                                              alignment: Alignment.center,
                                              width: 67,
                                              height: 35,
                                              decoration: BoxDecoration(
                                                  color: appColors.darkBlue,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Text(
                                                'Done',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ))),
                                    ],
                                  ),
                                  SizedBox(height: 25),
                                  Expanded(
                                    // height: 600,
                                    child: ListView.builder(
                                        itemCount: json.length - 1,
                                        itemBuilder: ((context, index) {
                                          return categorySubCategory(
                                            subValue: false,
                                            categoryValue: 1,
                                            listViewIndex: index,
                                          );
                                        })),
                                  )
                                ],
                              ),
                            );
                          });
                    },
                    icon: Icon(Icons.arrow_drop_down),
                  ),
                ],
              )),
        ),
      ],
    );
  }
}




// Container(
//                                             child: Padding(
//                                               padding: EdgeInsets.only(
//                                                   bottom: 15, left: 20),
//                                               child: Text(
//                                                 category[index].toString(),
//                                                 style: TextStyle(
//                                                     fontSize: 18,
//                                                     fontWeight:
//                                                         FontWeight.w600),
//                                               ),
//                                             ),
//                                           );