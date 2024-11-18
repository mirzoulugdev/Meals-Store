class Meal {
  final String id;
  final String title;
  final List<String> imageUrls;
  final String description;
  final List<String> ingredient;
  final int preparingTime;
  final double price;
  final String categoryId;
  bool isLike = false;

  Meal({
    required this.id,
    required this.title,
    required this.imageUrls,
    required this.description,
    required this.ingredient,
    required this.preparingTime,
    required this.price,
    required this.categoryId,
    this.isLike = false,
  });
}

class Meals {
  List<Meal> _list = [
    Meal(
      id: "m1",
      title: "Lavash",
      imageUrls: [
        "assets/images/lavash.jpg",
      ],
      description: "Ajoyib Lavash",
      ingredient: ["Go'sht", "Un", "Suv", "Ziravorlar"],
      preparingTime: 10,
      price: 12,
      categoryId: "c1",
    ),
    Meal(
      id: "m2",
      title: "Burger",
      imageUrls: ["assets/images/burger.jpg", "assets/images/burger2.jpg"],
      description: "Ajoyib Burger",
      ingredient: ["Un", "Suv", "Go'sht", "Non"],
      preparingTime: 25,
      price: 15,
      categoryId: "c1",
    ),
    Meal(
      id: "m3",
      title: "Osh",
      imageUrls: ["assets/images/plov.jpg", "assets/images/plov2.jpg"],
      description: "Ajoyib va Ma'zali Osh",
      ingredient: ["Gurunch", "Yog'", "Go'sht"],
      preparingTime: 30,
      price: 20,
      categoryId: "c2",
    ),
    Meal(
      id: "m4",
      title: "Qovurma Lag'mon",
      imageUrls: [
        "assets/images/qovurma_lagmon.jpg",
        "assets/images/qovurma_lagmon2.jpg",
        "assets/images/qovurma_lagmon3.jpg",
      ],
      description: "Arzon narxda. Va ajoyib Qovurma Lag'mon",
      ingredient: ["Yog'", "Un", "Suv"],
      preparingTime: 25,
      price: 30,
      categoryId: "c2",
    ),
    Meal(
      id: "m5",
      title: "Pizza",
      imageUrls: [
        "assets/images/pizza.jpg",
        "assets/images/pizza2.jpg",
        "assets/images/pizza3.jpg",
      ],
      description: "Ajoyib Pizza",
      ingredient: ["suv", "Un", "Ziravorlar"],
      preparingTime: 12,
      price: 10,
      categoryId: "c3",
    ),
    Meal(
      id: "m6",
      title: "Kebab",
      imageUrls: ["assets/images/kebab.jpg"],
      description: "Ajoyib Kebab",
      ingredient: ["GO'sht", "Un"],
      preparingTime: 18,
      price: 5,
      categoryId: "c3",
    ),
    Meal(
      id: "m7",
      title: "Gazak",
      imageUrls: ["assets/images/france_food.jpg"],
      description: "Ajoyib Gazak",
      ingredient: ["Kartoshka", "Piyoz"],
      preparingTime: 20,
      price: 30,
      categoryId: "c6",
    ),
    Meal(
      id: "m8",
      title: "Mountain Dew",
      imageUrls: [
        "assets/images/mountain_dew.jpg",
        "assets/images/mountain_dew2.jpg",
      ],
      description: "Ajoyib Ichimlik",
      ingredient: ["Suv", "Ranglar"],
      preparingTime: 5,
      price: 5,
      categoryId: "c5",
    ),
    Meal(
      id: "m9",
      title: "Schweppes",
      imageUrls: [
        "assets/images/cola.jpg",
        "assets/images/cola2.jpg",
        "assets/images/cola3.jpg",
      ],
      description: "Ajoyib Ichimlikdan bahra oling!",
      ingredient: ["Ranglar", "Shakar"],
      preparingTime: 5,
      price: 5,
      categoryId: "c5",
    ),
    Meal(
      id: "m10",
      title: "Olivia salati",
      imageUrls: [
        "assets/images/salad.jpg",
        "assets/images/salad2.jpg",
        "assets/images/salad3.jpg",
      ],
      description: "Ajoyib Olivia salatini iste'mol qilib bahramand bo'ling",
      ingredient: ["Mayonez", "Gorox"],
      preparingTime: 10,
      price: 10,
      categoryId: "c4",
    ),
  ];

  List<Meal> _favorites = [];

  List<Meal> get list {
    return _list;
  }

  List<Meal> get favorites {
    return _favorites;
  }

  void toggleLike(String mealId) {
    final mealIndex = _favorites.indexWhere((meal) => meal.id == mealId);
    if (mealIndex < 0) {
      _favorites.add(list.firstWhere((meal) => meal.id == mealId));
    } else {
      _favorites.removeWhere((meal) => meal.id == mealId);
    }
  }

  void addNewMeal(Meal meal) {
    _list.add(meal);
  }

  void deleteMeal(String id) {
    _list.removeWhere((meal) => meal.id == id);
  }
}
