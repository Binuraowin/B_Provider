import 'package:flutter/material.dart';

class CategoryModel {
final String categoryName;
final String imagePath;


  CategoryModel({
    @required this.imagePath,
    @required this.categoryName,
    });
factory CategoryModel.fromJson(Map<String, dynamic> json) {
  return CategoryModel(

    categoryName: json['Name'] ?? '',
    imagePath: json['imagePath'] ?? '',


  );

}
Map<String, dynamic > toMap(){
  return{

    'Name':categoryName,
    'imagePath':imagePath,

  };
}
}