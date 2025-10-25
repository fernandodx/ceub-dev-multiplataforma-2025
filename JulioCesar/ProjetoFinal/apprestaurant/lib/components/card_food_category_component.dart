import 'package:apprestaurant/models/models.dart';
import 'package:flutter/material.dart';

class CardFoodCategoryComponent extends StatefulWidget {
  final FoodCategory category;

  const CardFoodCategoryComponent({super.key, required this.category});

  @override
  State<CardFoodCategoryComponent> createState() =>
      _CardFoodCategoryComponentState();
}

class _CardFoodCategoryComponentState extends State<CardFoodCategoryComponent> {
  bool _isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: Card(
        margin: const EdgeInsets.only(right: 12.0),
        elevation: 0.5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
            side: BorderSide(
              color: Theme.of(context).colorScheme.outlineVariant.withOpacity(0.3),
              width: 1,
            )),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(widget.category.imageUrl, fit: BoxFit.cover),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Material(
                        color: Colors.white.withOpacity(0.9),
                        elevation: 1,
                        shape: CircleBorder(),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _isFavorited = !_isFavorited;
                            });
                          },
                          icon: Icon(
                            _isFavorited
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                          ),
                          iconSize: 24,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              title: Text(
                widget.category.name,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              subtitle: Text(
                "${widget.category.numberOfRestaurants} restaurantes",
                style: Theme.of(context).textTheme.bodySmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () => print("Detalhar categoria"),
            ),
          ],
        ),
      ),
    );
  }
}