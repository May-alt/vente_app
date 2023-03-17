import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Cachehelper {

  static late SharedPreferences sharedPreferences;

  static init() async{
    return sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value
  })
  async{
    if(value is String) return await sharedPreferences.setString(key, value);
    if(value is bool) return await sharedPreferences.setBool(key, value);
    if(value is double)return await sharedPreferences.setDouble(key,value);
    return await sharedPreferences.setInt(key,value);
  }

  static  getData({required  key})
  {
    return  sharedPreferences.get(key);
  }


  static removeData({required key})async
  {
    return await sharedPreferences.remove(key);}



}


