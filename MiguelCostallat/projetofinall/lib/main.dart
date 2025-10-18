import 'package:flutter/material.dart';
import 'package:projetofinall/models/models/constants.dart';

import 'home.dart';


void main() {
  runApp(AppRestaurant());
}

class AppRestaurant extends StatefulWidget {
  const AppRestaurant({super.key});

  @override
  State<AppRestaurant> createState() => _AppRestaurantState();
}

class _AppRestaurantState extends State<AppRestaurant> {
  ThemeMode themeMode = ThemeMode.light;
  ColorSelection colorSelected = ColorSelection.orange;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "4 cadeira t'spera",
      debugShowCheckedModeBanner: false, //tirar a flag da tela debug
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
      home: Home(),
    );
  }
}
