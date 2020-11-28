
import 'package:b_provider/models/authUser.dart';
import 'package:b_provider/screens/authenticate/authenticate.dart';
import 'package:b_provider/screens/home/category.dart';
import 'package:b_provider/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final authuser = Provider.of<AuthUser>(context);
   if(authuser == null){
     return Authenticate();
   }else{
     return CategoryPage();
   }
    
  }
}