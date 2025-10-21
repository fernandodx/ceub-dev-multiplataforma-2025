import 'package:apprestaurant/components/card_restaurant_component.dart';
import 'package:apprestaurant/models/models.dart';
import 'package:flutter/material.dart';

class RestaurantComponent extends StatelessWidget {
  final List<Restaurant> restaurants;

  const RestaurantComponent({super.key, required this.restaurants});

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
              "Restaurantes",
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
              itemCount: restaurants.length,
              itemBuilder: (context, index) {
                return CardRestaurantComponent(restaurant: restaurants[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
