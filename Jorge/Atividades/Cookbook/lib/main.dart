import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const CookbookApp());
}

class CookbookApp extends StatelessWidget {
  const CookbookApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cookbook Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
