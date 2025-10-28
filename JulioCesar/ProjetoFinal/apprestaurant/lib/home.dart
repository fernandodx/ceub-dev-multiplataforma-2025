import 'package:apprestaurant/screens/explore_page.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final ThemeMode themeMode;
  final VoidCallback onThemeModePressed;

  const Home({
    super.key,
    required this.themeMode,
    required this.onThemeModePressed,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int tab = 0;
  List<NavigationDestination> appDestinations = [
    NavigationDestination(
      icon: Icon(Icons.home_outlined),
      label: "Home",
      selectedIcon: Icon(Icons.home),
    ),
    NavigationDestination(
      icon: Icon(Icons.list_outlined),
      label: "Pedidos",
      selectedIcon: Icon(Icons.list),
    ),
    NavigationDestination(
      icon: Icon(Icons.person_outlined),
      label: "Conta",
      selectedIcon: Icon(Icons.person),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkMode = widget.themeMode == ThemeMode.dark;
    final themeIcon =
    isDarkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined;

    return Scaffold(
      appBar: AppBar(
        title: Text("Restaurante do Julin"),
        elevation: 0,
        scrolledUnderElevation: 2.0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        actions: [
          IconButton(
            icon: Icon(themeIcon),
            onPressed: widget.onThemeModePressed,
            tooltip: "Mudar tema",
          ),
        ],
      ),
      body: IndexedStack(
        index: tab,
        children: [
          ExplorePage(),
          Center(child: Text("Pedidos", style: TextStyle(fontSize: 32))),
          Center(child: Text("Conta", style: TextStyle(fontSize: 32))),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: tab,
        onDestinationSelected: (index) {
          setState(() {
            tab = index;
          });
        },
        destinations: appDestinations,
      ),
    );
  }
}