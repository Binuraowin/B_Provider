import 'package:flutter/material.dart';

class Product {
final String address;
final String description;
final int price;
final String productName;
final String shopName;

  Product({
    @required this.address, 
    @required this.description, 
    @required this.price, 
    @required this.productName, 
    @required this.shopName});

}