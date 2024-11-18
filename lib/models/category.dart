class Category {
  final String id;
  final String title;
  final String imageUrl;

  const Category(
      {required this.id, required this.title, required this.imageUrl});
}

class Categories {
  List<Category> _list = [
    Category(
        id: "c1", title: "Fast Food", imageUrl: "assets/images/burger.jpg"),
    Category(
        id: "c2", title: "Milliy taomlar", imageUrl: "assets/images/plov.jpg"),
    Category(
        id: "c3",
        title: "Italiya Taomlari",
        imageUrl: "assets/images/pizza.jpg"),
    Category(id: "c4", title: "Saladlar", imageUrl: "assets/images/salad.jpg"),
    Category(
        id: "c5", title: "Ichimliklar", imageUrl: "assets/images/cola.jpg"),
    Category(
        id: "c6",
        title: "Fransiya Taomlari",
        imageUrl: "assets/images/france_food.jpg"),
  ];

  List<Category> get list {
    return _list;
  }
}
