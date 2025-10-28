import 'package:flutter/material.dart';
import 'package:app_restaurant/models/models.dart';

class CategoryComponent extends StatelessWidget {
  final List<FoodCategory> categories;
  final void Function(FoodCategory category)? onTap;

  const CategoryComponent({
    super.key,
    required this.categories,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (categories.isEmpty) return const SizedBox.shrink();

    final colorScheme = Theme.of(context).colorScheme;
    final textColor = colorScheme.onSurface; // ajusta automaticamente ao tema

    return Container(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              "Categorias",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ),
          SizedBox(
            height: 180, // 🔹 aumentamos a altura do carrossel
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: categories.length,
              separatorBuilder: (_, __) => const SizedBox(width: 16),
              itemBuilder: (context, index) {
                final c = categories[index];
                final hasImage = c.imageUrl.trim().isNotEmpty;

                return SizedBox(
                  width: 160, // 🔹 aumentamos a largura do card
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () => onTap?.call(c),
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            flex: 3,
                            child: hasImage
                                ? Image.network(
                              c.imageUrl,
                              fit: BoxFit.cover,
                            )
                                : Container(
                              color: colorScheme.surfaceVariant,
                              child: const Icon(Icons.category_outlined,
                                  size: 40),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.center,
                              color: colorScheme.surface,
                              padding:
                              const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                c.name,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 16, // 🔹 maior
                                  fontWeight: FontWeight.w600,
                                  color: textColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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