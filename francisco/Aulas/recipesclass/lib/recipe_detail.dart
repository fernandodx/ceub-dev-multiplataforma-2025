import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'recipe.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;
  
  const RecipeDetail({super.key, required this.recipe});

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          widget.recipe.label,
          style: TextStyle(
            color: CupertinoColors.white,
            inherit: false,
          ),
        ),
        backgroundColor: CupertinoColors.systemOrange,
        border: Border.all(color: CupertinoColors.systemOrange),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagem da receita
            Container(
              width: double.infinity,
              height: 250,
              child: ClipRRect(
                child: Image.network(
                  widget.recipe.imgUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: CupertinoColors.systemGrey5,
                      child: Icon(
                        Icons.restaurant_menu,
                        size: 100,
                        color: CupertinoColors.systemGrey2,
                      ),
                    );
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      color: CupertinoColors.systemGrey5,
                      child: Center(
                        child: CupertinoActivityIndicator(
                          color: CupertinoColors.systemOrange,
                          radius: 15,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Título da receita
                  Text(
                    widget.recipe.label,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: CupertinoColors.systemOrange,
                      inherit: false,
                    ),
                  ),
                  SizedBox(height: 16),
                  
                  // Seção de ingredientes
                  Text(
                    'Ingredientes',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: CupertinoColors.systemOrange,
                      inherit: false,
                    ),
                  ),
                  SizedBox(height: 12),
                  
                  // Lista de ingredientes
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: CupertinoColors.systemGrey6,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: CupertinoColors.systemOrange.withOpacity(0.3)),
                    ),
                    child: Column(
                      children: widget.recipe.ingredients.map((ingredient) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            children: [
                              Icon(
                                Icons.circle,
                                size: 8,
                                color: CupertinoColors.systemOrange,
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  '${ingredient.qtd} ${ingredient.mensure} ${ingredient.name}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: CupertinoColors.label,
                                    inherit: false,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  
                  SizedBox(height: 24),
                  
                  // Botão de favoritar
                  Center(
                    child: CupertinoButton(
                      onPressed: () {
                        showCupertinoDialog(
                          context: context,
                          builder: (context) => CupertinoAlertDialog(
                            title: Text(
                              'Favoritos',
                              style: TextStyle(inherit: false),
                            ),
                            content: Text(
                              '${widget.recipe.label} adicionado aos favoritos!',
                              style: TextStyle(inherit: false),
                            ),
                            actions: [
                              CupertinoDialogAction(
                                child: Text(
                                  'OK',
                                  style: TextStyle(inherit: false),
                                ),
                                onPressed: () => Navigator.of(context).pop(),
                              ),
                            ],
                          ),
                        );
                      },
                      color: CupertinoColors.systemOrange,
                      borderRadius: BorderRadius.circular(25),
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.favorite_border, color: CupertinoColors.white),
                          SizedBox(width: 8),
                          Text(
                            'Adicionar aos Favoritos',
                            style: TextStyle(
                              color: CupertinoColors.white,
                              inherit: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
