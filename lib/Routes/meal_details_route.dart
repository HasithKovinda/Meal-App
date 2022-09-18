import 'package:flutter/material.dart';
import 'package:meals_app/Data/dummy_data.dart';
import 'package:meals_app/Models/meal.dart';

class MealDetails extends StatelessWidget {
  static const String routName = '/meal-details';
  final Function togel;
  final Function favorite;

  MealDetails(this.togel, this.favorite);

  Widget buildTitleSection(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: 150,
        width: 300,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)?.settings.arguments as String;
    final selectMeal = DUMMY_MEALS.firstWhere(((element) => element.id == id));
    return Scaffold(
      appBar: AppBar(title: Text(selectMeal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildTitleSection(context, 'Ingredients'),
            buildContainer(ListView.builder(
              itemBuilder: ((context, index) => Card(
                    color: Theme.of(context).colorScheme.secondary,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(selectMeal.ingredients[index])),
                  )),
              itemCount: selectMeal.ingredients.length,
            )),
            buildTitleSection(context, 'Steps'),
            buildContainer(ListView.builder(
              itemBuilder: ((context, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${(index + 1)}'),
                        ),
                        title: Text(selectMeal.steps[index]),
                      ),
                      const Divider(
                        color: Colors.black,
                      )
                    ],
                  )),
              itemCount: selectMeal.steps.length,
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() => togel(id)),
        child: Icon(favorite(id) ? Icons.star : Icons.star_border),
      ),
    );
  }
}
