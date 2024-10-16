import 'package:flutter/material.dart';
import 'package:myapp/models/category.dart';
import 'package:myapp/models/meal.dart';
import 'package:myapp/data/dummy_data.dart';
import 'package:myapp/screens/meals_screen.dart';
import 'package:myapp/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key,required this.filteredMeals});
  final List<Meal> filteredMeals;

  void _selectCategory(BuildContext context, String catTitle) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => MealsScreen(
                  title: catTitle,
                  meals: filteredMeals,
                )));
  }
  

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _selectCategory(context, category.title);
              })
      ],
    );
  }
}
