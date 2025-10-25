import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text.trim();
      String senha = _senhaController.text.trim();

      if (email == "aluno@ceub.edu.br" && senha == "12345678") {
        Fluttertoast.showToast(
          msg: "Login realizado com sucesso!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
      } else {
        // Mostra erro nos campos
        Fluttertoast.showToast(
          msg: "E-mail ou senha incorretos",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
           
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "E-mail",
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Informe o e-mail";
                  }
                  // Validação básica de e-mail
                  if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$")
                      .hasMatch(value)) {
                    return "E-mail inválido";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: _senhaController,
                decoration: const InputDecoration(
                  labelText: "Senha",
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Informe a senha";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 32),

              ElevatedButton(
                onPressed: _login,
                child: const Text("Entrar"),
              ),
            ],
          ),
        ),
      ),
    ); 
  }
}