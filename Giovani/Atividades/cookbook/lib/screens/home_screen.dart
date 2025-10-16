import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../widgets/recipe_card.dart';
import 'recipe_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  final List<Recipe> recipes;
  final bool showOnlyFavorites;

  const HomeScreen({
    super.key,
    required this.recipes,
    this.showOnlyFavorites = false,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Recipe> _recipes;
  String _selectedCategory = 'Todos';

  final List<Map<String, dynamic>> _categories = [
    {'name': 'Todos', 'icon': Icons.all_inclusive},
    {'name': 'Bebidas', 'icon': Icons.local_drink},
    {'name': 'Pratos', 'icon': Icons.restaurant},
    {'name': 'Sobremesas', 'icon': Icons.icecream},
    {'name': 'Lanches', 'icon': Icons.fastfood},
  ];

  @override
  void initState() {
    super.initState();
    _recipes = widget.recipes;
  }

  void _toggleFavorite(Recipe recipe) {
    setState(() {
      recipe.isFavorite = !recipe.isFavorite;
    });
  }

  void _selectCategory(String category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  List<Recipe> get _filteredRecipes {
    if (_selectedCategory == 'Todos') {
      return widget.showOnlyFavorites
          ? _recipes.where((r) => r.isFavorite).toList()
          : _recipes;
    }

    final filtered = _recipes
        .where((r) => r.category.toLowerCase() ==
            _selectedCategory.toLowerCase())
        .toList();

    return widget.showOnlyFavorites
        ? filtered.where((r) => r.isFavorite).toList()
        : filtered;
  }

  @override
  Widget build(BuildContext context) {
    final displayList = _filteredRecipes;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.showOnlyFavorites
            ? "Minhas Receitas Favoritas"
            : "Minhas Receitas"),
      ),
      body: Column(
        children: [
          // ====== FILTRO DE CATEGORIAS ======
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            color: Colors.white,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _categories.map((cat) {
                  final isSelected = cat['name'] == _selectedCategory;
                  return GestureDetector(
                    onTap: () => _selectCategory(cat['name']),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.orange.shade100
                            : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isSelected
                              ? Colors.orange
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(cat['icon'],
                              color: isSelected
                                  ? Colors.orange
                                  : Colors.grey.shade700),
                          const SizedBox(height: 4),
                          Text(
                            cat['name'],
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: isSelected
                                  ? Colors.orange.shade800
                                  : Colors.grey.shade800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          // ====== LISTA DE RECEITAS FILTRADA ======
          Expanded(
            child: displayList.isEmpty
                ? const Center(child: Text("Nenhuma receita encontrada."))
                : ListView.builder(
                    itemCount: displayList.length,
                    itemBuilder: (context, index) {
                      final recipe = displayList[index];
                      return RecipeCard(
                        recipe: recipe,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                RecipeDetailScreen(recipe: recipe),
                          ),
                        ),
                        onFavoriteToggle: () => _toggleFavorite(recipe),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
