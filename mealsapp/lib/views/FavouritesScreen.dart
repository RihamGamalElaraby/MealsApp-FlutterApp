import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/widgets/mealItem.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key, required this.Favourite});
  final List<Meal> Favourite;
  @override
  Widget build(BuildContext context) {
    if (Favourite.isEmpty) {
      return Center(child: Text('You have no favorites yet ! '));
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: Favourite[index].id,
            title: Favourite[index].title,
            imageUrl: Favourite[index].imageUrl,
            duration: Favourite[index].duration,
            affordability: Favourite[index].affordability,
            complexity: Favourite[index].complexity,
          );
        },
        itemCount: Favourite.length,
      );
    }
  }
}
