import 'package:flutter/material.dart';
import '../models/recipe.dart';

class RecipeDetailScreen extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  State<RecipeDetailScreen> createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    final r = widget.recipe;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          r.title, 
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // IMAGEM
            SizedBox(
              width: double.infinity,
              height: 220,
              child: Image.asset(
                r.imageUrl,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 12),

            // TÍTULO
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                r.title,
                style: const TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 8),

            // INFORMAÇÕES BÁSICAS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const Icon(Icons.timer, size: 18, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text('${r.time} min'),
                  const SizedBox(width: 16),
                  const Icon(Icons.people, size: 18, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text('${r.serves} porções'),
                  const SizedBox(width: 16),
                  const Icon(Icons.monetization_on, size: 18, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text('R\$ ${r.price.toStringAsFixed(2)}'),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // INGREDIENTES
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Text(
                "Ingredientes",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: r.ingredients
                    .map((i) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Row(
                            children: [
                              const Icon(Icons.check, size: 18, color: Colors.indigo),
                              const SizedBox(width: 6),
                              Text(i),
                            ],
                          ),
                        ))
                    .toList(),
              ),
            ),

            const SizedBox(height: 12),

           // NUTRIENTES
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NutrientCard(title: "Calorias", value: "${r.calories} kcal"),
                  NutrientCard(title: "Carbs", value: "${r.carbs} g"),
                  NutrientCard(title: "Proteínas", value: "${r.protein} g"),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // AVALIAÇÃO
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: List.generate(5, (index) {
                  return IconButton(
                    icon: Icon(
                      index < _rating ? Icons.star : Icons.star_border,
                      color: Colors.indigo,
                    ),
                    onPressed: () {
                      setState(() {
                        _rating = index + 1;
                      });
                    },
                  );
                }),
              ),
            ),

            const SizedBox(height: 16),

            // BOTÃO SALVAR
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Avaliação feita com sucesso!')),
                  );
                },
                icon: const Icon(Icons.save, color: Colors.white),
                label: const Text(
                  "Avaliar",
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class NutrientCard extends StatelessWidget {
  final String title;
  final String value;

  const NutrientCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.indigo.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.indigo.shade100),
      ),
      child: Column(
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
