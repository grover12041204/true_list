import 'package:mongo_dart/mongo_dart.dart';
import 'package:true_list/sarthak/dbHelper/MongoDbModel.dart';
import 'package:true_list/sarthak/dbHelper/constant.dart';

class MongoDatabase {
  static var db, userCollection;
  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    userCollection = db.collection(USER_COLLECTION);
  }

  static Future<String> insert(MongoDbModel data) async {
    try {
      var result = await userCollection.insertOne(data.toJson());
      if (result.isSuccess) {
        return "Data Inserted";
      } else {
        return "Something Went Wrong";
      }
      return result;
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }

  static Future<String> insertMultiple(List<MongoDbModel> data) async {
    try {
      print("Data: $data");

      // for(int i = 0 ; i < data.length ; i++)
      //   {
      //     data[i] = data[i]
      //   }
      // final List<MongoDbModel> data_final = data.map((element) {return element.toJson();});
      // print("Final Data: $data_final");
      var result = await userCollection.insertMany(data.map((e) {
        return e.toJson();
      }).toList());
      if (result.isSuccess) {
        return "Data Inserted";
      } else {
        return "Something Went Wrong";
      }
      return result;
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }
}
