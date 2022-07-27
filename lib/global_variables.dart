import 'dart:core';

import 'package:image_picker/image_picker.dart';

List<XFile>? globla_images = [];

List<double> latitudeList = [];
List<double> LongitudeList = [];
List<String> locationString = [];
List<bool> postFinishPremiumLocaion = [];

String? postGlobalCategory;
String? postMainCategory;
bool postGlobalValue = false;
String? globalPhoneNumber;

// Map<dynamic, dynamic> postGloblaData = {
//   'image': [],
//   'imageTitle': '',
//   'category': '',
//   'subcategory': [],
//   'fields': [],
//   'specailMentions': '',
//   'description': '',
//   'Price': '',
//   'priceNegotiable': '',
//   'defaultLocation': [],
//   'otherLocation': [],
//   'premiumLocation': []
// };

// class PostData() {
// List image = [];
//   String imageTitle =  '',
//   String category = '',
//   List 'subcategory': [],
//   List 'fields': [],
//  String 'specailMentions': '',
// String  'description': '',
// String  'Price': '',
//  String 'priceNegotiable': '',
//  List 'defaultLocation': [],
//  List 'otherLocation': [],
//  List 'premiumLocation': []
// };

class PostGlobalData {
  static List image = [];
  static String imageTitle = '';
  static String category = '';
  static String subcategory = '';
  static List fields = [];
  static List specailMentions = [];
  static String description = '';
  static String price = '';
  static String priceNegotiable = '';
  static List defaultLocation = [];
  static List otherLatLocation = [];
  static List otherLongLocation = [];
  static List locationName = [];
  static List premiumLocation = [];
  static String date = '';
  static List locationArray = [];
  static List fieldsArray = [];
  static List adPostLocations = [];
}

String globalToken = '';
String mongoId = '62da4e22f1dd7b4074c60815';
late bool userExistingMongo;
var globalPremiumadData;
var globalGetHomeScreen;
