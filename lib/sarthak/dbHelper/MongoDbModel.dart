// To parse this JSON data, do
//
//     final mongoDbModel = mongoDbModelFromJson(jsonString);

import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

MongoDbModel mongoDbModelFromJson(String str) => MongoDbModel.fromJson(json.decode(str));

String mongoDbModelToJson(MongoDbModel data) => json.encode(data.toJson());

class MongoDbModel {
  MongoDbModel({
    required this.id,
    required this.messageContent,
    required this.messageType,
    this.imageUrl
  });

  ObjectId id;
  String messageContent;
  String messageType;
  String? imageUrl;

  factory MongoDbModel.fromJson(Map<String, dynamic> json) => MongoDbModel(
    id: json["id"],
    messageContent: json["messageContent"],
    messageType: json["messageType"],
    imageUrl: json["imageUrl"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "messageContent": messageContent,
    "messageType": messageType,
    "imageUrl" : imageUrl
  };
}
