import "package:flutter/material.dart";
import "package:myapp/screens/categories_screen.dart";
import "package:myapp/data/dummy_data.dart";
import "package:myapp/screens/filter_screen.dart";
import "package:myapp/screens/meals_screen.dart";
import "package:myapp/models/meal.dart";
import "package:myapp/widgets/meal_drawer.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/providers/meals_provider.dart';
import 'package:myapp/providers/favourites_provider.dart';

const _KInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarianFree: false,
  Filter.veganFree: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  Map<Filter, bool> _selectedFilters = _KInitialFilters;

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }



  int _selectedPageIndex = 0;
  var activePageTitle = "Categories";
  void _selectPage() {
    if (_selectedPageIndex == 0) {
      setState(() {
        _selectedPageIndex = 1;
      });
    } else {
      setState(() {
        _selectedPageIndex = 0;
        activePageTitle = "Categories";
      });
    }
  }

  void setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == "Filters") {
      final result = await Navigator.push<Map<Filter, bool>>(
          context, MaterialPageRoute(builder: (ctx) => const FilterScreen()));
      setState(() {
        _selectedFilters = result ?? _KInitialFilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
    final availableMeals = meals.where((meals) {
      if (_selectedFilters[Filter.glutenFree]! && !meals.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.lactoseFree]! && !meals.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filter.veganFree]! && !meals.isVegan) {
        return false;
      }
      if (_selectedFilters[Filter.vegetarianFree]! && !meals.isVegetarian) {
        return false;
      }
      return true;
    }).toList();

    Widget activePage = CategoriesScreen(
      filteredMeals: availableMeals,
    );
    if (_selectedPageIndex == 1) {
      final _favouriteMeals = ref.watch(FavouriteMealsProvider);
      activePage = MealsScreen(
        meals: _favouriteMeals,
      );
      activePageTitle = "Favourites";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MealDrawer(
        onSelectScreen: setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _selectPage();
        },
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites')
        ],
      ),
    );
  }
}
