import 'package:flutter/material.dart';

class CategoryMealScreen extends StatelessWidget {
  final String categoryID, categoryTitle;

  const CategoryMealScreen(
      {Key key, @required this.categoryID, @required this.categoryTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("The Recipe"),
      ),
      body: Center(
        child: Text('The recipes for categories'),
      ),
    );
  }
}
