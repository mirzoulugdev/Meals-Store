import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

import './meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  final Function toggleLike;
  final Function isFavorite;
  CategoryMealsScreen({
    required this.toggleLike,
    required this.isFavorite,
    Key? key,
  }) : super(key: key);

  static const routeName = "/categoryMeals";

  @override
  Widget build(BuildContext context) {
    final categoryData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final title = categoryData['categoryTitle'];
    final meals = categoryData['categoryMeals'] as List<Meal>;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: Center(
        child: meals.length > 0
            ? ListView.builder(
                padding: const EdgeInsets.all(10),
                itemBuilder: (ctx, index) => MealItem(
                  meal: meals[index],
                  toggleLike: toggleLike,
                  isFavorite: isFavorite,
                ),
                itemCount: meals.length,
              )
            : const Center(
                child: Text('Hozircha ovqatlar mavjud emas'),
              ),
      ),
    );
  }
}
