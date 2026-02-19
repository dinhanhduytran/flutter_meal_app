import 'package:flutter/material.dart';
import 'package:meal_app_flutter/data/dummy_data.dart';
import 'package:meal_app_flutter/models/category.dart';
import 'package:meal_app_flutter/screens/meals.dart';
import 'package:meal_app_flutter/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) =>
          MealsScreen(meals: filteredMeals, title: category.title),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pick your category'),
        ),
        body: GridView(
          padding: const EdgeInsets.all(14),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 3 / 2,
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: [
            ...availableCategories
                .map((cat) => CategoryGridItem(
                      category: cat,
                      onSelectCategory: () {
                        _selectCategory(context, cat);
                      },
                    ))
                .toList(),
          ],
        ));
  }
}
