import 'dart:convert';

import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:api_cache_manager/utils/cache_manager.dart';
import 'package:flutter/cupertino.dart';

import '../models/login_response_model.dart';

class SharedService {
  static Future<bool> isLoggedIn () async{
    var isKeyExist = await APICacheManager().isAPICacheKeyExist("login_details");

    return isKeyExist;
  }
static Future<login_response_model?> loginDetails() async{
    var isKeyExist = await APICacheManager().isAPICacheKeyExist("login_details");
    if(isKeyExist){
      var cacheData = await APICacheManager().getCacheData("login _details");
      return loginResponseJson(cacheData.syncData);

    }
}
 static Future<void> setLoginDetails(login_response_model model,) async{
    APICacheDBModel cacheDBModel = APICacheDBModel(
        key: "login_details",
        syncData: jsonEncode(model.toJson()));
    await APICacheManager().addCacheData(cacheDBModel);
 }

static Future<void> logout(BuildContext context) async{
    await APICacheManager().deleteCache("login_details");
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
    
}
}