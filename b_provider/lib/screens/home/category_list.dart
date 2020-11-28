import 'package:b_provider/models/categoryModel.dart';
import 'package:b_provider/screens/home/category_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
        final category = Provider.of<List<CategoryModel>>(context) ?? [];
        return ListView.builder(
      itemCount: category.length,
      itemBuilder: (context, index) {
        return CategoryTile(categoryModel: category[index]);
      },
    );
  }
}