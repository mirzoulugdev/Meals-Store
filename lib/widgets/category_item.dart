import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:meals/screens/category_meals_screen.dart';

import '../models/category.dart';
import '../models/meal.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  final List<Meal> meals;

  const CategoryItem({Key? key, required this.category, required this.meals})
      : super(key: key);

  void _goToCategoryMealsScreen(BuildContext context) {
    // Navigator.of(context).push(MaterialPageRoute(
    //     builder: (ctx) => CategoryMealsScreen(
    //           categoryName: category.title,
    //         )));

    Navigator.of(context).pushNamed(CategoryMealsScreen.routeName, arguments: {
      'categoryTitle': category.title,
      'categoryMeals': meals,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _goToCategoryMealsScreen(context),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              child: Image.asset(
                category.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.5),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                category.title,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
