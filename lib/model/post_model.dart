
import 'package:flutter/material.dart';

class PostModel{
  String? uId;
  String? name;
  String? imgProfile;
  String? Postimage;
  String? title;
  String? Price;
  String? desc;

  PostModel({
    this.Postimage,
    this.name,
    this.title,
    this.imgProfile,
    this.Price,
    this.uId,
    this.desc,
});

  PostModel.fromJson(dynamic json){
    uId = json['uId'];
    name = json['name'];
    imgProfile = json['imgProfile'];
    Postimage = json['Postimage'];
    title = json['title'];
    Price = json['Price'];
    desc = json['desc'];
}

  Map<String, dynamic> ToMap(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['uId'] = this.uId;
    data['imgProfile'] = this.imgProfile;
    data['Postimage'] = this.Postimage;
    data['title'] = this.title;
    data['Price'] = this.Price;
    data['desc'] = this.desc;
    return data;
  }

}