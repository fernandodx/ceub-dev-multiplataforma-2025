import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
        title: const Text("Perfil"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/perfil.png'),
              ),
              const SizedBox(height: 20),
              const Text(
                "Giovani Melo",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text("Telefone: (61) 99999-9999", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 4),
              const Text("E-mail: aluno@ceub.edu.br", style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
