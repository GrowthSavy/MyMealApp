import 'package:flutter/material.dart';
import 'package:myapp/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealsDetailScreen extends StatelessWidget {
  const MealsDetailScreen(
      {super.key, required this.currentMeal});
  final Meal currentMeal;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentMeal.title),
        actions: [
          IconButton(
              onPressed: () {
                onToggleFavourite(currentMeal);
              },
              icon: const Icon(Icons.star))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(currentMeal.imageUrl),
              fit: BoxFit.cover,
              height: 300,
              width: double.infinity,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Ingredients",
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 166, 82),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            for (final ingredient in currentMeal.ingredients)
              Text(
                ingredient,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Steps",
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 166, 82),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            for (final step in currentMeal.steps)
              Text(
                step,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}
