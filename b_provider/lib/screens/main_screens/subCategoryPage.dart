import 'package:b_provider/cofig/palette.dart';
import 'package:b_provider/models/subCategoryModel.dart';
import 'package:b_provider/screens/widgets/sub_category_tile.dart';
import 'package:b_provider/services/database.dart';
import 'package:flutter/material.dart';

class SubCategoryPage extends StatefulWidget {
//  final String id;
//
//  const SubCategoryPage({Key key, this.id}) : super(key: key);
  @override
  _SubCategoryPageState createState() => _SubCategoryPageState();
}

class _SubCategoryPageState extends State<SubCategoryPage> {
//  final String id;
//
//  _SubCategoryPageState(this.id);
String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Column(
          children: [

            Expanded(
              flex: 1,
              child: StreamBuilder<List<SubCategoryModel>>(
//                stream: DatabaseService().getSubCategoriesById(id),
                builder: (context, snapshot) {
                  return ListView.builder(
                      itemCount: snapshot.data==null?0:snapshot.data.length,
                      itemBuilder: (context, index) {
                        return SubCategoryTile(
                        imageUrl: snapshot.data[index].imageUrl,
                          subCategoryName: snapshot.data[index].name,
                        );
                      }
                  );
                },
              ),
            )
          ],
        )



    );





  }
}
