class Recipe {
  final String label;
  final String imgUrl;
  int id;
  List<Ingredient> ingredients;

  Recipe(this.label, this.imgUrl, this.id, this.ingredients);

  static List<Recipe> mock = [
    Recipe(
      'Spaghetti e almôndegas',
      'https://cdn.urbano.com.br/uploads/ubn002-20f-segmentos-set-site-2-800.png',
      1,
      [
        Ingredient(1, 'caixa', 'Spaghetti'),
        Ingredient(4, '', 'Almôndegas de carne congeladas'),
        Ingredient(0.5, 'pote', 'molho de tomate'),
      ],
    ),
    Recipe(
      'Sopa de tomate',
      'https://www.apitadadopai.com/wp-content/uploads/2025/02/sopa-manjericao-tomate-pitada.jpg',
      2,
      [
        Ingredient(1, 'lata', 'Sopa de Tomate'),
      ],
    ),
    Recipe(
      'Sanduíche de queijo quente',
      'https://img.estadao.com.br/resources/jpg/7/3/1543522402137.jpg',
      3,
      [
        Ingredient(2, 'fatias', 'Queijo'),
        Ingredient(2, 'fatias', 'Pão'),
      ],
    ),
    Recipe(
      'Tacos',
      'https://www.onceuponachef.com/images/2023/08/Beef-Tacos.jpg',
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
