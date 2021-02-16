import 'package:flutter/material.dart';
import 'package:meals/screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile({String title, IconData icon, Function ontap}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: ontap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            height: 150,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w900,
                fontSize: 30,
              ),
            ),
          ),
          buildListTile(
            title: 'Meals',
            icon: Icons.restaurant,
            ontap: () {
              Navigator.of(context).pushNamed('/');
            },
          ),
          buildListTile(
            title: 'Filters',
            icon: Icons.settings,
            ontap: () {
              Navigator.of(context).popAndPushNamed(FilterScreen.routName);
            },
          )
        ],
      ),
    );
  }
}
