import 'package:mongo_dart/mongo_dart.dart';

class User {
  final ObjectId id;
  final int phone;
  final String password;

  const User({required this.id,required this.phone,required this.password});

}