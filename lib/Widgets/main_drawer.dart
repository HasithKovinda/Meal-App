import 'package:flutter/material.dart';
import 'package:meals_app/Routes/filters_route.dart';
import '../Routes/favorites_route.dart';

class MainDrawer extends StatelessWidget {
  Widget bulidListTitle(String title, IconData icon, Function routeHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: (() => routeHandler()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          color: Theme.of(context).colorScheme.secondary,
          child: Text(
            'Cooking UP',
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        bulidListTitle('Meals', Icons.restaurant, () {
          Navigator.of(context).pushReplacementNamed('/');
        }),
        bulidListTitle('Filters', Icons.settings, () {
          Navigator.of(context).pushReplacementNamed(FiltersRoute.routName);
        })
      ],
    ) // Populate the Drawer in the next step.
        );
  }
}
