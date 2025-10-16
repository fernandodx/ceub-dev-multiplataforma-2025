import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/login_screen.dart';
import '../widgets/bottom_nav.dart';
import 'models/recipe.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CookBook App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: Colors.orange.shade50,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<Recipe> recipes = [];

  @override
  void initState() {
    super.initState();
    _checkLogin();
  }

  Future<void> _checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final isLogged = prefs.getBool('isLogged') ?? false;

    // Exemplo simples de receitas para teste
    recipes = [
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

    await Future.delayed(const Duration(seconds: 1)); // pequeno delay para UX

    if (isLogged) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => BottomNav(recipes: recipes)),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator(color: Colors.orange)),
    );
  }
}
