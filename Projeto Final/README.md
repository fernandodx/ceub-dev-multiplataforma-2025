# App Restaurant

Este projeto segue uma arquitetura bem estruturada com separação clara de responsabilidades:

Primeiro, atualizei o `MockService` para consumir os três endpoints fornecidos:

```dart
class MockService {
  final String _restaurantsUrl = "https://68f68cfa6b852b1d6f171151.mockapi.io/app-restaurant/restaurants";
  final String _categoriesUrl = "https://68f68cfa6b852b1d6f171151.mockapi.io/app-restaurant/categories";
  final String _postsUrl = "https://mocki.io/v1/08b9dad6-230d-42ff-a0cf-85377abcb6f2";

  Future<ExploreData> getExploreData() async {
    // Executa todas as requisições em paralelo para melhor performance
    final List<Future> futures = [
      _getRestaurants(),
      _getCategories(),
      _getPosts(),
    ];
    
    final results = await Future.wait(futures);
    
    return ExploreData(
      results[0] as List<Restaurant>,
      results[1] as List<FoodCategory>,
      results[2] as List<Post>,
    );
  }
}
```

**Principais melhorias:**
- ✅ **URLs corretas**: Substituí a URL genérica pelos endpoints específicos fornecidos
- ✅ **Requisições paralelas**: Uso `Future.wait()` para fazer todas as requisições simultaneamente
- ✅ **Tratamento de erros**: Cada método tem seu próprio tratamento de exceções
- ✅ **Performance otimizada**: Reduz o tempo total de carregamento

#### 2. **Componente de Categorias**

Criei o `CategoriesComponent` como um widget reutilizável:

```dart
class CategoriesComponent extends StatelessWidget {
  final List<FoodCategory> categories;

  const CategoriesComponent({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Título da seção
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('Categorias', style: Theme.of(context).textTheme.headlineSmall),
        ),
        // Lista horizontal de categorias
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) => CategoryCard(category: categories[index]),
          ),
        ),
      ],
    );
  }
}
```

**Características do componente:**
- 🎨 **Design responsivo**: Cards com altura fixa e scroll horizontal
- 🖼️ **Imagens com fallback**: Se a imagem não carregar, mostra um ícone padrão
- 📱 **Interação**: Tap nas categorias mostra um SnackBar (preparado para navegação)
- 🎯 **Informações completas**: Mostra nome, imagem e número de restaurantes

#### 3. **Componente de Posts**

Criei o `PostsComponent` para exibir posts de amigos:

```dart
class PostsComponent extends StatelessWidget {
  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Título da seção
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('Posts dos Amigos'),
        ),
        // Lista vertical de posts
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: posts.length,
          itemBuilder: (context, index) => PostCard(post: posts[index]),
        ),
      ],
    );
  }
}
```

**Funcionalidades implementadas:**
- 👤 **Avatar do usuário**: CircleAvatar com imagem de perfil e fallback
- ⏰ **Timestamp inteligente**: Formatação relativa (2h, 3d, etc.)
- 💬 **Interface social**: Botões de curtir, comentar e compartilhar
- 📱 **Layout responsivo**: Cards com padding adequado e elevação

#### 4. **Formatação de Tempo**

Implementei uma função inteligente para formatar timestamps:

```dart
String _formatTimestamp(String timestamp) {
  try {
    final dateTime = DateTime.parse(timestamp);
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 0) {
      return '${difference.inDays}d';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}min';
    } else {
      return 'Agora';
    }
  } catch (e) {
    return timestamp; // Fallback para timestamp original
  }
}
```

#### 5. **Integração na ExplorePage**

Atualizei a tela principal para usar os novos componentes:

```dart
return ListView(
  scrollDirection: Axis.vertical,
  shrinkWrap: true,
  children: [
    // Component Restaurante (já existia)
    RestaurantComponent(restaurants: restaurants),
    
    // Component Categorias (novo)
    CategoriesComponent(categories: categories),
    
    // Component Posts (novo)
    PostsComponent(posts: posts),
  ],
);
```

### 🚀 Benefícios da Implementação

1. **📦 Modularidade**: Cada componente é independente e reutilizável
2. **🔄 Manutenibilidade**: Código organizado e fácil de manter
3. **⚡ Performance**: Requisições paralelas reduzem tempo de carregamento
4. **🎨 UX/UI**: Interface limpa e intuitiva
5. **🛡️ Robustez**: Tratamento de erros e fallbacks implementados
6. **📱 Responsividade**: Layout adaptável para diferentes tamanhos de tela

### 🎯 Próximos Passos

- [ ] Implementar navegação ao tocar nas categorias
- [ ] Adicionar funcionalidade real aos botões de curtir/comentar
- [ ] Implementar cache local para melhor performance
- [ ] Adicionar animações de carregamento
- [ ] Implementar refresh pull-to-refresh

### 🛠️ Tecnologias Utilizadas

- **Flutter**: Framework principal
- **HTTP**: Para requisições de API
- **Dart**: Linguagem de programação
- **Material Design**: Componentes de UI

### 📋 Estrutura dos Dados

#### Modelo de Categoria (FoodCategory)
```dart
class FoodCategory {
  String name;                    // Nome da categoria
  int numberOfRestaurants;        // Número de restaurantes
  String imageUrl;               // URL da imagem

  factory FoodCategory.fromJson(Map<String, dynamic> json) {
    return FoodCategory(
      json['name'] as String,
      json['numberOfRestaurants'] as int,
      json['imageUrl'] as String,
    );
  }
}
```

#### Modelo de Post
```dart
class Post {
  String id;                     // ID único do post
  String profileImageUrl;        // URL da imagem de perfil
  String comment;               // Texto do comentário
  String timestamp;             // Data/hora do post

  Post.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      profileImageUrl = json['profileImageUrl'],
      comment = json['comment'],
      timestamp = json['timestamp'];
}
```

### 🔌 Endpoints Utilizados

1. **Restaurantes**: `https://68f68cfa6b852b1d6f171151.mockapi.io/app-restaurant/restaurants`
2. **Categorias**: `https://68f68cfa6b852b1d6f171151.mockapi.io/app-restaurant/categories`
3. **Posts**: `https://mocki.io/v1/08b9dad6-230d-42ff-a0cf-85377abcb6f2`

### 💡 Decisões de Design

#### Por que Componentes Separados?
- **Reutilização**: Componentes podem ser usados em outras telas
- **Testabilidade**: Cada componente pode ser testado isoladamente
- **Manutenção**: Mudanças em um componente não afetam outros
- **Legibilidade**: Código mais limpo e organizado

#### Por que Requisições Paralelas?
- **Performance**: Reduz o tempo total de carregamento
- **UX**: Usuário vê o conteúdo mais rapidamente
- **Eficiência**: Melhor uso dos recursos de rede

#### Por que Material Design?
- **Consistência**: Interface familiar aos usuários Android
- **Acessibilidade**: Componentes otimizados para diferentes necessidades
- **Responsividade**: Funciona bem em diferentes tamanhos de tela

### 🐛 Tratamento de Erros Implementado

1. **Imagens que não carregam**: Fallback para ícones padrão
2. **Falha na API**: Exceções tratadas com mensagens específicas
3. **Timestamps inválidos**: Fallback para timestamp original
4. **Lista vazia**: Interface ainda funciona mesmo sem dados

Este README documenta completamente a implementação dos componentes de Categorias e Posts, servindo como guia para futuras manutenções e melhorias do projeto.
