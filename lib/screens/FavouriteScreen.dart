import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widget/meal_item.dart';
class FavouriteScreen extends StatelessWidget {
  final List<Meal> _favouriteMeals;
  FavouriteScreen(this._favouriteMeals);
  @override
  Widget build(BuildContext context) {
    if(_favouriteMeals.isEmpty){
      return Center(
      child: Text('No Favourite Items yet'),
    );
    }else{
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: _favouriteMeals[index].id,
            title: _favouriteMeals[index].title,
            imageurl: _favouriteMeals[index].imageUrl,
            complexity: _favouriteMeals[index].complexity,
            duration: _favouriteMeals[index].duration,
            affordability: _favouriteMeals[index].affordability,
          );
        },
        itemCount: _favouriteMeals.length,
      );
    }
    
  }
}