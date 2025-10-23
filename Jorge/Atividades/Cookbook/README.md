# Cookbook Login com Firebase

**Atividade da disciplina de Desenvolvimento Multiplataforma (CEUB)**  
Implementação de uma tela de login moderna em **Flutter**, com autenticação via **Firebase Authentication (Email/Senha)**.

---

## 🚀 Tecnologias utilizadas

| Tecnologia | Versão | Descrição |
|-------------|---------|-----------|
| Flutter | 3.35.5 | Framework multiplataforma (Web, Android, iOS, Desktop) |
| Dart | 3.9.2 | Linguagem usada no Flutter |
| Firebase Authentication | 6.1.0 | Login seguro com e-mail e senha |
| Firebase Core | 4.1.1 | Integração central com os serviços Firebase |
| Material Design 3 | - | Interface moderna e responsiva |

---

## Estrutura do projeto

lib/
├── firebase_options.dart # Configurações automáticas do Firebase (geradas pelo CLI)
├── main.dart # Ponto de entrada do app
├── pages/
│ ├── login_page.dart # Tela de login (validação + autenticação)
│ └── home_page.dart # Tela pós-login com botão de logout
├── widgets/
│ └── custom_text_field.dart # Componente customizado para campos de formulário
pubspec.yaml # Dependências do projeto

yaml
Copy code

---

## Funcionalidades

**Validação de formulário** (e-mail e senha)  
**Autenticação real com Firebase**  
**Feedback visual via SnackBar e mensagens de erro**  
**Redirecionamento automático após login bem-sucedido**  
**Botão de logout com FirebaseAuth.signOut()**  
**Design limpo, responsivo e intuitivo (Material 3)**  

---

##  Instalação e execução

### Pré-requisitos
- Flutter SDK (≥ 3.3.0)
- Conta no [Firebase Console](https://console.firebase.google.com)
- Git instalado
- Navegador (para executar no modo Web)

### Clonar o repositório
```bash
git clone https://github.com/JorgeMJNT/ceub-dev-multiplataforma-2025.git
cd ceub-dev-multiplataforma-2025/Jorge/Atividades/Cookbook