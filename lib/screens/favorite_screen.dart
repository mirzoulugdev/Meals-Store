import 'package:flutter/material.dart';
import 'package:meals/screens/meal_item.dart';

import '../models/meal.dart';

class FavoritesScreen extends StatefulWidget {
  final List<Meal> favorites;
  final Function toggleLike;
  final Function isFavorite;
  const FavoritesScreen({
    super.key,
    required this.favorites,
    required this.isFavorite,
    required this.toggleLike,
  });

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  void _toggleLike(String mealId) {
    setState(() {
      widget.toggleLike(mealId);
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text("Sevimli taom o'chirildi!"),
      action: SnackBarAction(
        label: "BEKOR QILISH",
        onPressed: () {},
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return widget.favorites.length > 0
        ? ListView.builder(
            itemCount: widget.favorites.length,
            itemBuilder: (ctx, index) => MealItem(
              meal: widget.favorites[index],
              toggleLike: _toggleLike,
              isFavorite: widget.isFavorite,
            ),
          )
        : Center(
            child: Text(
              "Sevimli ovqatlar mavjud emas!",
              style: TextStyle(fontSize: 20),
            ),
          );
  }
}
