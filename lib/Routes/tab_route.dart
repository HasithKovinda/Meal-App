import 'package:flutter/material.dart';
import '../Routes/favorites_route.dart';
import '../Routes/categroies_route.dart';
import '../Widgets/main_drawer.dart';
import '../Models/meal.dart';

class TabRoute extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabRoute(this.favoriteMeals);

  @override
  State<TabRoute> createState() => _TabRouteState();
}

class _TabRouteState extends State<TabRoute> {
  late List<Map<String, Object>> _routes;
  int selectRouteIndex = 0;

  @override
  void initState() {
    _routes = [
      {'page': CategoryRoute(), 'title': 'Category'},
      {'page': FavoritesRoute(widget.favoriteMeals), 'title': 'Your Favorites'}
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      selectRouteIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_routes[selectRouteIndex]['title'] as String),
      ),
      drawer: MainDrawer(),
      body: _routes[selectRouteIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: selectRouteIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'category'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'favorite')
        ],
      ),
    );
  }
}
