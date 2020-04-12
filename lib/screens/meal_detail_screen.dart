import 'package:flutter/material.dart';
import 'package:shop_app/helpers/data.dart';

class MealDetailScreen extends StatelessWidget {
  static String routeName = '/meal-detail-screen';
  final Function toggleFavorite;
  final Function isMealFavorite;

  MealDetailScreen(this.toggleFavorite, this.isMealFavorite);

  Widget buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: TextStyle(
            fontFamily: Theme.of(context).textTheme.title.fontFamily,
            fontWeight: Theme.of(context).textTheme.title.fontWeight,
            fontSize: 24),
      ),
    );
  }

  Widget buildSection({List children}) {
    return Container(
      width: double.infinity,
      child: Column(
        children: children.asMap().entries.map((entry) {
          return Container(
            width: double.infinity,
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    child: Text('#${entry.key}'),
                  ),
                  title: Text(
                    entry.value,
                    style: TextStyle(fontSize: 18, height: 1.5),
                    textAlign: TextAlign.left,
                  ),
                ),
                Divider(),
              ],
            ),
            // decoration: BoxDecoration(border: Border.all(color: Colors.red)),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final argumentsData =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final id = argumentsData['id'];
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == id);
    final title = selectedMeal.title;
    final imageUrl = selectedMeal.imageUrl;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 40),
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(imageUrl, fit: BoxFit.cover),
            ),
            buildSectionTitle(context, 'Ingredients'),
            SizedBox(
              height: 10,
            ),
            buildSection(
              children: selectedMeal.ingredients,
            ),
            buildSectionTitle(context, 'Steps'),
            SizedBox(
              height: 10,
            ),
            buildSection(children: selectedMeal.steps)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: isMealFavorite(id) ? Icon(Icons.delete) : Icon(Icons.favorite),
        onPressed: () => toggleFavorite(id),
      ),
    );
  }
}
