import 'package:b_provider/screens/main_screens/category_mainPage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:b_provider/screens/wrapper.dart';
import 'package:b_provider/screens/widgets/category.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: CategoryMainPage(),
    );
  }
}
