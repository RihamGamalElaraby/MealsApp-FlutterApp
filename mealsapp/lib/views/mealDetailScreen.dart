import 'package:flutter/material.dart';
import 'package:mealsapp/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-deatil';
  final Function toggleFavorite;
  final Function isFavorite;

  MealDetailScreen(this.toggleFavorite, this.isFavorite);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10)),
        height: 200,
        width: 300,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingrediants'),
            buildContainer(
              ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 10),
                      child: Text(selectedMeal.ingredients[index]),
                    ),
                  );
                },
              ),
            ),
            // Container(
            //   margin: EdgeInsets.all(10),
            //   padding: EdgeInsets.all(10),
            //   decoration: BoxDecoration(
            //       color: Colors.white,
            //       border: Border.all(color: Colors.black),
            //       borderRadius: BorderRadius.circular(10)),
            //   height: 200,
            //   width: 300,
            //   child: ListView.builder(
            //     itemCount: selectedMeal.ingredients.length,
            //     itemBuilder: (context, index) {
            //       return Card(
            //         color: Colors.grey,
            //         child: Padding(
            //           padding: const EdgeInsets.symmetric(
            //               vertical: 5.0, horizontal: 10),
            //           child: Text(selectedMeal.ingredients[index]),
            //         ),
            //       );
            //     },
            //   ),
            // ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(ListView.builder(
              itemBuilder: (context, index) => Column(
                children: [
                  ListTile(
                    title: Text(selectedMeal.steps[index]),
                    leading: CircleAvatar(
                      child: Text('#${index + 1}'),
                    ),
                  ),
                  Divider(),
                ],
              ),
              itemCount: selectedMeal.steps.length,
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(mealId) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => toggleFavorite(mealId),
      ),
    );
  }
}
