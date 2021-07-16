import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Models/meal.dart';
import 'package:flutter_complete_guide/Widgets/mealItem.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({Key key, this.favoriteMeals}) : super(key: key);
  final List<Meal> favoriteMeals;

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Text("You have no favorites yet - Start adding some");
    } else {
      return ListView.builder(
          itemCount: favoriteMeals.length,
          itemBuilder: (context, index) {
            return MealItem(
                id: favoriteMeals[index].id,
                title: favoriteMeals[index].title,
                imageUrl: favoriteMeals[index].imageUrl,
                duration: favoriteMeals[index].duration,
                complexity: favoriteMeals[index].complexity,
                affordability: favoriteMeals[index].affordability);
          });
    }
  }
}
