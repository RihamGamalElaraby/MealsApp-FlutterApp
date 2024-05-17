import 'package:flutter/material.dart';
import 'package:mealsapp/views/filtersScreen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});
  Widget buildListTile(
      String title, IconData icon, void Function()? tapHandeler) {
    return ListTile(
      onTap: tapHandeler,
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: Icon(icon),
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
            padding: EdgeInsets.all(120),
            // alignment: Alignment.centerLeft,
            color: Colors.grey,
            child: Text(
              'Cooking Up !',
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
          buildListTile('Filttered', Icons.settings, () {
            Navigator.pushReplacementNamed(context, FiltersScreen.routeName);
          }),
        ],
      ),
    );
  }
}
