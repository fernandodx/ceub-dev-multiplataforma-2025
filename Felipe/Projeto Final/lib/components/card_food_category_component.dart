import 'package:apprestaurant/models/models.dart';
import 'package:flutter/material.dart';

class CardFoodCategoryComponent extends StatefulWidget {
  final FoodCategory foodCategory;

  const CardFoodCategoryComponent({required this.foodCategory, super.key});

  @override
  State<CardFoodCategoryComponent> createState() =>
      _CardFoodCategoryComponentState();
}

class _CardFoodCategoryComponentState extends State<CardFoodCategoryComponent> {
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
                    //Imagem da categoria
                    Image.network(
                      widget.foodCategory.imageUrl,
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

            //Nome da categoria
            ListTile(
              title: Text(
                widget.foodCategory.name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              onTap: () => debugPrint("Detalhar categoria"),
            ),
          ],
        ),
      ),
    );
  }
}
