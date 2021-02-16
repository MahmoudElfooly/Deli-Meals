import 'package:flutter/material.dart';
import '../dummy_data.dart.dart';

class MealDetails extends StatelessWidget {
  static const routName = '/Meal_Details';
  final Function _toggleFav;
  final Function _isFavoutite;
  MealDetails(this._toggleFav,this._isFavoutite);
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;
    final mealDetails = DUMMY_MEALS.firstWhere((meal) => meal.id == id);
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop(mealDetails.id);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('details'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
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
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1.0),
                  color: Colors.black54,
                ),
                margin: EdgeInsets.all(10),
                width: 300,
                height: 150,
                child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Card(
                      child: Text(
                        mealDetails.ingredients[index],
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    );
                  },
                  itemCount: mealDetails.ingredients.length,
                ),
              ),
              Center(
                child: Text(
                  'Steps',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1.0),
                  color: Colors.black54,
                ),
                margin: EdgeInsets.all(10),
                width: 300,
                height: 150,
                child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Card(
                      child: Text(
                        mealDetails.steps[index],
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    );
                  },
                  itemCount: mealDetails.steps.length,
                ),
              ),
              FloatingActionButton(
                onPressed:(){_toggleFav(id);} ,
                child: _isFavoutite (id)?
                Icon(Icons.star) : Icon(Icons.star_border),
              )
            ],
          ),
        ),
      ),
    );
  }
}
