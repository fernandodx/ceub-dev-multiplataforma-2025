import 'package:flutter/material.dart';

// Importar os pacotes do Firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart'; // Importar o arquivo gerado

// A função main() agora é assíncrona
void main() async {
  // Garantir que o Flutter esteja inicializado
  WidgetsFlutterBinding.ensureInitialized();
  
  // Inicializar o Firebase antes de rodar o app
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Login Demo',
      // O 'home' agora é o nosso "Portão de Autenticação"
      home: AuthGate(),
    );
  }
}

// NOVO WIDGET (O "Portão de Autenticação")
// Este widget decide qual tela mostrar (Login ou Home)
class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    // Usamos um StreamBuilder para ouvir o estado da autenticação em tempo real
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // Se o snapshot está processando (verificando o login)
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        // Se o snapshot TEM dados (User não é nulo), o usuário está logADO
        if (snapshot.hasData) {
          return const HomeScreen(); // Mostra a tela principal
        }

        // Se o snapshot NÃO tem dados (User é nulo), o usuário está deslogADO
        return const LoginScreen(); // Mostra a tela de login
      },
    );
  }
}

// NOVA TELA (Para onde o usuário vai após o login)
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Função de Logout
  void _logout() async {
    await FirebaseAuth.instance.signOut();
    // O StreamBuilder no AuthGate vai detectar a mudança (usuário nulo)
    // e automaticamente mostrar a LoginScreen.
  }

  @override
  Widget build(BuildContext context) {
    // Pega o usuário logado para exibir o e-mail
    final User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Página Principal'),
        actions: [
          // Botão de Sair
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logout,
            tooltip: 'Sair',
          ),
        ],
      ),
      body: Center(
        child: Text('Bem-vindo, ${user?.email ?? 'Usuário'}!'),
      ),
    );
  }
}

//
// SUA TELA DE LOGIN (COM A LÓGICA DE LOGIN MODIFICADA)
//
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // O método _login() agora é assíncrono
  void _login() async {
    // Valida o formulário
    if (_formKey.currentState!.validate()) {
      // Pega os valores
      String email = _emailController.text;
      String password = _passwordController.text;

      // Trocamos a lógica local por um try/catch do Firebase
      try {
        // Tenta fazer o login com o Firebase Auth
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        
        // Se o login for bem-sucedido, o AuthGate (StreamBuilder)
        // cuidará automaticamente da navegação para a HomeScreen.

      } on FirebaseAuthException catch (e) {
        // Tratamento de erros específicos do Firebase
        String errorMessage;
        if (e.code == 'user-not-found') {
          errorMessage = 'Nenhum usuário encontrado para esse e-mail.';
        } else if (e.code == 'wrong-password') {
          errorMessage = 'Senha incorreta.';
        } else {
          errorMessage = 'Ocorreu um erro. Tente novamente.';
          print('Erro do Firebase: ${e.message}');
        }
        
        // Exibe o SnackBar de erro
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        }

      } catch (e) {
        // Trata outros erros genéricos
        if (mounted) {
           ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Erro inesperado: $e'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // O seu método build() continua exatamente o MESMO!
    // Nenhuma alteração visual foi necessária.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela de Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Campo de E-mail
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                  hintText: 'Digite seu e-mail',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um e-mail.';
                  }
                  final bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value);
                  if (!emailValid) {
                    return 'Por favor, insira um e-mail válido.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              // Campo de Senha
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  hintText: 'Digite sua senha',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira uma senha.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              // Botão de Login
              ElevatedButton(
                onPressed: _login, // O método _login agora chama o Firebase
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Entrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}