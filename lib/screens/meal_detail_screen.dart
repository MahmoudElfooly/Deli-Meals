import 'package:flutter/material.dart';
import 'package:meals/dummy_data.dart.dart';

class MealDetails extends StatelessWidget {
  static const routName = '/Meal_Details';
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;
    final mealDetails = DUMMY_MEALS.firstWhere((meal) => meal.id == id);
    return Scaffold(
      appBar: AppBar(
        title: Text('details'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: ClipRRect(
              child: Image.network(
                mealDetails.imageUrl,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Center(
            child: Text(
              'ingredients',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Container(
            width: double.infinity,
            height: 200,
            child: Column(
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
