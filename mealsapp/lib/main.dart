import 'package:flutter/material.dart';
import 'package:mealsapp/views/CategoryMealsScreen.dart';
import 'package:mealsapp/views/HomeView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
      // home: (context) '/',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeView(),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(),
      },
    );
  }
}
