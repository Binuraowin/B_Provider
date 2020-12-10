
import 'package:b_provider/cofig/palette.dart';
import 'package:b_provider/models/categoryModel.dart';
import 'package:b_provider/screens/widgets/category_tile.dart';
import 'package:b_provider/services/database.dart';
import 'package:flutter/material.dart';

class CategoryMainPage extends StatefulWidget {
  @override
  _CategoryMainPageState createState() => _CategoryMainPageState();
}

class _CategoryMainPageState extends State<CategoryMainPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blue[100],
      body: Column(
            children: [
//              ListView(
//
//                children: <Widget>[
//                  Padding(
//                    padding: EdgeInsets.only(top: 15.0, left: 10.0),
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      children: <Widget>[
//
//                        Container(
//                          width: 125.0,
//                          child: Row(
//                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                            children: <Widget>[
//                              IconButton(
//                                  icon: Icon(Icons.people, ),
//                                  color: Colors.white,
//                                  onPressed: () async{
////                            await _auth.signOut();
//                                  }),
//                              IconButton(
//                                  icon: Icon(Icons.menu),
//                                  color: Colors.white,
//                                  onPressed: (){})
//                            ],
//                          ),
//                        )
//                      ],
//                    ),
//                  ),
//                  SizedBox(height: 10.0),
//                  Padding(padding: EdgeInsets.only(left: 40.0),
//                    child: Row(
//                      children: <Widget>[
//                        Text('BLabs',
//                          style: TextStyle(
//                              fontFamily: 'Monteserrat',
//                              color: Colors.white,
//                              fontWeight: FontWeight.bold,
//                              fontSize: 25.0
//                          ),
//                        ),
//                        SizedBox(width: 10.0,),
//                        Text('Finder',
//                          style: TextStyle(
//                              fontFamily: 'Monteserrat',
//                              color: Colors.white,
//
//                              fontSize: 25.0
//                          ),
//                        )
//                      ],
//                    ),
//                  ),
              Expanded(
                flex: 1,
                child: StreamBuilder<List<CategoryModel>>(
                  stream: DatabaseService().getCategories(),
                  builder: (context,snapshot){
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context,index){
                          return CategoryTile(
                            imagePath:snapshot.data[index].imagePath,
                            categoryName: snapshot.data[index].categoryName,

                          );

                        }
                    );
                  },
                ),
              )
            ],
          )
//          Container(
//              height:MediaQuery.of(context).size.height-130 ,
//              decoration: BoxDecoration(
//                  color: Colors.white,
//                  borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0), bottomRight: Radius.circular(60.0))
//              ),
//              child: ListView(
//                primary: false,
//                padding: EdgeInsets.only(left: 25.0, right: 20.0),
//                children: <Widget>[
//                  Padding(padding: EdgeInsets.only(top: 45.0),
//                    child: Container(
//                      height: MediaQuery.of(context).size.height -300.0,
//                      child: CategoryList(),
//                    ),
//                  ),
//
//                ],
//              )
//
//          )

        
      );










  }
}