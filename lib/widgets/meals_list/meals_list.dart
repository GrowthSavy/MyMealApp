import 'package:flutter/material.dart';
import 'package:myapp/models/meal.dart';
import 'package:myapp/widgets/meals_list/meal_item.dart';



class MealsList extends StatelessWidget{
  const MealsList({super.key,required this.mealsList, required this.onSelectMeal});

  final List<Meal> mealsList;
  final Function(BuildContext context, Meal currentMeal) onSelectMeal;

  @override
  Widget build(BuildContext context){
    return ListView.builder(
      itemCount: mealsList.length,
      itemBuilder: (ctx, index){
        return MealItem(currentMeal: mealsList[index], onSelectMeal: onSelectMeal,);
      },
    );
  }
}


