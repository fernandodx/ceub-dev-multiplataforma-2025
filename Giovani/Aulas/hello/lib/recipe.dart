class Recipe {
  final String label;
  final String imgUrl;
  int id;
  List<Ingredient> ingredients;

  Recipe(this.label, this.imgUrl, this.id, this.ingredients);

  static List<Recipe> mock = [
    Recipe(
      'Spaghetti e almôndegas',
      'https://s2-receitas.glbimg.com/cG1LX4plbTHpkN7nRv5eFyNRNbQ=/0x0:1280x853/924x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_e84042ef78cb4708aeebdf1c68c6cbd6/internal_photos/bs/2020/1/N/8z0UqcRzm5YWiS8BamhA/almondega.jpeg',
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
      'https://guiadacozinha.com.br/wp-content/uploads/2024/07/Queijo-quente.jpg',
      3,
      [
        Ingredient(2, 'fatias', 'Queijo'),
        Ingredient(2, 'fatias', 'Pão'),
      ],
    ),
    Recipe(
      'Tacos',
      'https://danosseasoning.com/wp-content/uploads/2022/03/Beef-Tacos-1024x767.jpg',
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
