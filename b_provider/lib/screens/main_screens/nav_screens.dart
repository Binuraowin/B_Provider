import 'package:b_provider/main.dart';
import 'package:b_provider/screens/main_screens/ProductScreen.dart';
import 'package:b_provider/screens/main_screens/map.dart';
import 'package:b_provider/screens/main_screens/mapsnext.dart';
import 'package:b_provider/screens/main_screens/addList.dart';
import 'package:b_provider/screens/main_screens/profilePage.dart';
import 'package:b_provider/screens/main_screens/subCategoryPage.dart';
import 'package:b_provider/screens/widgets/custom_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';




class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    ProductPage(),
    AddList(),
    ProfilePage(imageurl: 'https://firebasestorage.googleapis.com/v0/b/bookstore-81666.appspot.com/o/postImage%2Fimage12020-12-24%2014%3A45%3A44.792840?alt=media&token=6e0fc6e5-7808-4b8c-bbf2-993edf1204dd',
    shopName: 'BShop',
      phNumber: 0112456678,
      coins: 3,
    ),

  ];
  final List<IconData> _icons = const [
//    Icons.flag,

    Icons.home,
    MdiIcons.plus,
    Icons.people,


  ];

//  final List<Color> _colors = const[
//    Colors.red,
//    Colors.blue,
//    Colors.green,
//    Colors.purple,
//    Colors.purple
//  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        // body: _screens[_selectedIndex],
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.only(bottom: 12.0),
          color: Colors.white,
          child: CustomTabBar(
            icons: _icons,

            selectedIndex: _selectedIndex,
            onTap: (index) => setState(() => _selectedIndex = index),
          ),
        ),
      ),
    );

  }
}