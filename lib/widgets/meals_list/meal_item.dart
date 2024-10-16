import 'package:flutter/material.dart';
import 'package:myapp/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:myapp/widgets/meals_list/meal_item_trait.dart';
import 'package:myapp/screens/meals_detail_screen.dart';



class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.currentMeal, required this.onSelectMeal});

  final Meal currentMeal;
  final Function(BuildContext context,Meal currentMeal) onSelectMeal;

  String get complexityText {
    return currentMeal.complexity.name[0].toUpperCase()+ currentMeal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return currentMeal.affordability.name[0].toUpperCase()+ currentMeal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(19)),
      clipBehavior: Clip.hardEdge,
      elevation: 8,
      child: InkWell(
        onTap: ()=> onSelectMeal(context ,currentMeal),
        child: Stack(
          children: [
            FadeInImage(
                placeholder: MemoryImage(kTransparentImage), 
                image: NetworkImage(currentMeal.imageUrl),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
                ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                width: 300,
                color: Colors.black54,
                child: Column(
                  children: [
                    Text(
                      currentMeal.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(
                          icon: Icons.schedule,
                          label: "${currentMeal.duration} min",
                        ),
                        
                      const SizedBox(width: 10),

                      MealItemTrait(
                          icon: Icons.work,
                          label: complexityText,
                        ),
                      const SizedBox(width: 10),

                      MealItemTrait(
                          icon: Icons.attach_money,
                          label: affordabilityText
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
