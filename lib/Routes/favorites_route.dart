import 'package:flutter/material.dart';
import '../Models/meal.dart';
import '../Widgets/meal_item.dart';

class FavoritesRoute extends StatelessWidget {
  final List<Meal> favoriteMeal;
  FavoritesRoute(this.favoriteMeal);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeal.isEmpty) {
      return const Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteMeal[index].id,
            title: favoriteMeal[index].title,
            imageUrl: favoriteMeal[index].imageUrl,
            duration: favoriteMeal[index].duration,
            affordability: favoriteMeal[index].affordability,
            complexity: favoriteMeal[index].complexity,
          );
        },
        itemCount: favoriteMeal.length,
      );
    }
  }
}
