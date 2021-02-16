import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const routName = '/Filter_Screen';
  final Map<String,bool> currentFilter;
  final Function saveFilter;
  FilterScreen(this.currentFilter,this.saveFilter);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _isGlutenFree = false;

  bool _isVegan = false;

  bool _isVegetarian = false;

  bool _isLactoseFree = false;
  @override
  initState(){
    _isGlutenFree =widget.currentFilter['gluten'];
    _isVegan = widget.currentFilter['vegan'];
    _isVegetarian =widget.currentFilter['vegetrian'];
    _isLactoseFree =widget.currentFilter['lactose'];
    super.initState();
  }
  Widget _buildSwitchTile(String title, String description, bool currentValue,
      Function updateValue) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Filter',
          ),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  final _selectedFilter = {
                    'gluten': _isGlutenFree,
                    'vegan': _isVegan,
                    'vegetrian': _isVegetarian,
                    'lactose': _isLactoseFree,
                  };
                  widget.saveFilter(_selectedFilter);
                  Navigator.pop(context);
                })
          ]),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Center(
                child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline1,
            )),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchTile(
                  'Gluten-free',
                  'Only include Gluten-free',
                  _isGlutenFree,
                  (newValue) {
                    setState(() {
                      _isGlutenFree = newValue;
                    });
                  },
                ),
                _buildSwitchTile(
                  'Vegan-free',
                  'Only include Vegan-free',
                  _isVegan,
                  (newValue) {
                    setState(() {
                      _isVegan = newValue;
                    });
                  },
                ),
                _buildSwitchTile(
                  'Vegetarian-free',
                  'Only include Vegetarian-free',
                  _isVegetarian,
                  (newValue) {
                    setState(() {
                      _isVegetarian = newValue;
                    });
                  },
                ),
                _buildSwitchTile(
                  'Lactose-free',
                  'Only include Lactose-free',
                  _isLactoseFree,
                  (newValue) {
                    setState(() {
                      _isLactoseFree = newValue;
                    });
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
