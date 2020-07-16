import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  CategoryItem(this.id,this.title, this.color);

  void selectCategory(BuildContext context){
    Navigator.of(context).pushNamed(CategoryMealScreen.routeName,arguments: {
      'id':id,
      'title':title,
    });

  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(9),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Theme.of(context).primaryColor.withOpacity(0.7), Theme.of(context).primaryColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(9),

        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline2,
        ),
        padding: EdgeInsets.all(25),
      ),
    );
  }
}
