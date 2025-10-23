import 'package:apprestaurant/screens/explore_page.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class Home extends StatefulWidget {
  const Home({super.key});

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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yummy"),
        elevation: 4,
        backgroundColor: Theme.of(context).colorScheme.surface,
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.onSurface,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Theme.of(context).brightness == Brightness.dark
                  ? Icons.wb_sunny_outlined
                  : Icons.dark_mode_outlined,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            tooltip: Theme.of(context).brightness == Brightness.dark
                ? 'Modo claro'
                : 'Modo escuro',
            onPressed: () => AppRestaurantState.of(context)?.toggleTheme(),
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
