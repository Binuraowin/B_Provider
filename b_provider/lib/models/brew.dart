import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Brew {

  final String name;
  final String sugars;
  final int strength;
 final DocumentReference reference;

  Brew(
   { @required this.name, 
    @required this.sugars, 
    @required this.strength, 
    @required this.reference}
    );

  

}