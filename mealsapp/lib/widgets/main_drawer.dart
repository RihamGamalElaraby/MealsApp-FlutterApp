import 'package:flutter/material.dart';
import 'package:mealsapp/views/filtersScreen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget buildListTile(
      String title, IconData icon, void Function()? tapHandler) {
    return ListTile(
      onTap: tapHandler,
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: Icon(
        icon,
        size: 26,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).primaryColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Meals', Icons.restaurant, () {
            Navigator.pushReplacementNamed(context, '/');
          }),
          buildListTile('Filtered', Icons.settings, () {
            Navigator.pushReplacementNamed(context, FiltersScreen.routeName);
          }),
        ],
      ),
    );
  }
}
