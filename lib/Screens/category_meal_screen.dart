import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Widgets/mealItem.dart';
import '../dummy_data.dart';

class CategoryMealScreen extends StatelessWidget {
  static const String routeName = "/meal-screen";
  // final String categoryID, categoryTitle;
  //
  // const CategoryMealScreen(
  //     {Key key, @required this.categoryID, @required this.categoryTitle})
  //     : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final filteredMeal = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: filteredMeal.length,
            itemBuilder: (context, index) {
              return MealItem(
                  title: filteredMeal[index].title,
                  imageUrl: filteredMeal[index].imageUrl,
                  duration: filteredMeal[index].duration,
                  complexity: filteredMeal[index].complexity,
                  affordability: filteredMeal[index].affordability);
            }),
      ),
    );
  }
}
