import 'package:flutter/material.dart';
import 'package:myapp/models/meal.dart';
import 'package:myapp/widgets/meals_list/meals_list.dart';
import 'package:myapp/screens/meals_detail_screen.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.meals});
  final String? title;
  final List<Meal> meals;

  void _selectMeal(BuildContext context, Meal currentMeal) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => MealsDetailScreen(
                  currentMeal: currentMeal,
                )));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No Meals Found'),
    );

    if (meals.isNotEmpty) {
      mainContent = MealsList(
        mealsList: meals,
        onSelectMeal: _selectMeal,
      );
    }

    return Scaffold(
      appBar: title != null
          ? AppBar(
              title: Text(title!),
            )
          : null, // Show AppBar only if title is not null
      body: Column(
        children: [Expanded(child: mainContent)],
      ),
    );
  }
}
