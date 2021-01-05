import 'package:flutter/material.dart';

class regUser{
  final String name;
  final String uid;
  final String shopName;
  final int phoneNumner;
  final int coins;
  final String imageurl;
  final int lists;

  regUser(
      {
        @required this.name,
        @required this.uid,
        @required this.shopName,
        @required  this.phoneNumner,
        @required this.coins,
        @required this.imageurl,
        @required this.lists,

      } );

  factory regUser.fromJson(Map<String, dynamic> json) {
    return regUser(
      name: json['name'] ?? '',
      uid: json['uid'] ?? '',
      shopName: json['shopName'] ?? '',
      phoneNumner: json['phoneNumner'] ?? '',
      coins: json['coins'] ?? '',
      imageurl: json['imageurl'] ?? '',
      lists: json['lists'] ?? '',

    );

  }
}