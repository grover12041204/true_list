import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:true_list/color.dart';
import 'package:true_list/global_variables.dart';
import 'package:true_list/screens/post_data/post_detail_data.dart';

class categorySubCategory extends StatefulWidget {
  bool subValue;
  int categoryValue;
  int listViewIndex;
  categorySubCategory(
      {Key? key,
      required this.subValue,
      required this.categoryValue,
      required this.listViewIndex})
      : super(key: key);

  @override
  State<categorySubCategory> createState() => _categorySubCategoryState();
}

class _categorySubCategoryState extends State<categorySubCategory> {
  Map<String, dynamic> data = Map<String, dynamic>();
  bool subcategorySelect = false;
  late int subcategorySelectNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.subValue == true
          ? Container(
              height: json[json['Category'][widget.listViewIndex]]
                          ['subcategory']
                      .length *
                  30.toDouble(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          widget.subValue = false;
                        });
                      },
                      child: Text(
                        json['Category'][widget.listViewIndex],
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: json[json['Category'][widget.listViewIndex]]
                                ['subcategory']
                            .length,
                        itemBuilder: (BuildContext context, index) {
                          return Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    postGlobalValue = true;
                                    postMainCategory =
                                        json['Category'][widget.listViewIndex];
                                    postGlobalCategory = json[json['Category']
                                            [widget.listViewIndex]]
                                        ['subcategory'][index];
                                    subcategorySelect = true;
                                    // subcategorySelectNumber = index;
                                    print(postGlobalValue);
                                    print(postGlobalCategory);
                                  });
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(left: 40, bottom: 5),
                                  child: Text(
                                    json[json['Category'][widget.listViewIndex]]
                                        ['subcategory'][index],
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: appColors.greyLoginText,
                                    ),
                                  ),
                                ),
                              ),
                              // SizedBox(width: 10),
                              // subcategorySelectNumber == index
                              //     ? Icon(Icons.arrow_circle_right_outlined)
                              //     : SizedBox()
                            ],
                          );
                        }),
                  ),
                ],
              ),
            )
          : InkWell(
              onTap: () {
                setState(() {
                  widget.subValue = true;
                  print(json[widget.listViewIndex]);
                });
              },
              child: Container(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 15, left: 20),
                  child: Text(
                    json['Category'][widget.listViewIndex],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
    );
  }
}



// onTap: () {
//                 setState(() {
//                   widget.subValue = false;
//                 });
//               },