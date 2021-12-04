// ignore_for_file: file_names
import 'package:mongo_dart/mongo_dart.dart';

class DbDriver {
  static dynamic db;
  static dynamic userCollection;
  static dynamic orderCollection;
  static dynamic customerCollection;

  static connect() async {
    //Creates Connection to DB ran in main.dart
    db = await Db.create(
        "mongodb+srv://dbUser:yYZWdT3QnPIedGNg@swatsdata.rqel5.mongodb.net/swats?retryWrites=true&w=majority");
    await db.open();
    userCollection = db.collection('swatsUsers'); //Assigns userCollection
    customerCollection =
        db.collection('swatsCustomers'); //Assigns customerCollection

    orderCollection = db.collection('swatsOrders');
  }

  static Future<List<Map<String, dynamic>>> getUsers() async {
    //Gets all users
    dynamic users = await userCollection.find().toList();
    return users;
  }

  static Future<List<Map<String, dynamic>>> getCustomers() async {
    //Gets all customers
    dynamic customers = await customerCollection.find().toList();
    return customers;
  }

  static Future<List<Map<String, dynamic>>> getUser(String userID) async {
    //Find User by UserID
    dynamic user =
        await userCollection.find(where.eq('userID', userID)).toList();
    return user;
  }

  // static Future<List<Map<String, dynamic>>> getCustomer(
  //   //var lst = [{"returnValue" : "None"}];
  //     {String customerID = "none", String customerName = "none"}) async {
  //   if (customerID == "none") {
  //   } else if (customerName == "none") {
  //   } else {
  //     return
  //   }
  // } //Find Customer by name or customerID

  static Future<List<Map<String, dynamic>>> getOrder(String orderID) async {
    dynamic order =
        await orderCollection.find(where.eq('orderID', orderID)).toList();

    return order;
  }

  static Future<List<Map<String, dynamic>>> getOrdersByCustomer(
      String customerAccountNumber) async {
    dynamic order = await orderCollection
        .find(where.eq('customerAccountNumber', customerAccountNumber))
        .toList();
    return order;
  }

  // String username;
  // String password;
  // String database;
  // dynamic db;
  // dynamic collec;

  // DbDriver(this.username, this.password, this.database);

  // Future<dynamic> createConnection() async {
  //   db = await Db.create(
  //       "mongodb+srv://$username:$password@swatsdata.rqel5.mongodb.net/$database?retryWrites=true&w=majority");
  //   await db.open();
  // }

  // Future<dynamic> setCollection(String coll) async {
  //   collec = db.collection('swatsCustomers');
  // }

  // Future<dynamic> findOneResult(String field) async {
  //   return await collec.findOne(where.eq("customerName", field));
  // }
}
// var db = await Db.create(
//     "mongodb+srv://$username:$password@swatsdata.rqel5.mongodb.net/$database?retryWrites=true&w=majority");
// await db.open();
//test
