import 'package:flutter/material.dart';

import '../models/meal.dart';
import 'package:meals/screens/meal_details_screen.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final Function toggleLike;
  final Function isFavorite;
  const MealItem({
    super.key,
    required this.meal,
    required this.toggleLike,
    required this.isFavorite,
  });

  void _goToMealDetails(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealDetailsScreen.routeName, arguments: meal);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _goToMealDetails(context),
      child: Card(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 300,
                    child: meal.imageUrls[0].startsWith("assets/")
                        ? Image.asset(
                            meal.imageUrls[0],
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            meal.imageUrls[0],
                            fit: BoxFit.cover,
                          ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      alignment: Alignment.bottomRight,
                      color: Colors.black.withOpacity(0.6),
                      width: 200,
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        meal.title,
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () => toggleLike(meal.id),
                      icon: Icon(
                        isFavorite(meal.id)
                            ? Icons.favorite
                            : Icons.favorite_outline,
                        color: Colors.black54,
                        size: 25,
                      ),
                    ),
                    Text(
                      "${meal.preparingTime} minut",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${meal.price} \$",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
