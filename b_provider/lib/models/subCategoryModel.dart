import 'package:flutter/material.dart';

class SubCategoryModel{
  final String listId;
  final String subCategoryName;
  final String imageUrl;
  final String description;
  final String providerId;
  final int providerTel;
  final String providerName;
  final int unitPrice;
  final int units;
  final int latitude;
  final int longitude;



  SubCategoryModel(
  {
    @required this.listId,
    @required this.subCategoryName,
    @required this.imageUrl,
    @required  this.description,
    @required this.providerId,
    @required this.providerTel,
    @required this.providerName,
    @required this.unitPrice,
    @required  this.units,
    @required this.latitude,
    @required this.longitude,

  } );
  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryModel(
      listId: json['listId'] ?? '',
      subCategoryName: json['Name'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      description: json['description'] ?? '',
      providerId: json['providerId'] ?? '',
      providerTel: json['providerTel'] ?? '',
      providerName: json['providerName'] ?? '',
      unitPrice: json['unitPrice'] ?? '',
      units: json['units'] ?? '',
      latitude: json['latitude'] ?? '',
      longitude: json['longitude'] ?? '',






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