import 'dart:async';

import 'package:mongo_dart/mongo_dart.dart';

import 'models/login_model.dart';


 class database {
  static get userCollection => null;

   connect() async {
     var db = await Db.create(
         'mongodb+srv://erwiniproject:erwiniagriculture@erwini.ixe36fr.mongodb.net/ERWINI');
     await db.open();
     var userCollection = db.collection('users');
   }

   static insert(User user) async {
     await userCollection.insertAll([user.toString()]);
   }

  static Future<String> getDocuments() async {
    try {
      final users = await userCollection.find().toList();
      return users;
    } catch (e) {
      print(e);
      return Future.value(e as FutureOr<String>?);
    }
  }

  static update(User user) async {
    var u = await userCollection.findOne({"_id": user.id});
    u["phone"] = user.phone;
    u["password"] = user.password;
    await userCollection.save(u);
  }

 }
