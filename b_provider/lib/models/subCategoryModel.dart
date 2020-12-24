import 'package:flutter/material.dart';

class SubCategoryModel{
  String listId;
      String categoryId;
  String name;
      String imageUrl;
  String description;
      double latitude;
  double longitude;
      String providerId;
  String providerName;
      int providerTel;
  double unitPrice;
      int units;
 DateTime date;


  SubCategoryModel(
  {
    @required this.listId,
    @required this.categoryId,
    @required this.name,
    @required  this.imageUrl,
    @required this.description,
    @required this.latitude,
    @required this.longitude,
    @required this.providerId,
    @required  this.providerName,
    @required this.providerTel,
    @required this.unitPrice,
    @required this.units,
   @required this.date,

  } );
  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryModel(
      listId: json['listId'] ?? '',
      categoryId: json['categoryId'] ?? '',
      name: json['Name'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      description: json['description'] ?? '',
      latitude: json['latitude'] ?? '',
      longitude: json['longitude'] ?? '',
      providerId: json['providerId'] ?? '',
      providerName: json['providerName'] ?? '',
      providerTel: json['providerTel'] ?? '',
      unitPrice: json['unitPrice'] ?? '',
      units: json['units'] ?? '',
      date: json['date'].toDate() ?? '',

    );

  }
//  Map<String, dynamic > toMap(){
//    return{
//
//      'Name':categoryName,
//      'imagePath':imagePath,
//      'imagePath':imagePath,
//      'imagePath':imagePath,
//      'imagePath':imagePath,
//      'imagePath':imagePath,
//      'imagePath':imagePath,
//      'imagePath':imagePath,
//      'imagePath':imagePath,
//      'imagePath':imagePath,
//
//    };
//  }
}