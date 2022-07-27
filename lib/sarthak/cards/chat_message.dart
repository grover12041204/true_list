import 'dart:io';

import 'package:flutter/material.dart';

class ChatMessage{
  String messageContent;
  String messageType;
  // File? image;
  File? image;
  ChatMessage({required this.messageContent, required this.messageType,this.image});

  Map<String, dynamic> toJson() => {
    "messageContent": messageContent,
    "messageType": messageType,
    "image" : image
  };

}