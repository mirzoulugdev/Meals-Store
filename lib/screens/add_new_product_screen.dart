import 'package:flutter/material.dart';

import '../models/category.dart';
import './custom_image_input.dart';
import '../models/meal.dart';

class addNewProductScreen extends StatefulWidget {
  final List<Category> categories;
  final Function addFunction;

  addNewProductScreen({
    super.key,
    required this.categories,
    required this.addFunction,
  });

  static const routeName = '/add-new-product';

  @override
  State<addNewProductScreen> createState() => _addNewProductScreenState();
}

class _addNewProductScreenState extends State<addNewProductScreen> {
  late String categoryId;
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _ingredientsController = TextEditingController();
  final _priceController = TextEditingController();
  final _preparingTimeController = TextEditingController();
  final _mainImageCOntroller = TextEditingController();
  final _firstImageCOntroller = TextEditingController();
  final _secondImageCOntroller = TextEditingController();
  final _thirdImageCOntroller = TextEditingController();

  // ignore: unused_field
  List<String> _imageUrls = [];

  void _save() {
    final title = _titleController.text;
    final desc = _descriptionController.text;
    final ingredient = _ingredientsController.text;
    final price = _priceController.text;
    final preparing = _preparingTimeController.text;
    final mainImage = _mainImageCOntroller.text;
    final firstImage = _firstImageCOntroller.text;
    final secondImage = _secondImageCOntroller.text;
    final thirdImage = _thirdImageCOntroller.text;

    if (title.isEmpty ||
        desc.isEmpty ||
        ingredient.isEmpty ||
        price.isEmpty ||
        preparing.isEmpty ||
        mainImage.isEmpty ||
        firstImage.isEmpty ||
        secondImage.isEmpty ||
        thirdImage.isEmpty) {
      return;
    }
    final List<String> ingredients = ingredient.split(",");
    final List<String> imageUrls = [
      mainImage,
      firstImage,
      secondImage,
      thirdImage
    ];

    widget.addFunction(Meal(
        id: UniqueKey().toString(),
        title: title,
        imageUrls: imageUrls,
        description: desc,
        ingredient: ingredients,
        preparingTime: int.parse(preparing),
        price: double.parse(price),
        categoryId: categoryId));
    Navigator.of(context).pop(true);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoryId = widget.categories[0].id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Yangi Ovqat"),
        actions: [
          IconButton(
            onPressed: _save,
            icon: Icon(
              Icons.save,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              DropdownButton(
                isExpanded: true,
                value: categoryId,
                items: widget.categories
                    .map(
                      (category) => DropdownMenuItem(
                        child: Text(category.title),
                        value: category.id,
                      ),
                    )
                    .toList(),
                onChanged: (id) {
                  setState(
                    () {
                      categoryId = id as String;
                    },
                  );
                },
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: "Ovqat nomi",
                ),
                controller: _titleController,
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: "Ta'rifi",
                ),
                maxLines: 5,
                controller: _descriptionController,
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: "Ovqat tarkibi (Misol uchun: Pomidor, Go'sht...)",
                ),
                controller: _ingredientsController,
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: "Ovqat narxi",
                ),
                controller: _priceController,
                keyboardType: TextInputType.number,
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: "Ovqat tayyorlanish vaqti (minut)",
                ),
                controller: _preparingTimeController,
              ),
              SizedBox(
                height: 10,
              ),
              CustomImageInput(
                imageController: _mainImageCOntroller,
                label: "Rasm 1 linkini kiriting!",
              ),
              SizedBox(
                height: 10,
              ),
              CustomImageInput(
                imageController: _firstImageCOntroller,
                label: "Rasm 2 linkini kiriting!",
              ),
              SizedBox(
                height: 10,
              ),
              CustomImageInput(
                imageController: _secondImageCOntroller,
                label: "Rasm 3 linkini kiriting!",
              ),
              SizedBox(
                height: 10,
              ),
              CustomImageInput(
                imageController: _thirdImageCOntroller,
                label: "Rasm 4 linkini kiriting!",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
