

import 'package:b_provider/models/subCategoryModel.dart';
import 'package:b_provider/screens/widgets/categoryContainer.dart';
import 'package:b_provider/services/database.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  final String clubName;

  const ProductPage({Key key, this.clubName}) : super(key: key);
  @override
  _ProductPageState createState() => _ProductPageState(clubName);
}

class _ProductPageState extends State<ProductPage> {
  final String clubName;

  _ProductPageState(this.clubName);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios,
                color: Colors.blue,
              ),
              onPressed: (){
                Navigator.of(context).pop();
              }),
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          title: Text(
            'Events',
            style: const TextStyle(
              color:Colors.blue,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2,
            ),
          ),
        ) ,

        body: Column(
          children: [
           
            Expanded(
              flex: 1,
              child: StreamBuilder<List<SubCategoryModel>>(
                stream: DatabaseService().getSubCategoriesById('ggg'),
                builder: (context,snapshot){
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context,index){
                        return categoryContainer(
                          caption: snapshot.data[index].name,
                          imageUrl: snapshot.data[index].imageUrl,
                          date:snapshot.data[index].date,

                        );
                      }
                  );
                },
              ),
            )
          ],
        ));
  }
}
