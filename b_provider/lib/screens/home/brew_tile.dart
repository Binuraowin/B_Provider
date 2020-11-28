import 'package:b_provider/models/product.dart';
import 'package:b_provider/screens/home/details.dart';
import 'package:b_provider/services/database.dart';
import 'package:flutter/material.dart';
import 'package:b_provider/models/brew.dart';

class BrewTile extends StatelessWidget {
   
   final Product product;

  const BrewTile({Key key, this.product}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return 
    // Padding(
    //   padding: EdgeInsets.only(top:8.0),
    //   child:Card(
    //     margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
    //     child:ListTile(
    //       leading:CircleAvatar(
    //         radius:25,
    //         backgroundColor: Colors.white12,
            
    //         ),
    //       trailing:Text(brew.name,style: TextStyle( fontFamily: 'times-new-roman'),),
    //       title:Text(brew.sugars,style: TextStyle( fontFamily: 'times-new-roman'),),
    //       /*  isThreeLine: true, */
    //        subtitle: Text(brew.strength.toString(),style: TextStyle( fontFamily: 'times-new-roman'),),     

    //     )
    //   )
    // );


Padding(padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
  child: InkWell(
    onTap: (){
       
            Navigator.push(context,
            MaterialPageRoute(
        builder:(context) => Details(
            name:product.productName,sugars:product.shopName,strength:product.price
        )
         ),);
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
              product.productName,
              style: TextStyle(
                fontFamily: 'Monteserrat',
                fontSize: 17.0,
                fontWeight: FontWeight.bold
              ),
            ),
             Text(
              product.shopName,
              style: TextStyle(
                fontFamily: 'Monteserrat',
                fontSize: 15.0,
                color: Colors.grey
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