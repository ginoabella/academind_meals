import 'package:flutter/material.dart';

import 'package:meals/models/meal.dart';
import 'package:meals/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routedName = '/meal-details';

  final Function toggleFavorite;
  final Function isFavorite;

  MealDetailScreen(this.toggleFavorite, this.isFavorite);

  // final String id;

  // MealDetailScreen(this.id);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            _buildSectionTitle(context, 'Ingredients'),
            _buildContainer(
              _buildListViewIngredients(selectedMeal),
            ),
            SizedBox(height: 10),
            _buildSectionTitle(context, 'Steps'),
            _buildContainer(
              _buildListViewSteps(selectedMeal),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleFavorite(mealId),
        child: Icon(isFavorite(mealId) ? Icons.star : Icons.star_border),
      ),
    );
  }

  ListView _buildListViewSteps(Meal selectedMeal) {
    return ListView.builder(
      itemCount: selectedMeal.steps.length,
      itemBuilder: (context, index) => Column(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              child: Text('# ${index + 1}'),
            ),
            title: Text(selectedMeal.steps[index]),
          ),
          Divider(),
        ],
      ),
    );
  }

  Container _buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child,
    );
  }

  ListView _buildListViewIngredients(Meal selectedMeal) {
    return ListView.builder(
      itemCount: selectedMeal.ingredients.length,
      itemBuilder: (context, index) => Card(
        color: Theme.of(context).accentColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10,
          ),
          child: Text(
            selectedMeal.ingredients[index],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Container(
      child: Text(
        title,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }
}
