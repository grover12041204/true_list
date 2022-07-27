import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:true_list/color.dart';

Widget postContainer(
  double w,
  double h,
  String image,
  String text,
  bool imageData,
  List imageFile,
  int index,
) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: Colors.black)),
    width: w,
    height: h,
    child: imageData == true
        ? Image.file(
            imageFile[index],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(image),
              SizedBox(height: 5),
              Text(
                text,
                style:
                    TextStyle(fontSize: 16, color: appColors.secondgreyColor),
              )
            ],
          ),
  );
}


//  im != null
//         ? Image.asset(im)
//         : 