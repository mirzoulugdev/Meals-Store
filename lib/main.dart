import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals/screens/category_meals_screen.dart';
import 'package:meals/screens/tab_screens.dart';

import './screens/categories_screen.dart';
import './models/category.dart';
// ignore: duplicate_import
import './screens/category_meals_screen.dart';
import './models/meal.dart';
import './screens/meal_details_screen.dart';
import './screens/products_screen.dart';
import './screens/add_new_product_screen.dart';

void main() {
  runApp(App());
}

// ignore: use_key_in_widget_constructors
class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _categoryModel = Categories();

  final _mealModel = Meals();

  void _toggleLike(String mealId) {
    setState(() {
      _mealModel.toggleLike(mealId);
    });
  }

  bool _isFavorite(String mealId) {
    return _mealModel.favorites.any((meal) => meal.id == mealId);
  }

  void _addNewMeal(Meal meal) {
    setState(() {
      _mealModel.addNewMeal(meal);
    });
  }
  

  void _deleteMeal(String id) {
    setState(() {
      _mealModel.deleteMeal(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
        fontFamily: GoogleFonts.adventPro().fontFamily,
        appBarTheme: AppBarTheme(color: Colors.amber),
      ),
      debugShowCheckedModeBanner: false,

      // home: CategoriesScreen(
      //     categories: _categoryModel.list, meals: _mealModel.list),
      initialRoute: TabsScreen.routeName,
      routes: {
        TabsScreen.routeName: (ctx) => TabsScreen(
              categories: _categoryModel.list,
              mealModel: _mealModel,
              toggleLike: _toggleLike,
              isFavorite: _isFavorite,
            ),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(
            toggleLike: _toggleLike, isFavorite: _isFavorite),
        MealDetailsScreen.routeName: (ctx) => MealDetailsScreen(),
        ProductsScreen.routeName: (ctx) => ProductsScreen(
              meals: _mealModel.list,
              deleteMeal: _deleteMeal,
            ),
        addNewProductScreen.routeName: (ctx) => addNewProductScreen(
              categories: _categoryModel.list,
              addFunction: _addNewMeal,
            )
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
            builder: (ctx) => CategoriesScreen(
                categories: _categoryModel.list, meals: _mealModel.list));
      },
    );
  }
}
