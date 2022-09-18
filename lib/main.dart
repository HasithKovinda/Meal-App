import 'package:flutter/material.dart';
import 'package:meals_app/Data/dummy_data.dart';
import 'package:meals_app/Models/meal.dart';
import './Routes/category_meal_route.dart';
import 'Routes/meal_details_route.dart';
import 'Routes/tab_route.dart';
import 'Routes/filters_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favoriteMeals = [];

  void toggleFavoriteMeal(String id) {
    final existingIndex =
        favoriteMeals.indexWhere((element) => element.id == id);
    if (existingIndex >= 0) {
      setState(() {
        favoriteMeals.removeAt(existingIndex);
      });
    } else {
      favoriteMeals.add(DUMMY_MEALS.firstWhere((element) => element.id == id));
    }
  }

  bool isFavoriteMeal(String id) {
    return favoriteMeals.any((element) => element.id == id);
  }

  void setFilters(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;
      availableMeals = DUMMY_MEALS.where((meal) {
        if (filters['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (filters['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (filters['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (filters['vegetarian'] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText2: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              headline6: const TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 24,
                  fontWeight: FontWeight.bold))),
      // home: const CategoryRoute(),
      initialRoute: '/',
      routes: {
        '/': (context) => TabRoute(favoriteMeals),
        CategoryMealsRoute.routName: ((context) =>
            CategoryMealsRoute(availableMeals: availableMeals)),
        MealDetails.routName: ((context) =>
            MealDetails(toggleFavoriteMeal, isFavoriteMeal)),
        FiltersRoute.routName: ((context) =>
            FiltersRoute(currentFilter: filters, saveFilters: setFilters))
      },
    );
  }
}
