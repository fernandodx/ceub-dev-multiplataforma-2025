
import 'package:projetofinall/models/models/models.dart';
import 'package:flutter/material.dart';

class RestaurantComponent extends StatelessWidget {
  final List<Restaurant> restaurants;

  const RestaurantComponent({required this.restaurants});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Restaurantes"),
        SizedBox(
          height: 230,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: restaurants.length,
            itemBuilder: (context, index) {
              Restaurant restaurant = restaurants[index];

              return Card(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(8),
                      ),
                      child: AspectRatio(
                        aspectRatio: 2,
                        child: Stack(
                          children: [
                            Image.network(
                              restaurant.imageUrl,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              top: 4,
                              right: 4,
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.favorite_border_outlined),
                                iconSize: 30,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(restaurant.name),
                      subtitle: Text(
                        restaurant.attributes,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onTap: ()=> print("detalhar Restaurante"),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
