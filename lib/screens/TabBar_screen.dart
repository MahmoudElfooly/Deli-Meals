import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widget/MainDrawer.dart';
import '../screens/FavouriteScreen.dart';
import '../screens/categories_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> _favouriteMeals;
  TabsScreen(this._favouriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
   List<Map<String, dynamic>> _page ;
  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
  @override
  void initState() {
    _page = [
    {'page': CategoriesScreen(), 'title': 'Deli Meals'},
    {'page': FavouriteScreen(widget._favouriteMeals), 'title': 'Favourite'},
  ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_page[_selectedPageIndex]['title']),
        centerTitle: true,
      ),
      drawer: MainDrawer(),
      body: _page[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedPageIndex,
          type: BottomNavigationBarType.shifting,
          onTap: _selectPage,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(
                Icons.category,
              ),
              label: 'Category',
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(
                Icons.star,
              ),
              label: 'Favourite',
            ),
          ]),
    );
  }
}
