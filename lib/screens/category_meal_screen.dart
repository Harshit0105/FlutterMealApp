import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = 'category-meals';
  final List<Meal> currentMeal;
  CategoryMealScreen(this.currentMeal);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String categoryId;
  String title;
  List<Meal> categoryMeal;
  var loadedItem=false;

  @override
  void didChangeDependencies() {
    if(!loadedItem) {
      final routeArg =
      ModalRoute
          .of(context)
          .settings
          .arguments as Map<String, String>;
      categoryId = routeArg['id'];
      title = routeArg['title'];
      categoryMeal = widget.currentMeal.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      loadedItem=true;
    }
    super.didChangeDependencies();
  }

  void _removeItem(String id)
  {
    setState(() {
      categoryMeal.removeWhere((element) => element.id==id);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: categoryMeal[index].id,
              title: categoryMeal[index].title,
              imageUrl: categoryMeal[index].imageUrl,
              affordability: categoryMeal[index].affordability,
              complexity: categoryMeal[index].complexity,
              duration: categoryMeal[index].duration,

            );
          },
          itemCount: categoryMeal.length,
        ));
  }
}
