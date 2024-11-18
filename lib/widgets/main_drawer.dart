import 'package:flutter/material.dart';
import 'package:meals/screens/products_screen.dart';
import 'package:meals/screens/tab_screens.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget _buildMenuItem(IconData icon, String title, Function() handle) {
    return ListTile(
      onTap: handle,
      leading: Icon(icon),
      title: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: const Text(
              "MENU",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          _buildMenuItem(
            Icons.home,
            "Bosh Sahifa",
            () {
              Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
            },
          ),
          Divider(
            height: 0,
          ),
          _buildMenuItem(
            Icons.category,
            "Mahsulotlar",
            () {
              Navigator.of(context)
                  .pushReplacementNamed(ProductsScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
