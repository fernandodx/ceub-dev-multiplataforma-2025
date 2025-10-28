import 'package:apprestaurant/models/models.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CardCategoryComponent extends StatefulWidget {
  final FoodCategory category;

  CardCategoryComponent({required this.category});

  @override
  State<CardCategoryComponent> createState() => _CardCategoryComponentState();
}

class _CardCategoryComponentState extends State<CardCategoryComponent> {
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
                    Image.network(widget.category.imageUrl, fit: BoxFit.cover),
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
                        color: isLiked ? Colors.red : Colors.grey[600],
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
                '${widget.category.numberOfRestaurants} restaurantes.',
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