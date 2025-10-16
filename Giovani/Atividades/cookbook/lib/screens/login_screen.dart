import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/recipe.dart';
import '../widgets/bottom_nav.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final List<Recipe> _recipes = [
    Recipe(
      title: "Lasanha Bolonhesa",
      imageUrl: "assets/images/lasanha-bolonhesa.jpg",
      time: 60,
      serves: 4,
      price: 30.0,
      ingredients: ["Massa", "Carne", "Molho", "Queijo"],
      category: "Pratos",
    ),
    Recipe(
      title: "Milkshake de Chocolate",
      imageUrl: "assets/images/milkshake.jpeg",
      time: 10,
      serves: 1,
      price: 12.0,
      ingredients: ["Leite", "Chocolate", "Sorvete"],
      category: "Bebidas",
    ),
    Recipe(
      title: "Bolo de Cenoura",
      imageUrl: "assets/images/bolo.jpg",
      time: 45,
      serves: 8,
      price: 25.0,
      ingredients: ["Cenoura", "Farinha", "Açúcar", "Ovos"],
      category: "Sobremesas",
    ),
    Recipe(
      title: "Hambúrguer Caseiro",
      imageUrl: "assets/images/hamburguer.jpg",
      time: 30,
      serves: 2,
      price: 18.0,
      ingredients: ["Pão", "Carne", "Queijo", "Molho"],
      category: "Lanches",
    ),
  ];

  Future<void> _login(BuildContext context) async {
    if (_emailController.text == "aluno@ceub.edu.br" &&
        _passwordController.text == "12345678") {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLogged', true); // 🔸 salva login

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login realizado com sucesso!')),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => BottomNav(recipes: _recipes),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('E-mail ou senha incorretos!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade100,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/logo.png', height: 180),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'E-mail',
                        prefixIcon: Icon(Icons.email),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Senha',
                        prefixIcon: Icon(Icons.lock),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () => _login(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Entrar',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
