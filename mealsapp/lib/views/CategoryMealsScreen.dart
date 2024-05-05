import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/categories';
  // final String categoryId;
  // final String categoryTitle;

  // const CategoryMealsScreen(
  //     {super.key, required this.categoryId, required this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    final rotesArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryTilte = rotesArgs['title'];
    final categoryId = rotesArgs['id'];
    return Scaffold(
        appBar: AppBar(
            title: Text(
          categoryTilte!,
        )),
        body: ListView.builder(
          itemBuilder: (ctx, index) {},
          itemCount: 10,
        ));
  }
}
