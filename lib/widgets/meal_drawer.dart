import 'package:flutter/material.dart';

class MealDrawer extends StatelessWidget {
  const MealDrawer({super.key, required this.onSelectScreen});
  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.9)
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
            child: Row(
              children: [
                Icon(
                  Icons.food_bank,
                  size: 40,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  'Cooking Up',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              size: 25,
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
            title: Text(
              "Meals",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              onSelectScreen("Meals");
            },
          ),
          ListTile(
            leading: Icon(
              Icons.filter_alt_outlined,
              size: 25,
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
            title: Text(
              "Filters",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              onSelectScreen("Filters");
            },
          )
        ],
      ),
    );
  }
}
