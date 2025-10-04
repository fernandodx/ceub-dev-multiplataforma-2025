class Recipe {
  final String label;
  final String imgUrl;
  int id;
  List<Ingredient> ingredients;

  Recipe(this.label, this.imgUrl, this.id, this.ingredients);

  static List<Recipe> mock = [
    Recipe(
      'Spaghetti e almôndegas',
      'https://www.seara.com.br/wp-content/uploads/2025/09/macarrao-com-almondegas-portal-minha-receita.jpg',
      1,
      [
        Ingredient(1, 'caixa', 'Spaghetti'),
        Ingredient(4, '', 'Almôndegas de carne congeladas'),
        Ingredient(0.5, 'pote', 'molho de tomate'),
      ],
    ),
    Recipe(
      'Sopa de tomate',
      'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=300&h=300&fit=crop',
      2,
      [
        Ingredient(1, 'lata', 'Sopa de Tomate'),
      ],
    ),
    Recipe(
      'Sanduíche de queijo quente',
      'https://images.unsplash.com/photo-1528735602780-2552fd46c7af?w=300&h=300&fit=crop',
      3,
      [
        Ingredient(2, 'fatias', 'Queijo'),
        Ingredient(2, 'fatias', 'Pão'),
      ],
    ),
    Recipe(
      'Tacos',
      'https://swiftbr.vteximg.com.br/arquivos/ids/202961-768-768/618257-mini-taco-de-carne-e-queijo_1.jpg',
      4,
      [
        Ingredient(0.5, 'kg', 'carne moída'),
      ],
    ),
  ];
}

class Ingredient {
  final double qtd;
  String mensure;
  String name;

  Ingredient(this.qtd, this.mensure, this.name);
}
