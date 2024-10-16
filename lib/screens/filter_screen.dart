import "package:flutter/material.dart";
import "package:myapp/screens/tabs.dart";
import "package:myapp/widgets/meal_drawer.dart";

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarianFree,
  veganFree,
}

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFreeMeal = false;
  bool _lactoseFreeMeal = false;
  bool _vegetarianFreeMeal = false;
  bool _veganFreeMeal = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meal Filters"),
      ),
      // drawer: MealDrawer(
      //   onSelectScreen: (identifier) {
      //     Navigator.of(context).pop();
      //     if (identifier == "Meals") {
      //       Navigator.of(context).pop();
      //     }
      //   },
      // ),
      body: WillPopScope(
        onWillPop: () async{
          Navigator.of(context).pop(
            {
              Filter.glutenFree: _glutenFreeMeal,
              Filter.lactoseFree: _lactoseFreeMeal,
              Filter.vegetarianFree: _vegetarianFreeMeal,
              Filter.veganFree: _veganFreeMeal,
            }
          );
          return false;

        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeMeal,
              onChanged: (isChecked) {
                setState(() {
                  _glutenFreeMeal = isChecked;
                });
              },
              title: Text(
                "Gluten-free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primaryContainer),
              ),
              subtitle: Text(
                "Only include gluten free meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primaryContainer),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.all(17),
            ),
            SwitchListTile(
              value: _lactoseFreeMeal,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeMeal = isChecked;
                });
              },
              title: Text(
                "Lactose-free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primaryContainer),
              ),
              subtitle: Text(
                "Only include Lactose free meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primaryContainer),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.all(17),
            ),
            SwitchListTile(
              value: _vegetarianFreeMeal,
              onChanged: (isChecked) {
                setState(() {
                  _vegetarianFreeMeal = isChecked;
                });
              },
              title: Text(
                "Vegan-free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primaryContainer),
              ),
              subtitle: Text(
                "Only include Vegan-free meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primaryContainer),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.all(17),
            ),
            SwitchListTile(
              value: _veganFreeMeal,
              onChanged: (isChecked) {
                setState(() {
                  _veganFreeMeal = isChecked;
                });
              },
              title: Text(
                "Vegetarian free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primaryContainer),
              ),
              subtitle: Text(
                "Only include Vegetarian free meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primaryContainer),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.all(17),
            )
          ],
        ),
      ),
    );
  }
}
