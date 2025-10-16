import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/recipe.dart';
import '../screens/login_screen.dart';
import '../screens/recipe_detail_screen.dart';

class BottomNav extends StatefulWidget {
  final List<Recipe> recipes;

  const BottomNav({super.key, required this.recipes});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  String _selectedCategory = 'Todos';
  List<Recipe> _favoriteRecipes = [];

  List<String> categories = ['Todos', 'Bebidas', 'Pratos', 'Sobremesas', 'Lanches'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CookBook'),
        backgroundColor: Colors.orange,
        automaticallyImplyLeading: false,
      ),
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Minha Lista"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: "Sair"),
        ],
      ),
    );
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return _buildHome();
      case 1:
        return _buildFavorites();
      case 2:
        return _buildProfile();
      default:
        return Container();
    }
  }

  // =============== HOME PAGE ==================
  Widget _buildHome() {
    List<Recipe> filtered = _selectedCategory == 'Todos'
        ? widget.recipes
        : widget.recipes
            .where((r) => r.category == _selectedCategory)
            .toList();

    return Column(
      children: [
        const SizedBox(height: 10),
        _buildCategoryFilter(),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: filtered.length,
            itemBuilder: (context, index) {
              final recipe = filtered[index];
              final isFavorite = _favoriteRecipes.contains(recipe);
              return Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => RecipeDetailScreen(recipe: recipe),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                        ),
                        child: Image.asset(
                          recipe.imageUrl,
                          width: 120,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                recipe.title,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  const Icon(Icons.timer, size: 16, color: Colors.grey),
                                  const SizedBox(width: 4),
                                  Text('${recipe.time} min'),
                                  const SizedBox(width: 10),
                                  const Icon(Icons.people, size: 16, color: Colors.grey),
                                  const SizedBox(width: 4),
                                  Text('${recipe.serves} pessoas'),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text('R\$ ${recipe.price.toStringAsFixed(2)}'),
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            if (isFavorite) {
                              _favoriteRecipes.remove(recipe);
                            } else {
                              _favoriteRecipes.add(recipe);
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryFilter() {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = _selectedCategory == category;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedCategory = category;
              });
            },
            child: Container(
              width: 100,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: isSelected ? Colors.orange : Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    _getCategoryIcon(category),
                    color: isSelected ? Colors.white : Colors.orange,
                    size: 28,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    category,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.orange,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Bebidas':
        return Icons.local_drink;
      case 'Pratos':
        return Icons.restaurant;
      case 'Sobremesas':
        return Icons.cake;
      case 'Lanches':
        return Icons.fastfood;
      default:
        return Icons.menu;
    }
  }

  // =============== FAVORITOS ==================
  Widget _buildFavorites() {
    if (_favoriteRecipes.isEmpty) {
      return const Center(
        child: Text(
          "Nenhuma receita favoritada ainda.",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: _favoriteRecipes.length,
      itemBuilder: (context, index) {
        final recipe = _favoriteRecipes[index];
        return Card(
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: Image.asset(recipe.imageUrl, width: 80, fit: BoxFit.cover),
            title: Text(recipe.title),
            subtitle: Text('R\$ ${recipe.price.toStringAsFixed(2)}'),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                setState(() {
                  _favoriteRecipes.remove(recipe);
                });
              },
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => RecipeDetailScreen(recipe: recipe)),
              );
            },
          ),
        );
      },
    );
  }

  // =============== PERFIL ==================
  Widget _buildProfile() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('assets/images/perfil.png'),
          ),
          SizedBox(height: 16),
          Text("Giovani Melo", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text("Telefone: (61) 99999-9999"),
          SizedBox(height: 4),
          Text("E-mail: aluno@ceub.edu.br"),
        ],
      ),
    );
  }

  // =============== TROCA DE ABA ==================
  void _onItemTapped(int index) async {
    if (index == 3) {
      // Botão "Sair"
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('isLogged');

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
      return;
    }

    setState(() {
      _selectedIndex = index;
    });
  }
}
