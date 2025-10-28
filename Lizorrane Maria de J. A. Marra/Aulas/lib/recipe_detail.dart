import 'package:flutter/material.dart';
import 'package:recipes_class/recipe.dart';

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
          spacing: 16,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(widget.recipe.imgUrl),
            ),
            Text(widget.recipe.label, style: TextStyle(fontSize: 20)),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: widget.recipe.ingredients.length,
                itemBuilder: (context, index) {
                  final ingredient = widget.recipe.ingredients[index];
                  return Text(
                    "${ingredient.qtd * _sliderval} ${ingredient.mensure} ${ingredient.name}",
                  );
                },
              ),
            ),
            Text("Serve quantidade de pessoas:"),
            Slider(
              min: 1,
              max: 10,
              divisions: 9,
              label: "${_sliderval * widget.recipe.id} Pessoas Servindo",
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
