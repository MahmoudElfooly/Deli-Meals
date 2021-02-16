import 'package:flutter/material.dart';
import './models/meal.dart';
import './screens/filter_screen.dart';
import './screens/TabBar_screen.dart';
import './dummy_data.dart.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'vegan': false,
    'vegetrian': false,
    'lactose': false,
  };
  List<Meal> _avilableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];
  void _setFilter(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _avilableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetrian'] && !meal.isVegetarian) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavoutie(String mealID) {
    final existingIndex =
        _favouriteMeals.indexWhere((meal) => mealID == meal.id);
    if (existingIndex >= 0) {
      setState(() {
        _favouriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouriteMeals
            .add(DUMMY_MEALS.firstWhere((meal) => mealID == meal.id));
      });
    }
  }

  bool _isMealFavourite(String mealid) {
    return _favouriteMeals.any((meal) => mealid == meal.id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline1: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
      ),
      routes: {
        '/': (ctx) => TabsScreen(_favouriteMeals),
        CategoryMealsScreen.routName: (ctx) =>
            CategoryMealsScreen(_avilableMeals),
        MealDetails.routName: (ctx) =>
            MealDetails(_toggleFavoutie, _isMealFavourite),
        FilterScreen.routName: (ctx) => FilterScreen(_filters, _setFilter),
      },
    );
  }
}
