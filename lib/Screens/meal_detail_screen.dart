import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = 'DetailScreen';
  const MealDetailScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var routeArgs = ModalRoute.of(context).settings.arguments as Map;
    var filteredStuff = DUMMY_MEALS.where((element) {
      return element.id == routeArgs['id'];
    }).toList()[0];
    return Scaffold(
      appBar: AppBar(
        title: Text(filteredStuff.title),
      ),
      body: Center(
        child: Text(filteredStuff.title),
      ),
    );
  }
}
