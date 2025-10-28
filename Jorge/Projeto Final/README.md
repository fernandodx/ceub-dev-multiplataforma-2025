\# 🍽️ App Restaurant – Yummy



<p align="center">

&nbsp; <img src="assets/apprestaurant.gif" alt="Demonstração do App Restaurant" width="340"/>

</p>



<p align="center">

&nbsp; <img src="https://img.shields.io/badge/Flutter-3.22%2B-blue?logo=flutter" alt="Flutter Badge"/>

&nbsp; <img src="https://img.shields.io/badge/Dart-3.x-blue?logo=dart" alt="Dart Badge"/>

&nbsp; <img src="https://img.shields.io/badge/Material%20Design-3-orange?logo=material-design" alt="Material Design"/>

&nbsp; <img src="https://img.shields.io/badge/Dark%20Mode-Enabled-black?logo=moon" alt="Dark Mode Badge"/>

&nbsp; <img src="https://img.shields.io/badge/License-MIT-green" alt="License Badge"/>

</p>



---



\## 📖 Descrição



App Restaurant – Yummy



Aplicativo Flutter para exibição de restaurantes, categorias e comentários de clientes.

O app consome APIs REST públicas e foi desenvolvido com Material 3, Dark Mode dinâmico, e interface responsiva e moderna.



Funcionalidades Principais



Listagem de Restaurantes



Carrossel horizontal com imagem, nome e atributos dos restaurantes.



Dados carregados via endpoint:



https://68f68cfa6b852b1d6f171151.mockapi.io/app-restaurant/restaurants





Categorias de Comida



Cards grandes com imagens e nomes das categorias.



Scroll horizontal (carrossel).



Adaptação automática para modo claro e escuro.



Endpoint:



https://68f68cfa6b852b1d6f171151.mockapi.io/app-restaurant/categories





Comentários dos Clientes



Lista vertical de cards com foto de perfil, comentário e data.



Endpoint separado:



https://mocki.io/v1/08b9dad6-230d-42ff-a0cf-85377abcb6f2





Modo Escuro Automático



Alternância via ícone 🌞 / 🌙 na AppBar.



O tema muda em tempo real usando ThemeMode.light e ThemeMode.dark.



Cores configuradas dinamicamente através do enum ColorSelection.



Estrutura do Projeto

lib/

├── api/

│   └── mock\_service.dart         # Integração com APIs REST

├── components/

│   ├── card\_restaurant\_component.dart

│   ├── restaurant\_component.dart

│   ├── category\_component.dart

│   └── post\_component.dart

├── models/

│   ├── constants.dart            # Definição de temas e cores

│   ├── food\_category.dart        # Modelo de categoria

│   ├── restaurant.dart           # Modelo de restaurante e itens

│   ├── post.dart                 # Modelo de comentários

│   └── models.dart               # Export central dos models

├── screens/

│   └── explore\_page.dart         # Página principal com carrosséis e lista

├── home.dart                     # Navegação principal (tabs)

└── main.dart                     # Inicialização e controle de tema



Tecnologias Utilizadas



Flutter 3.22+



Dart



Material 3 Design



HTTP package para consumo das APIs



ThemeMode com alternância dinâmica



FutureBuilder e RefreshIndicator para atualização de dados



ListView.builder / .separated com rolagem horizontal e vertical



Como Executar o Projeto

Pré-requisitos



Flutter SDK instalado



Editor (VS Code ou Android Studio)



Conexão com Internet para acessar as APIs



Passos

\# 1. Clone o repositório

git clone https://github.com/seuusuario/app\_restaurant.git

cd app\_restaurant



\# 2. Instale as dependências

flutter pub get



\# 3. Execute no navegador

flutter run -d chrome



Dark Mode



O botão de alternância está localizado no canto superior direito da tela inicial:



Ícone	Função

Icons.light\_mode	Ativa o modo claro

Icons.dark\_mode	Ativa o modo escuro



O tema usa colorSchemeSeed e se adapta automaticamente à cor principal definida em ColorSelection.

