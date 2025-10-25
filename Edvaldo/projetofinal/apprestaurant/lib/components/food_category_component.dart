import 'package:apprestaurant/components/card_food_category_component.dart';
import 'package:apprestaurant/models/models.dart';
import 'package:flutter/material.dart';

class FoodCategoryComponent extends StatelessWidget {
  final List<FoodCategory> categories;

  const FoodCategoryComponent({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
            child: Text(
              "Categorias",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 240,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return CardFoodCategoryComponent(category: categories[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
