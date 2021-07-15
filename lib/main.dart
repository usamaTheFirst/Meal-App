import 'package:flutter/material.dart';

import 'categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(205, 234, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(
                  20,
                  51,
                  51,
                  1,
                ),
                fontSize: 19,
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: 'RobotoCondensed',
              ),
            ),

        // scaffoldBackgroundColor: const Color(0xFFEFEFEF),
      ),
      home: CategoriesScreen(),
    );
  }
}
