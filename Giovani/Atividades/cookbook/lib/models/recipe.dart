class Recipe {
  final String title;
  final String imageUrl;
  final int time;
  final int serves;
  final double price;
  final List<String> ingredients;
  final String category;

  Recipe({
    required this.title,
    required this.imageUrl,
    required this.time,
    required this.serves,
    required this.price,
    required this.ingredients,
    required this.category,
  });
}
