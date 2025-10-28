import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/custom_text_field.dart';
import 'home_page.dart'; // Importa a tela principal pós-login

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  String? _emailError;
  String? _passwordError;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    // ✅ Verifica se o usuário já está logado e redireciona automaticamente
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const HomePage()),
          );
        }
      });
    }
  }

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  String? _emailValidator(String? value) {
    if (value == null || value.trim().isEmpty) return 'Informe seu e-mail';
    final email = value.trim();
    if (!email.contains('@') || !email.contains('.')) return 'E-mail inválido';
    if (_emailError != null) return _emailError;
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) return 'Informe sua senha';
    if (value.length < 8) return 'Senha deve ter 8 caracteres';
    if (_passwordError != null) return _passwordError;
    return null;
  }

  Future<void> _submit() async {
    setState(() {
      _emailError = null;
      _passwordError = null;
    });

    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);

    try {
      // ✅ Autenticação real via Firebase
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailCtrl.text.trim(),
        password: _passwordCtrl.text,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login via Firebase: OK!'),
            behavior: SnackBarBehavior.floating,
          ),
        );

        // ✅ Navega para HomePage após login bem-sucedido
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomePage()),
        );
      }
    } on FirebaseAuthException catch (e) {
      // Mapeia erros comuns do Firebase para mensagens amigáveis
      String generic = 'E-mail ou senha inválidos';
      switch (e.code) {
        case 'invalid-email':
          _emailError = 'E-mail inválido';
          break;
        case 'user-disabled':
          _emailError = 'Usuário desabilitado';
          break;
        case 'user-not-found':
        case 'wrong-password':
          _emailError = generic;
          _passwordError = generic;
          break;
        case 'too-many-requests':
          _passwordError = 'Muitas tentativas. Tente novamente mais tarde.';
          break;
        case 'network-request-failed':
          _passwordError = 'Sem conexão. Verifique sua internet.';
          break;
        default:
          _passwordError = generic;
      }

      _formKey.currentState!.validate();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_emailError ?? _passwordError ?? 'Falha no login'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (_) {
      setState(() {
        _emailError = 'Ocorreu um erro inesperado.';
      });
      _formKey.currentState!.validate();
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login (Cookbook)')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const FlutterLogo(size: 80),
                  const SizedBox(height: 24),
                  CustomTextField(
                    controller: _emailCtrl,
                    label: 'E-mail',
                    hint: 'seuemail@exemplo.com',
                    icon: Icons.email_outlined,
                    validator: _emailValidator,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: _passwordCtrl,
                    label: 'Senha',
                    icon: Icons.lock_outline,
                    validator: _passwordValidator,
                    obscureText: true,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: FilledButton(
                      onPressed: _isSubmitting ? null : _submit,
                      child: _isSubmitting
                          ? const SizedBox(
                              width: 20, height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Text('Entrar'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

