import 'package:flutter/material.dart';

import '../models/meal.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MealDetailsScreen extends StatefulWidget {
  static const routeName = '/meal-details';

  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  int activeImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 350.0,
                initialPage: activeImageIndex,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(
                    () {
                      activeImageIndex == index;
                    },
                  );
                },
              ),
              items: meal.imageUrls.map((image) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  child: meal.imageUrls[0].startsWith("assets/")
                      ? Image.asset(
                          image,
                          fit: BoxFit.cover,
                        )
                      : Image.network(
                          image,
                          fit: BoxFit.cover,
                        ),
                );
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: meal.imageUrls.map(
                (image) {
                  final imageIndex = meal.imageUrls.indexOf(image);
                  return Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: activeImageIndex == imageIndex
                          ? Colors.black
                          : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  );
                },
              ).toList(),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "${meal.price} \$",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Ta'rifi"),
                      Text(
                        meal.description,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 300,
              child: Card(
                margin: const EdgeInsets.all(10),
                child: ListView.separated(
                    padding: const EdgeInsets.all(1),
                    itemBuilder: (ctx, index) {
                      return Text(meal.ingredient[index]);
                    },
                    separatorBuilder: (ctx, index) {
                      return Divider();
                    },
                    itemCount: meal.ingredient.length),
              ),
            )
          ],
        ),
      ),
    );
  }
}
