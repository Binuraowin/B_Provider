

import 'package:b_provider/models/categoryModel.dart';
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
  String id ;
  int selectedIndex = 0;

  _ProductPageState(this.clubName);
  @override
  Widget build(BuildContext context) {
    return Scaffold(


        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.0,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: SizedBox(
                height: 25,
                child:StreamBuilder<List<CategoryModel>>(
                  stream: DatabaseService().getCategories(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => buildCategory(
                            index,
                            snapshot.data[index].categoryName,
                            snapshot.data[index].id
                        )
                    );
                  },
                ),



              ),
            ),
           
            Expanded(
              flex: 1,
              child: StreamBuilder<List<SubCategoryModel>>(
                stream: DatabaseService().getSubCategoriesById('providerId',id),
                builder: (context,snapshot){
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context,index){
                        return categoryContainer(
                          caption: snapshot.data[index].name,
                          imageUrl: snapshot.data[index].imageUrl,
                          clubName: snapshot.data[index].name,
                          date:snapshot.data[index].date,
                          postId: snapshot.data[index].listId,
                          categoryId: snapshot.data[index].categoryId,

                        );
                      }
                  );
                },
              ),
            )
          ],
        ));
  }

  Widget buildCategory(int index,String categoryName,String catId) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
          id= catId;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              categoryName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selectedIndex == index ?  Color(0xFF535353) : Color(0xFF535353),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20 / 4), //top padding 5
              height: 2,
              width: 30,
              color: selectedIndex == index ? Colors.black : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
