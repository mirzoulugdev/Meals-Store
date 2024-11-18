import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import '../models/meal.dart';
import '../screens/add_new_product_screen.dart';

class ProductsScreen extends StatefulWidget {
  final List<Meal> meals;
  final Function deleteMeal;
  const ProductsScreen({
    super.key,
    required this.meals,
    required this.deleteMeal,
  });

  static const routeName = '/products';

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  void _goToAddNewProduct(BuildContext context) {
    Navigator.of(context)
        .pushNamed(addNewProductScreen.routeName)
        .then((value) {
      if (value == true) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Mahsulotlar"),
        actions: [
          IconButton(
            onPressed: () {
              _goToAddNewProduct(context);
            },
            icon: Icon(Icons.add),
            padding: const EdgeInsets.symmetric(horizontal: 20),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: ListView.builder(
        itemCount: widget.meals.length,
        itemBuilder: (ctx, index) => Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  widget.meals[index].imageUrls[0].startsWith("assets/")
                      ? AssetImage(widget.meals[index].imageUrls[0])
                      : NetworkImage(widget.meals[index].imageUrls[0])
                          as ImageProvider,
            ),
            title: Text(widget.meals[index].title),
            subtitle: Text("\$ ${widget.meals[0].price}"),
            trailing: IconButton(
              onPressed: () => widget.deleteMeal(widget.meals[index].id),
              icon: Icon(Icons.delete),
            ),
          ),
        ),
      ),
    );
  }
}
