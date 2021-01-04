import 'package:b_provider/screens/main_screens/category_mainPage.dart';
import 'package:b_provider/screens/main_screens/map.dart';
import 'package:b_provider/screens/main_screens/mapsnext.dart';
import 'package:b_provider/screens/main_screens/nav_screens.dart';
import 'package:b_provider/services/auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:b_provider/screens/wrapper.dart';
import 'package:b_provider/screens/widgets/category.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';

import 'models/authUser.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SplashScreenPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: new HomeWrapper(),
      backgroundColor: Colors.blue[100],
      title: new Text('  ',textScaleFactor: 2,),
      image: Image.asset('image/finderlogo.png'),
      loadingText: Text("Loading"),
      photoSize: 150.0,
      loaderColor: Colors.blue[700],
    );
  }
}

class HomeWrapper extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<AuthUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
