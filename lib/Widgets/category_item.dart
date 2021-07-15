import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Screens/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title, id;
  final Color color;

  const CategoryItem(
      {Key key, @required this.title, @required this.color, this.id})
      : super(key: key);
  void selectCategory(context) {
    Navigator.pushNamed(context, '/meal-screen',
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      highlightColor: Colors.red,
      onTap: () => selectCategory(context),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color.withOpacity(.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
