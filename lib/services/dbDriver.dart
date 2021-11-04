// ignore_for_file: file_names
import 'package:mongo_dart/mongo_dart.dart';

class DbDriver {
  String username;
  String password;
  String database;
  dynamic db;
  dynamic collec;

  DbDriver(this.username, this.password, this.database);

  Future<dynamic> createConnection() async {
    db = await Db.create(
        "mongodb+srv://$username:$password@swatsdata.rqel5.mongodb.net/$database?retryWrites=true&w=majority");
    await db.open();
  }

  Future<dynamic> setCollection(String coll) async {
    collec = db.collection('swatsCustomers');
  }

  Future<dynamic> findOneResult(String field) async {
    return await collec.findOne(where.eq("customerName", field));
  }
}
// var db = await Db.create(
    //     "mongodb+srv://$username:$password@swatsdata.rqel5.mongodb.net/$database?retryWrites=true&w=majority");
    // await db.open();