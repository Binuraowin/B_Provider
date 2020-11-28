import 'package:b_provider/models/categoryModel.dart';
import 'package:b_provider/screens/home/home.dart';
import 'package:b_provider/services/database.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final CategoryModel categoryModel;
  

  const CategoryTile({Key key, this.categoryModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
  child: InkWell(
    onTap: (){
      DatabaseService().category;
           Navigator.push(context,
            MaterialPageRoute(
        builder:(context) => Home(
           
        )
         ),);
       
        //     Navigator.push(context,
        //     MaterialPageRoute(
        // builder:(context) => Details(
        //     name:brew.name,sugars:brew.strength,strength:brew.strength
        // )
        //  ),);
              // Navigator.pushNamed(context, '/');
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          child: Row(
            children: <Widget>[
              
        //       Hero(tag: imgPath,
        // child: Image(image: AssetImage(imgPath),
        // fit: BoxFit.cover,
        // height: 75.0,
        // width: 75.0,
        // ),
        // ),
        SizedBox(width: 10.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              categoryModel.name,
              style: TextStyle(
                fontFamily: 'Monteserrat',
                fontSize: 17.0,
                fontWeight: FontWeight.bold
              ),
            )
         
          ],
        )
            ],
          
          )
        ),
        IconButton(
      icon: Icon(Icons.send),
      color: Colors.black,
      onPressed: (){
       
      },
    )
      ],
    ),
    
  ),
    );
  }
}