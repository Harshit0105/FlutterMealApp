import 'package:flutter/material.dart';

import './category_screen.dart';
import './favorite_screen.dart';
import '../widgets/main_Drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> _favoriteMeal;

  TabsScreen(this._favoriteMeal);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
   List<Map<String,Object>> _pages;



  @override
  void initState() {
    _pages=[{'page': CategoryScreen(),'title':'Category',},
      {'page':FavoriteScreen(widget._favoriteMeal),'title':'Your Favourite',},
    ];
    super.initState();
  }

  int _selectPageIndex = 0;
  void _selectPage(index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).appBarTheme.color,
        selectedItemColor: Colors.white,
        currentIndex: _selectPageIndex,
        type: BottomNavigationBarType.shifting,
        unselectedItemColor: Theme.of(context).primaryColorLight,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).appBarTheme.color,
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).appBarTheme.color,
            icon: Icon(Icons.star),
            title: Text('Favorite'),
          )
        ],
      ),
    );
  }
}
