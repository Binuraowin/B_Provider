import 'package:b_provider/screens/main_screens/subCategoryPage.dart';
import 'package:flutter/material.dart';

class SubCategory extends StatefulWidget {
  final String id;

  const SubCategory({Key key, this.id}) : super(key: key);
  @override
  _SubCategoryState createState() => _SubCategoryState(id);
}

class _SubCategoryState extends State<SubCategory> {
  final String id;

  _SubCategoryState(this.id);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body:ListView(

        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                Container(
                  width: 125.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.people, ),
                          color: Colors.white,
                          onPressed: () async{
//                    await _auth.signOut();
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
                      child: SubCategoryPage(),
                    ),
                  ),

                ],
              )

          )

        ],
      ),
    );

  }
}