import 'package:apprestaurant/screens/explore_page.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final ThemeMode themeMode;
  final VoidCallback onToggleTheme;

  const Home({
    super.key,
    required this.themeMode,
    required this.onToggleTheme,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int tab = 0;
  List<NavigationDestination> appDestinations = [
    NavigationDestination(
      icon: Icon(Icons.home_outlined),
      label: 'Home',
      selectedIcon: Icon(Icons.home_filled),
    ),
    NavigationDestination(
      icon: Icon(Icons.list_outlined),
      label: 'Pedidos',
      selectedIcon: Icon(Icons.list),
    ),
    NavigationDestination(
      icon: Icon(Icons.person_outline),
      label: 'Conta',
      selectedIcon: Icon(Icons.person),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Laricca"),
        elevation: 4,
        backgroundColor: Theme.of(context).colorScheme.surface,
        actions: [
          IconButton(
            icon: Icon(
              widget.themeMode == ThemeMode.light
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined,
            ),
            onPressed: widget.onToggleTheme,
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