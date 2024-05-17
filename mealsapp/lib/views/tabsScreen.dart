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

  int selectedPageIndex = 0;
  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return
        // DefaultTabController(
        //     length: 2,
        //     child:
        Scaffold(
      appBar: AppBar(
        title: Text(pages[selectedPageIndex]['title']),
        // bottom: TabBar(tabs: [
        //   Tab(
        //     icon: Icon(Icons.category),
        //     text: 'Categories',
        //   ),
        //   Tab(
        //     icon: Icon(Icons.star),
        //     text: 'Favourite',
        //   ),
        // ]),
      ),
      drawer: MainDrawer(),
      body: pages[selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: selectPage,
          currentIndex: selectedPageIndex,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.grey,
          backgroundColor: Theme.of(context).primaryColor,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              label: 'Category',
              icon: Icon(Icons.category),
            ),
            BottomNavigationBarItem(
              // backgroundColor: Theme.of(context).primaryColor,
              label: 'Favourite',
              icon: Icon(Icons.favorite),
            )
          ]),
      // TabBarView(children: [
      //   CategoriesScreen(),
      //   FavouriteScreen(),
      // ])
    );
    // );
  }
}
