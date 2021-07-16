import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Screens/category_meal_screen.dart';
import 'package:flutter_complete_guide/Screens/filters_screen.dart';
import 'package:flutter_complete_guide/Screens/meal_detail_screen.dart';
import 'package:flutter_complete_guide/Screens/tabScreens.dart';

import 'Models/meal.dart';
import 'Screens/categories_screen.dart';
import 'dummy_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void _toggleFavorites(String mealID) {
    final existingIndex = favoriteMeals.indexWhere((meal) => meal.id == mealID);
    if (existingIndex >= 0) {
      setState(() {
        favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) {
          return mealID == meal.id;
        }));
      });
    }
  }

  bool isMealFavorite(String id) {
    return favoriteMeals.any((element) {
      return element.id == id;
    });
  }

  Map<String, bool> filers = {
    'lactose': false,
    'gluten': false,
    'vegan': false,
    'vegetarian': false
  };
  List<Meal> availableMeal = DUMMY_MEALS;
  List<Meal> favoriteMeals = [];
  _setFilters(Map<String, bool> filterData) {
    setState(() {
      filers = filterData;
      availableMeal = DUMMY_MEALS.where((meal) {
        if (filers['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (filers['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (filers['vegan'] && !meal.isVegan) {
          return false;
        }
        if (filers['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

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
      routes: {
        '/': (_) => TabScreen(
              favoriteMeals: favoriteMeals,
            ),
        CategoryMealScreen.routeName: (_) => CategoryMealScreen(
              availableMeals: availableMeal,
            ),
        MealDetailScreen.routeName: (_) => MealDetailScreen(
            toggleFunction: _toggleFavorites, isFavorite: isMealFavorite),
        FilterScreen.routeName: (_) => FilterScreen(
              filterFunction: _setFilters,
              currentFilters: filers,
            )
      },
      // home: CategoriesScreen(),
      initialRoute: '/',
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      },
    );
  }
}
