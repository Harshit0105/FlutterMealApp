import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/main_Drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function _setFilter;
  final Map<String,bool> _filter;

  FiltersScreen(this._filter,this._setFilter);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree;
  bool _isLactoseFree;
  bool _isVegan;
  bool _isVegetarian;

  @override
  void initState() {
    _isGlutenFree = widget._filter['gluten'];
    _isLactoseFree = widget._filter['lactose'];
    _isVegan = widget._filter['vegan'];
    _isVegetarian = widget._filter['vegetarian'];
    super.initState();
  }

  Widget _buildSwitchListTile(
      String title, String discription, bool currentValue, Function setValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(discription),
      value: currentValue,
      onChanged: setValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              widget._setFilter(
                {
                  'gluten': _isGlutenFree,
                  'lactose': _isLactoseFree,
                  'vegan': _isVegan,
                  'vegetarian': _isVegetarian,
                },
              );
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection...',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Divider(),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  'Gluten-Free',
                  'Select gluten free meal.',
                  _isGlutenFree,
                  (nextValue) {
                    setState(
                      () {
                        _isGlutenFree = nextValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Lactose-Free',
                  'Select Lactose free meal.',
                  _isLactoseFree,
                  (nextValue) {
                    setState(
                      () {
                        _isLactoseFree = nextValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'Select Vegan meal.',
                  _isVegan,
                  (nextValue) {
                    setState(
                      () {
                        _isVegan = nextValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Only Vegetarian',
                  'Select Vegetarian free meal.',
                  _isVegetarian,
                  (nextValue) {
                    setState(
                      () {
                        _isVegetarian = nextValue;
                      },
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
