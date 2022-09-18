import 'package:flutter/material.dart';
import '../Widgets/main_drawer.dart';

class FiltersRoute extends StatefulWidget {
  static String routName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilter;
  const FiltersRoute(
      {Key? key, required this.currentFilter, required this.saveFilters})
      : super(key: key);

  @override
  State<FiltersRoute> createState() => _FiltersRouteState();
}

class _FiltersRouteState extends State<FiltersRoute> {
  var glutenFree = false;
  var vegetarianFree = false;
  var vegan = false;
  var lactoseFree = false;

  @override
  void initState() {
    print('Init State Run');
    glutenFree = widget.currentFilter['gluten'] as bool;
    lactoseFree = widget.currentFilter['lactose'] as bool;
    vegan = widget.currentFilter['vegan'] as bool;
    vegetarianFree = widget.currentFilter['vegetarian'] as bool;
    super.initState();
  }

  Widget buildSwichView(String title, String subTile, bool currentValue,
      Function(bool) updateValue) {
    return SwitchListTile(
        title: Text(title),
        value: currentValue,
        subtitle: Text(subTile),
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        actions: [
          IconButton(
              onPressed: () {
                final filters = {
                  'gluten': glutenFree,
                  'lactose': lactoseFree,
                  'vegan': vegan,
                  'vegetarian': vegetarianFree
                };

                widget.saveFilters(filters);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Adjust your meal selection',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Expanded(
            child: ListView(
          children: [
            buildSwichView(
                'Gluten-Free', 'only include gluten-free meals', glutenFree,
                (value) {
              setState(() {
                glutenFree = value;
              });
            }),
            buildSwichView('Vegetarian-Free',
                'only include vegetarian-free meals', vegetarianFree, (value) {
              setState(() {
                vegetarianFree = value;
              });
            }),
            buildSwichView('Vegan', 'only include vegan meals', vegan, (value) {
              setState(() {
                vegan = value;
              });
            }),
            buildSwichView(
                'LactoseFree', 'only include lactoseFree meals', lactoseFree,
                (value) {
              setState(() {
                lactoseFree = value;
              });
            })
          ],
        ))
      ]),
    );
  }
}
