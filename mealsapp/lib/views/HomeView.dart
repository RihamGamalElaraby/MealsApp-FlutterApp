import 'package:flutter/material.dart';
import 'package:mealsapp/views/CatergoriesScreen.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeal'),
      ),
      body: CategoriesScreen(),
    );
  }
}
