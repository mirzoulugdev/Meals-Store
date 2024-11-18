import 'package:flutter/material.dart';

import 'package:meals/screens/categories_screen.dart';
import './favorite_screen.dart';
import '../models/category.dart';
import '../models/meal.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Category> categories;
  final Meals mealModel;
  final Function toggleLike;
  final Function isFavorite;

  const TabsScreen({
    super.key,
    required this.categories,
    required this.mealModel,
    required this.isFavorite,
    required this.toggleLike,
  });

  static const routeName = '/';

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  var _tabIndex = 0;
  List<Map<String, dynamic>> _pages = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pages = [
      {
        'page': CategoriesScreen(
            categories: widget.categories, meals: widget.mealModel.list),
        'title': 'Ovqatlar Menyusi'
      },
      {
        'page': FavoritesScreen(
          favorites: widget.mealModel.favorites,
          toggleLike: widget.toggleLike,
          isFavorite: widget.isFavorite,
        ),
        'title': 'Sevimli Ovqatlar',
      }
    ];
  }

  void _changeTab(int index) {
    setState(() {
      _tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(_pages[_tabIndex]['title']),
      ),
      body: _pages[_tabIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amber,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        onTap: _changeTab,
        currentIndex: _tabIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.more_horiz,
              ),
              label: "Barchasi"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              label: "Sevimli"),
        ],
      ),
    );
  }
}
