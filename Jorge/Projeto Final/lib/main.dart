import 'package:app_restaurant/home.dart';
import 'package:app_restaurant/models/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AppRestaurant());
}

class AppRestaurant extends StatefulWidget {
  const AppRestaurant({super.key});

  @override
  State<AppRestaurant> createState() => _AppRestaurantState();
}

class _AppRestaurantState extends State<AppRestaurant> {
  ThemeMode themeMode = ThemeMode.light;
  ColorSelection colorSelected = ColorSelection.pink;

  void _toggleThemeMode() {
    setState(() {
      themeMode = themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = themeMode == ThemeMode.dark;

    return MaterialApp(
      title: "Yummy",
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: ThemeData(
        colorSchemeSeed: colorSelected.color,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: colorSelected.color,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: Home(
        isDark: isDark,
        onToggleTheme: _toggleThemeMode,
      ),
    );
  }
}
