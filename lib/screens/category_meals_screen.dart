import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widget/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routName = '/CategoryMeals';
  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String title;
  List<Meal> displayedMeals;
  @override
  void initState() {
    //...
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    title = routeArgs['title'];
    final id = routeArgs['id'];
    displayedMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(id))
        .toList();

    super.didChangeDependencies();
  }

  // void _removeMeal(String mealId) {
  //   setState(() {
  //     displayedMeals.removeWhere((meal) => meal.id == mealId);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageurl: displayedMeals[index].imageUrl,
            complexity: displayedMeals[index].complexity,
            duration: displayedMeals[index].duration,
            affordability: displayedMeals[index].affordability,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
