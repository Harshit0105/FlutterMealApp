import 'package:flutter/material.dart';

import './screens/tabs_screen.dart';
import './screens/category_meal_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/filters_screen.dart';
import './models/meal.dart';
import './dummy_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyAppStateful(),
    );
  }
}

class MyAppStateful extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyAppStateful> {
   Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> availableMeal=DUMMY_MEALS;
  List<Meal> _favoriteMeal=[];

  void _toggleFavorite(String mealId){
    final existingIndex=_favoriteMeal.indexWhere((element) => element.id==mealId);
    if(existingIndex>=0)
    {
      setState(() {
        _favoriteMeal.removeAt(existingIndex);
      });
    }
    else{
      setState(() {
        _favoriteMeal.add(DUMMY_MEALS.firstWhere((element) => element.id==mealId),);
      });
    }
  }

  void _setFilters(Map<String,bool> newFilter){
    setState(() {
      _filters=newFilter;
      availableMeal=DUMMY_MEALS.where((data) {
        if(_filters['gluten'] && !data.isGlutenFree){
          return false;
        }
        if(_filters['lactose'] && !data.isLactoseFree){
          return false;
        }
        if(_filters['vegan'] && !data.isVegan){
          return false;
        }
        if(_filters['vegetarian'] && !data.isVegetarian){
          return false;
        }
        return true;
      },).toList();
    });
  }
  bool _isFavorite(String mealId){
    return _favoriteMeal.any((element) => element.id==mealId);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyMeals',
      theme: ThemeData(
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              headline2: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
                letterSpacing: 1.5,
              ),
            ),
        fontFamily: 'Raleway',
        primaryColor: Color.fromRGBO(100, 67, 222, 1),
        canvasColor: Color.fromRGBO(252, 251, 254, 1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                fontSize: 23,
                fontStyle: FontStyle.normal,
                fontFamily: 'Raleway',
              )),
          color: Color.fromRGBO(113, 76, 254, 1),
        ),
      ),
//      home: CategoryScreen(),
      routes: {
        '/': (ctx) => TabsScreen(_favoriteMeal),
        CategoryMealScreen.routeName: (ctx) => CategoryMealScreen(availableMeal),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(_toggleFavorite,_isFavorite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters,_setFilters),
      },
    );
  }
}
