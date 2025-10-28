import 'package:apprestaurant/components/card_category.dart';
import 'package:apprestaurant/components/card_restaurant_component.dart';
import 'package:apprestaurant/models/models.dart';
import 'package:flutter/material.dart';

class CategoryComponent extends StatelessWidget {
  final List<FoodCategory> categories;

  const CategoryComponent({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
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
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return CardCategoryComponent(category: categories[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}