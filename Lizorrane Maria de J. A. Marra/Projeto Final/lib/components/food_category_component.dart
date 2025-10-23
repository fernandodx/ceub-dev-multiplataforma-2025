import 'package:flutter/material.dart';
import 'package:apprestaurant/models/food_category.dart';
import 'card_food_category_component.dart';

class FoodCategoryComponent extends StatelessWidget {
  final List<FoodCategory> foodCategories;

  const FoodCategoryComponent({required this.foodCategories});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              "Categorias",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodCategories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: CardFoodCategoryComponent(
                    foodCategory: foodCategories[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
