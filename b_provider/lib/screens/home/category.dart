import 'package:b_provider/models/categoryModel.dart';
import 'package:b_provider/screens/home/category_list.dart';
import 'package:b_provider/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:b_provider/services/database.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final AuthService _auth = AuthService();
  CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<CategoryModel>>.value(
      value:DatabaseService().category,
          child: Scaffold(
     backgroundColor: Colors.blue[100],
      body:ListView(
        
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
            //         IconButton(
            // icon: Icon(Icons.arrow_back_ios), 
            // color: Colors.white,
            // onPressed: () {
              
            // }),
          Container(
            width: 125.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
               IconButton(
                  icon: Icon(Icons.people, ),
                  color: Colors.white,    
                  onPressed: () async{
                    await _auth.signOut();
                  }),
                   IconButton(
                  icon: Icon(Icons.menu), 
                  color: Colors.white,
                  onPressed: (){})
              ],
            ),
          )
              ],
            ),
            ),
            SizedBox(height: 10.0),
            Padding(padding: EdgeInsets.only(left: 40.0),
            child: Row(
              children: <Widget>[
                Text('BLabs',
                style: TextStyle(
                  fontFamily: 'Monteserrat',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0
                ),
                ),
                SizedBox(width: 10.0,),
                Text('Finder',
                style: TextStyle(
                  fontFamily: 'Monteserrat',
                  color: Colors.white,
                  
                  fontSize: 25.0
                ),
                )
              ],
            ),
            ),
            SizedBox(height: 20.0),
            Container(
              height:MediaQuery.of(context).size.height-130 ,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0), bottomRight: Radius.circular(60.0))
              ),
              child: ListView(
                primary: false,
                padding: EdgeInsets.only(left: 25.0, right: 20.0),
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 45.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height -300.0,
                    child: CategoryList(),
                  ),
                  ),
                  // SizedBox(height: 50.0,),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: <Widget>[
                  //     Container(
                  //       height: 65.0,
                  //       width: 60.0,
                  //       decoration: BoxDecoration(
                  //         border: Border.all(
                  //           color:Colors.grey,
                  //           style: BorderStyle.solid,
                  //           width:1.0
                  //         ),
                  //         borderRadius: BorderRadius.circular(20.0)
                  //       ),
                  //       child: Center(
                  //         child: Icon(Icons.search, color:Colors.black ),
                  //       ),
                  //     ),
                  //      Container(
                  //       height: 65.0,
                  //       width: 60.0,
                  //       decoration: BoxDecoration(
                  //         border: Border.all(
                  //           color:Colors.grey,
                  //           style: BorderStyle.solid,
                  //           width:1.0
                  //         ),
                  //         borderRadius: BorderRadius.circular(20.0)
                  //       ),
                  //       child: Center(
                  //         child: Icon(Icons.shopping_cart, color:Colors.black),
                  //       ),
                  //     ),
                  //      Container(
                  //       height: 65.0,
                  //       width: 100.0,
                        
                  //       decoration: BoxDecoration(
                  //         border: Border.all(
                  //           color:Colors.grey,
                  //           style: BorderStyle.solid,
                  //           width:1.0
                  //         ),
                  //         borderRadius: BorderRadius.circular(20.0),
                  //         color: Colors.black,
                          
                  //       ),
                  //       child: Center(
                  //         child: Text('Checkout',
                  //         style: TextStyle(
                            
                  //           color: Colors.white
                  //         ),
                  //         ),
                          
                  //       ),
                  //     ),
                  //   ],
                  // )
                ],
              )
              
            )
      
        ],
      ),
    )
    );
}
}