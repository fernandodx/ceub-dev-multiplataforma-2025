import 'package:apprestaurant/models/models.dart';
import 'package:flutter/material.dart';

class CardRestaurantComponent extends StatefulWidget {
  final Restaurant restaurant;

  CardRestaurantComponent({required this.restaurant});

  @override
  State<CardRestaurantComponent> createState() =>
      _CardRestaurantComponentState();
}

class _CardRestaurantComponentState extends State<CardRestaurantComponent> {
  bool isLiked = false;

  void _toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              child: AspectRatio(
                aspectRatio: 2,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(widget.restaurant.imageUrl,
                        fit: BoxFit.cover),
                    Positioned(
                      top: 4,
                      right: 8,
                      child: IconButton(
                        onPressed: _toggleLike,
                        icon: Icon(
                          isLiked
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                        ),
                        iconSize: 30,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              title: Text(
                widget.restaurant.name,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              subtitle: Text(
                widget.restaurant.attributes,
                style: Theme.of(context).textTheme.bodySmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () => print("Detalhar restaurante"),
            ),
          ],
        ),
      ),
    );
  }
}