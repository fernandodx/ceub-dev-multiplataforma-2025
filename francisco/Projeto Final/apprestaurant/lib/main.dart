import 'package:flutter/material.dart';
import 'screens/explore_page.dart';

void main() {
  runApp(const AppRestaurant());
}

class AppRestaurant extends StatelessWidget {
  const AppRestaurant({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APP DEV',
      theme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(
          primary: Color(0xFF8B5CF6),
          secondary: Color(0xFF8B5CF6),
          surface: Color(0xFF1F1F1F),
          background: Color(0xFF121212),
          onBackground: Colors.white,
          onSurface: Colors.white,
        ),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF1F1F1F),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        scaffoldBackgroundColor: Color(0xFF121212),
        cardTheme: CardThemeData(
          color: Color(0xFF1F1F1F),
          elevation: 2,
        ),
      ),
      home: const ExplorePage(),
    );
  }
}

