Um protótipo de aplicativo em Flutter para descoberta de restaurantes e comidas. O projeto foi desenvolvido com foco em uma interface de usuário moderna (Material 3), consumo de API REST e gerenciamento de estado local.

Demonstração

![Demo do App](/Video%20Restaurante.gif)

Funcionalidades
O aplicativo implementa as seguintes funcionalidades:

Navegação Principal: Estrutura de app com 3 abas (Home, Pedidos e Conta) usando BottomNavigationBar.

Listagem de Seções: A tela principal (Home) exibe três seções de dados carregados de uma API:

Restaurantes (lista horizontal)

Categorias (lista horizontal)

Atividade de Amigos (lista vertical)

Alternância de Tema (Light/Dark): Um botão na AppBar permite ao usuário trocar instantaneamente entre o modo Claro (Light) e Escuro (Dark).

Consumo de API Otimizado: O app busca os dados de uma API (Beeceptor/MockAPI) usando o pacote http. A chamada é feita apenas uma vez no initState da tela principal, evitando requisições desnecessárias a cada redesenho da tela.

UI Assíncrona: Utiliza FutureBuilder para exibir um CircularProgressIndicator (loading) enquanto os dados da API estão sendo buscados e, em seguida, constrói a lista.

Design Moderno (Material 3): A interface utiliza componentes do Material 3 (useMaterial3: true), com foco em cards, espaçamento e hierarquia de texto clara.

Função de Favoritar: Cada card de Restaurante e Categoria possui um ícone de coração funcional para gerenciamento de estado local (favoritos).

Tecnologias Utilizadas
Flutter (SDK): Framework principal para o desenvolvimento da interface.

Dart: Linguagem de programação.

Material 3: Biblioteca de design (useMaterial3: true).

http (pacote): Para realizar as requisições GET à API.

FutureBuilder: Para construir a UI de forma assíncrona após o retorno da API.

StatefulWidget: Para gerenciamento de estado local (tema, favoritos, etc.).

