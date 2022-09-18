import 'package:flutter/material.dart';
import 'package:meals_app/Models/meal.dart';
import '../Widgets/meal_item.dart';
import '../Data/dummy_data.dart';

class CategoryMealsRoute extends StatefulWidget {
  static const String routName = '/category-meals';
  final List<Meal> availableMeals;
  const CategoryMealsRoute({Key? key, required this.availableMeals})
      : super(key: key);

  @override
  State<CategoryMealsRoute> createState() => _CategoryMealsRouteState();
}

class _CategoryMealsRouteState extends State<CategoryMealsRoute> {
  String? categoryTitle;
  List<Meal>? displayMeals;
  var loadInitData = false;
  @override
  void initState() {
    print("init state called form meal category");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!loadInitData) {
      final routsArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      final categoryId = routsArgs['id'];
      categoryTitle = routsArgs['title'];
      displayMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      loadInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeItem(String id) {
    setState(() {
      print('safasfasfasf');
      displayMeals!.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle!)),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayMeals![index].id,
            title: displayMeals![index].title,
            imageUrl: displayMeals![index].imageUrl,
            duration: displayMeals![index].duration,
            complexity: displayMeals![index].complexity,
            affordability: displayMeals![index].affordability,
          );
        },
        itemCount: displayMeals!.length,
      ),
    );
  }
}
