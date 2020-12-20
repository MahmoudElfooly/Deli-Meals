import 'package:flutter/material.dart';
import 'package:meals/dummy_data.dart.dart';
import 'package:meals/widget/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routName = '/CategoryMeals';
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final title = routeArgs['title'];
    final id = routeArgs['id'];
    final meals =
        DUMMY_MEALS.where((meal) => meal.categories.contains(id)).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: meals[index].id,
            title: meals[index].title,
            imageurl: meals[index].imageUrl,
            complexity: meals[index].complexity,
            duration: meals[index].duration,
            affordability: meals[index].affordability,
          );
        },
        itemCount: meals.length,
      ),
    );
  }
}
