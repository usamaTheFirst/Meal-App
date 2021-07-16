import 'package:flutter/material.dart';

enum Complexity {
  Simple,
  Challenging,
  Hard,
}

extension CompExtension on Complexity {
  get value {
    switch (this) {
      case Complexity.Hard:
        return 'Hard';
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
    }
  }
}

enum Affordability { Affordable, Pricey, Luxurious }

extension AffordExtension on Affordability {
  String get value {
    switch (this) {
      case Affordability.Affordable:
        return "Affordable";
      case Affordability.Luxurious:
        return "Luxurious";
      case Affordability.Pricey:
        return "Pricey";
      default:
        return 'Unknown';
    }
  }
}

class Meal {
  final String id, title, imageUrl;
  final List<String> categories, ingredients, steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree, isVegan, isLactoseFree, isVegetarian;
  const Meal(
      {@required this.id,
      @required this.title,
      @required this.imageUrl,
      @required this.categories,
      @required this.ingredients,
      @required this.steps,
      @required this.duration,
      @required this.complexity,
      @required this.affordability,
      @required this.isGlutenFree,
      @required this.isVegan,
      @required this.isLactoseFree,
      @required this.isVegetarian});
}
