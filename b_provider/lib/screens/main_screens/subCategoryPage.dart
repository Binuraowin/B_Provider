import 'package:b_provider/cofig/palette.dart';
import 'package:b_provider/models/subCategoryModel.dart';
import 'package:b_provider/screens/widgets/sub_category_tile.dart';
import 'package:b_provider/services/database.dart';
import 'package:flutter/material.dart';

class SubCategoryPage extends StatefulWidget {
  final String id;

  const SubCategoryPage({Key key, this.id}) : super(key: key);
  @override
  _SubCategoryPageState createState() => _SubCategoryPageState(id);
}

class _SubCategoryPageState extends State<SubCategoryPage> {
  final String id;

  _SubCategoryPageState(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios,
              color: Palette.facebookBlue,
            ),
            onPressed: (){
              Navigator.of(context).pop();
            }),
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        title: Text(
          'Products',
          style: const TextStyle(
            color:Colors.lightBlueAccent,

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
              stream: DatabaseService().getSubCategories(id),
              builder: (context, snapshot) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return SubCategoryTile(
                        imageUrl: snapshot.data[index].imageUrl,
                        subCategoryName: snapshot.data[index].subCategoryName,
                      );
                    }
                );
              },
            ),
          )
        ],
      ),


    );
  }
  }
