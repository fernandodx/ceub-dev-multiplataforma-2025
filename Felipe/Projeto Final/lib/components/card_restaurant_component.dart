import 'package:apprestaurant/models/models.dart';
import 'package:flutter/material.dart';

class CardRestaurantComponent extends StatefulWidget {
  final Restaurant restaurant;

  const CardRestaurantComponent({required this.restaurant, super.key});

  @override
  State<CardRestaurantComponent> createState() =>
      _CardRestaurantComponentState();
}

class _CardRestaurantComponentState extends State<CardRestaurantComponent> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius:
              const BorderRadius.vertical(top: Radius.circular(16)),
              child: AspectRatio(
                aspectRatio: 2,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    //Imagem principal do restaurante
                    Image.network(
                      widget.restaurant.imageUrl,
                      fit: BoxFit.cover,
                    ),

                    //Botão de curtir
                    Positioned(
                      top: 6,
                      right: 8,
                      child: IconButton(
                        icon: Icon(
                          isLiked
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          color: isLiked
                              ? Colors.red
                              : Theme.of(context).colorScheme.onSurface,
                          size: 28,
                        ),
                        onPressed: () {
                          setState(() {
                            isLiked = !isLiked;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //Nome e atributos do restaurante
            ListTile(
              title: Text(
                widget.restaurant.name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: Text(
                widget.restaurant.attributes,
                style: Theme.of(context).textTheme.bodySmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () => debugPrint("Detalhar restaurante"),
            ),
          ],
        ),
      ),
    );
  }
}
