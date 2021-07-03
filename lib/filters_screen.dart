import 'package:flutter/material.dart';
import './main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String , bool> currentFilters;

  FiltersScreen(this.currentFilters,this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: Icon(
              Icons.save,
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  value: _glutenFree,
                  title: Text('Gluten-free'),
                  subtitle: Text('Only include gluten-free meals.'),
                  onChanged: (newValue) {
                    setState(
                          () {
                        _glutenFree = newValue;
                      },
                    );
                  },
                ),
                SwitchListTile(
                  value: _lactoseFree,
                  title: Text('Lactose-free'),
                  subtitle: Text('Only include lactose-free meals.'),
                  onChanged: (newValue) {
                    setState(
                          () {
                        _lactoseFree = newValue;
                      },
                    );
                  },
                ),
                SwitchListTile(
                  value: _vegetarian,
                  title: Text('Vegetarian'),
                  subtitle: Text('Only include vegetarian meals.'),
                  onChanged: (newValue) {
                    setState(
                          () {
                        _vegetarian = newValue;
                      },
                    );
                  },
                ),
                SwitchListTile(
                  value: _vegan,
                  title: Text('Vegan'),
                  subtitle: Text('Only include vegan meals.'),
                  onChanged: (newValue) {
                    setState(
                          () {
                        _vegan = newValue;
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
