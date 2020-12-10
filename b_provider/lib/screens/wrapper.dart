
import 'package:b_provider/models/authUser.dart';
import 'package:b_provider/screens/authenticate/authenticate.dart';
import 'package:b_provider/screens/main_screens/category_mainPage.dart';
import 'package:b_provider/screens/widgets//category.dart';
import 'package:b_provider/screens/widgets//home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {

    final authuser = Provider.of<AuthUser>(context);
   if(authuser == null){
     return Authenticate();
   }else{
     return CategoryMainPage();
   }

  }
}