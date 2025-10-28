import 'package:app_restaurant/screens/explore_page.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
    required this.isDark,
    required this.onToggleTheme,
  });

  final bool isDark;
  final VoidCallback onToggleTheme;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int tab = 0;

  List<NavigationDestination> appDestinations = const [
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        elevation: 4,
        backgroundColor: Theme.of(context).colorScheme.surface,
        actions: [
          IconButton(
            tooltip: widget.isDark ? 'Modo claro' : 'Modo escuro',
            onPressed: widget.onToggleTheme,
            icon: Icon(widget.isDark ? Icons.light_mode : Icons.dark_mode),
          ),
        ],
      ),
      body: IndexedStack(
        index: tab,
        children: const [
          ExplorePage(),
          Center(child: Text("Pedidos", style: TextStyle(fontSize: 32))),
          Center(child: Text("Conta", style: TextStyle(fontSize: 32))),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: tab,
        onDestinationSelected: (index) {
          setState(() => tab = index);
        },
        destinations: appDestinations,
      ),
    );
  }
}
