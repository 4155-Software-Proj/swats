// ignore_for_file: file_names
import 'package:mongo_dart/mongo_dart.dart';
import 'package:uuid/uuid.dart';

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

  static dynamic changeUserStatus(String userID) async {
    //Change user between disabeled and enabled

    bool activated;
    var user = await userCollection.find(where.eq('userID', userID)).toList();

    activated = user[0]['activated'];
    await userCollection.update(
        where.eq('userID', userID), modify.set('activated', !activated));
    return true;
  }

  static Future<List<Map<String, dynamic>>> getCustomers() async {
    //Gets all customers
    dynamic customers = await customerCollection.find().toList();
    return customers;
  }

  static void deleteCustomer(String customerAccountNumber) async {
    await customerCollection
        .deleteOne({"customerAccountNumber": customerAccountNumber});
  }

  static Future<List<Map<String, dynamic>>> getCustomerByAccountNumber(
      String accountNumber) async {
    //Gets all customers
    dynamic customer = await customerCollection
        .find(where.eq("customerAccountNumber", accountNumber))
        .toList();
    return customer;
  }

  static Future<List<Map<String, dynamic>>> getCustomersAccountAndName() async {
    //Gets all customers
    dynamic customers = await customerCollection
        .find(where.fields(['customerName', "customerAccountNumber"]))
        .toList();

    return customers;
  }

  static Future<List<Map<String, dynamic>>> getCustomersAccountAndNamePartial(
      String term) async {
    //Gets all customers

    await customerCollection.createIndex(
        keys: {'customerName': 'text', 'customerAccountNumber': 'text'});

    dynamic customers = await customerCollection.find({
      r'$text': {r'$search': term}
    }).toList();

    return customers;
  }

  

  static Future<List<Map<String, dynamic>>> getUser(String userID) async {
    //Find User by UserID
    dynamic user =
        await userCollection.find(where.eq('userID', userID)).toList();
    return user;
  }

  static void addUser(String firstName, String lastName, String userID, bool admin) async{
    await userCollection.insertOne({
      'userID' : userID,
      'firstName' : firstName,
      'lastName' : lastName,
      'dateCreated' : DateTime.now(),
      'userLevel' : [true,admin],
      'passwordSecure': "\$5\$exampleSalt\$WeYR0K/28Og6uYyzN5BjrmxGr/Xl8fF2c4aQgFBnb9B",
      'activated' : true
    });
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

  static Future<List<Map<String, dynamic>>> getOrdersByDocument(
      String documentNumber) async {
    dynamic order = await orderCollection
        .find(where..eq("documents", documentNumber))
        .toList();
    return order;
  }

  static void updateOrderCheckout(String orderID, List<int> signature) async {
    dynamic order = await orderCollection.update(
        where.eq("orderID", orderID), modify.set("signature", signature));

    order = await orderCollection.update(
        where.eq("orderID", orderID), modify.set("pickedUp", true));
  }

  static void insertOrder(List<String> documents, String customerAccountNumber,
      String binLocation) async {
    var uuid = Uuid();
    await orderCollection.insertOne({
      'documents': documents,
      'dateCreated': DateTime.now(),
      'binLocation': binLocation,
      'pickedUp': false,
      'customerAccountNumber': customerAccountNumber,
      'orderID': uuid.v1()
    });
  }

  static Future<List<Map<String, dynamic>>> getOverDueReport() async {
    print(DateTime.now().subtract(Duration(days: 30)));
    dynamic orders = await orderCollection
        .find(where
            .eq('pickedUp', false)
            .lt('dateCreated', DateTime.now().subtract(Duration(days: 29))))
        .toList();
    print(orders);
    return orders;
  }

  static dynamic insertCustomer(String customerName, String customerAccountNumber) async {
    await customerCollection.insertOne({
      'customerName': 'shit',
      'customerAccountNumber': 'fuck'
    });
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
