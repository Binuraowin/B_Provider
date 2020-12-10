import 'package:flutter/material.dart';

class CategoryModel {
final String categoryName;
final String imagePath;
final String id;


  CategoryModel({
    @required this.imagePath,
    @required this.categoryName,
    @required this.id,
    });
factory CategoryModel.fromJson(Map<String, dynamic> json) {
  return CategoryModel(

    categoryName: json['Name'] ?? '',
    imagePath: json['imagePath'] ?? '',
    id: json['Id'] ?? '',


  );

}
//Map<String, dynamic > toMap(){
//  return{
//
//    'Name':categoryName,
//    'imagePath':imagePath,
//
//  };
//}
}