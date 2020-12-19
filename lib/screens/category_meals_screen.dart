import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routName='/CategoryMeals';
  @override
  Widget build(BuildContext context) {
    final routeArgs=ModalRoute.of(context).settings.arguments as Map<String,String>;
    final title =routeArgs['title'];
    final id= routeArgs['id'];
    return Scaffold(
      appBar: AppBar(
        title: Text('$id $title'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Category Meals Screen'),
      ),
    );
  }
}
