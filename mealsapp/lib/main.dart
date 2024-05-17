import 'package:flutter/material.dart';
import 'package:mealsapp/dummy_data.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/views/CategoryMealsScreen.dart';
import 'package:mealsapp/views/CatergoriesScreen.dart';
import 'package:mealsapp/views/filtersScreen.dart';
import 'package:mealsapp/views/mealDetailScreen.dart';
import 'package:mealsapp/views/tabsScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetartian': false,
  };

  void setFilters(Map<String, bool> filterdDATA) {
    setState(() {
      filters = filterdDATA;
      currentMeals = DUMMY_MEALS.where((meal) {
        if (filters['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (filters['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (filters['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (filters['vegetartian'] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void toggleFavourite(String mealId) {
    final existingIndex =
        favouriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        favouriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favouriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool isMealFavorite(String id) {
    return favouriteMeals.any((meal) => meal.id == id);
  }

  List<Meal> currentMeals = DUMMY_MEALS;
  List<Meal> favouriteMeals = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primaryColor: Colors.pink,
          canvasColor: Color.fromRGBO(255, 254, 299, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyLarge: TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(20, 51, 51, 1),
                  fontWeight: FontWeight.bold,
                ),
                bodyMedium: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                  fontWeight: FontWeight.w700,
                ),
                titleSmall: TextStyle(
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.w300,
                    fontSize: 24,
                    color: Color.fromRGBO(20, 51, 51, 1)),
              )),
      initialRoute: '/',
      routes: {
        '/': (context) => TabScreen(
              favourite: favouriteMeals,
            ),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(
              currentMEALS: currentMeals,
            ),
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen(toggleFavourite, isMealFavorite),
        FiltersScreen.routeName: (context) => FiltersScreen(
              saveFilters: setFilters,
              filters: filters,
            ),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => CategoriesScreen(),
        );
      },
    );
  }
}
