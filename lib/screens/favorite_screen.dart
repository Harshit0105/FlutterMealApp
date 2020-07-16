import 'package:MealApp/models/meal.dart';
import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> _favoriteMeal;

  FavoriteScreen(this._favoriteMeal);

  @override
  Widget build(BuildContext context) {
    if (_favoriteMeal.isEmpty) {
      return Center(
        child: Text("You have no favorite item yet..."),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: _favoriteMeal[index].id,
            title: _favoriteMeal[index].title,
            imageUrl: _favoriteMeal[index].imageUrl,
            affordability: _favoriteMeal[index].affordability,
            complexity: _favoriteMeal[index].complexity,
            duration: _favoriteMeal[index].duration,
          );
        },
        itemCount: _favoriteMeal.length,
      );
    }
  }
}
