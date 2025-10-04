import 'package:flutter/material.dart';
import 'package:helloworld/recipe.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;
  const RecipeDetail({super.key, required this.recipe});

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  int _sliderval = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.recipe.label)),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagem da receita
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                widget.recipe.imgUrl,
                fit: BoxFit.cover,
              ),
            ),

            // Título
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.recipe.label,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Ingredientes
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Ingredientes:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: widget.recipe.ingredients.length,
                itemBuilder: (context, index) {
                  final ingredient = widget.recipe.ingredients[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("• ",
                            style: TextStyle(fontSize: 18)), // bullet
                        Expanded(
                          child: Text(
                            "${ingredient.qtd} ${ingredient.mensure} ${ingredient.name}",
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Text("Serve quantidade de Pessoas: "),
            Slider(
                min: 1,
                max: 10,
                divisions: 9,
                label: "Serve ${_sliderval * widget.recipe.id} Pessoas",
                value: _sliderval.toDouble(),
                onChanged: (newValueSlider) {
                  setState(() {
                    _sliderval = newValueSlider.round();
                  });
                },
            ),
          ],
        ),
      ),
    );
  }
}
