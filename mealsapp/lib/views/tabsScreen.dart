import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/views/CatergoriesScreen.dart';
import 'package:mealsapp/views/FavouritesScreen.dart';
import 'package:mealsapp/widgets/main_drawer.dart';

class TabScreen extends StatefulWidget {
  TabScreen({super.key, required this.favourite});
  final List<Meal> favourite;

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  late List<Map<dynamic, dynamic>> pages;
  int selectedPageIndex = 0;

  @override
  void initState() {
    pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {
        'page': FavouriteScreen(
          Favourite: widget.favourite,
        ),
        'title': 'Favourite'
      },
    ];
    super.initState();
  }

  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4, // Add elevation to the app bar
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          pages[selectedPageIndex]['title'],
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: MainDrawer(),
      body: pages[selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        currentIndex: selectedPageIndex,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.grey,
        backgroundColor: Theme.of(context).primaryColor,
        type: BottomNavigationBarType.fixed, // Change to fixed type
        items: [
          BottomNavigationBarItem(
            label: 'Category',
            icon: Icon(Icons.category),
          ),
          BottomNavigationBarItem(
            label: 'Favourite',
            icon: Icon(Icons.favorite),
          )
        ],
      ),
    );
  }
}
