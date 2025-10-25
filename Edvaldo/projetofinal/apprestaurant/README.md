# ceub-dev-multiplataforma-2025: Restaurant App

Um protótipo de app de descoberta de restaurantes em Flutter, demonstrando conceitos de UI/UX, consumo de API e gerenciamento de estado.

## Demonstração

![Demo do App](gif.gif)

## Features

* **UI Moderna (Material 3)**: Interface limpa com `Card`, espaçamento adequado e hierarquia visual.
* **Seções de Conteúdo**:
    * Restaurantes (Horizontal)
    * Categorias (Horizontal)
    * Atividade de Amigos (Vertical)
* **Alternância de Tema**: Botão na `AppBar` para troca instantânea entre Light/Dark mode.
* **Favoritos (Estado Local)**: Ícones funcionais em cards, com estado gerenciado via `StatefulWidget`.
* **Consumo de API Otimizado**: Chamada de API (`http`) única no `initState` e renderização assíncrona com `FutureBuilder`.

## Tech Stack

* **Flutter & Dart**
* **Material 3 (`useMaterial3: true`)**
* **Pacote `http`** (para chamadas GET)
* **`FutureBuilder`** (para UI assíncrona)
* **`StatefulWidget`** (para gerenciamento de estado local)