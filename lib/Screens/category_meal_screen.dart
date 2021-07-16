import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Models/meal.dart';
import 'package:flutter_complete_guide/Widgets/mealItem.dart';

class CategoryMealScreen extends StatefulWidget {
  static const String routeName = "/meal-screen";
  final List<Meal> availableMeals;

  const CategoryMealScreen({Key key, this.availableMeals}) : super(key: key);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String categoryTitle;
  List<Meal> filteredMeal;

  @override
  void initState() {
    //Things related to of(context) dont work in here.
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map;
    categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    filteredMeal = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String mealID) {
    setState(() {
      filteredMeal.removeWhere((element) {
        return mealID == element.id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: filteredMeal.length,
            itemBuilder: (context, index) {
              return MealItem(
                  id: filteredMeal[index].id,
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
