import 'package:flutter/material.dart';

//Packages
import 'package:timeago/timeago.dart' as timeago;
import 'package:true_list/sujith/Models/Constants.dart';

//Models
import '../models/chat_message.dart';

import 'package:sizer/sizer.dart';

class TextMessageBubble extends StatelessWidget {
  final bool isOwnMessage;
  final ChatMessage message;
  final double height;
  final double width;

  TextMessageBubble(
      {required this.isOwnMessage,
      required this.message,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    // List<Color> _colorScheme = isOwnMessage
    //     ? [Color.fromRGBO(0, 136, 249, 1.0), Color.fromRGBO(0, 82, 218, 1.0)]
    //     : [
    //         Color.fromRGBO(51, 49, 68, 1.0),
    //         Color.fromRGBO(51, 49, 68, 1.0),
    //       ];

    Color _colorScheme = isOwnMessage
        ? appBackGroundcolor
        : Colors.white;
    return Container(
      // height: height + (message.content.length / 20 * 6.0),
      //  width: width,
      constraints: BoxConstraints(
        maxWidth: 65.w,
      ),
      padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 3.w),
      margin: EdgeInsets.only(top: 2.h,right: 2.w),
      decoration: isOwnMessage?BoxDecoration(
        
        borderRadius: BorderRadius.only(
        topRight: Radius.circular(2.h),
        topLeft: Radius.circular(2.h),
        bottomLeft: Radius.circular(2.h),),
        color: _colorScheme,
         boxShadow: [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(0.0, 1.0), //(x,y)
          blurRadius: 6.0,
        ),
      ]
        // gradient: LinearGradient(
        //   colors: _colorScheme,
        //   stops: [0.30, 0.70],
        //   begin: Alignment.centerLeft,
        //   end: Alignment.centerRight,
        // ),
      ): BoxDecoration(
       color: Colors.white,
       borderRadius: BorderRadius.only(
        topRight: Radius.circular(2.h),
        topLeft: Radius.circular(2.h),
        bottomRight: Radius.circular(2.h),
       ),
       boxShadow: [
        BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
            ),
      ]
      ),
      child: Column(
        // mainAxisSize: MainAxisSize.max,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message.content,
            style: TextStyle(
              color: isOwnMessage?Colors.white:appBackGroundcolor,
              fontSize: 4.5.w,
              fontWeight: FontWeight.w400,
              // fontWeight: FontWeight.w600,
              // fontStyle: 'poppins',
            ),
          ),
         
          Container(
            padding: EdgeInsets.only(top: 2.h),
            child: Text(
              timeago.format(message.sentTime),
              style: TextStyle(
                color:  isOwnMessage?Colors.white:appBackGroundcolor,
                fontSize: 3.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageMessageBubble extends StatelessWidget {
  final bool isOwnMessage;
  final ChatMessage message;
  final double height;
  final double width;

  ImageMessageBubble(
      {required this.isOwnMessage,
      required this.message,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    // List<Color> _colorScheme = isOwnMessage
    //     ? [Color.fromRGBO(0, 136, 249, 1.0), Color.fromRGBO(0, 82, 218, 1.0)]
    //     : [
    //         Color.fromRGBO(51, 49, 68, 1.0),
    //         Color.fromRGBO(51, 49, 68, 1.0),
    //       ];
     Color _colorScheme = isOwnMessage
        ? appBackGroundcolor
        : Colors.white;
    DecorationImage _image = DecorationImage(
      image: NetworkImage(message.content),
      fit: BoxFit.cover,
    );
    return Container(
      // padding: EdgeInsets.symmetric(
      //   horizontal: width * 0.02,
      //   vertical: height * 0.03,
      // ),
      constraints: BoxConstraints(
        maxWidth: 55.w,
      ),
      padding: EdgeInsets.symmetric(horizontal: 1.w,vertical: 1.w),
      margin: EdgeInsets.only(top: 2.h,right:2.w),
       decoration: isOwnMessage?BoxDecoration(
        
        borderRadius: BorderRadius.only(
        topRight: Radius.circular(2.h),
        topLeft: Radius.circular(2.h),
        bottomLeft: Radius.circular(2.h),),
        color: _colorScheme,
         boxShadow: [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(0.0, 1.0), //(x,y)
          blurRadius: 6.0,
        ),
      ]
        // gradient: LinearGradient(
        //   colors: _colorScheme,
        //   stops: [0.30, 0.70],
        //   begin: Alignment.centerLeft,
        //   end: Alignment.centerRight,
        // ),
      ): BoxDecoration(
       color: Colors.white,
       borderRadius: BorderRadius.only(
        topRight: Radius.circular(2.h),
        topLeft: Radius.circular(2.h),
        bottomRight: Radius.circular(2.h),
       ),
       boxShadow: [
        BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
            ),
      ]
      ),

      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: _image,
            ),
          ),
          SizedBox(height: height * 0.02),
          Container(
            padding: EdgeInsets.only(left: 1.w),
            child: Text(
              timeago.format(message.sentTime),
              style: TextStyle(
                color: isOwnMessage?Colors.white:appBackGroundcolor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
