class Recipe {
  final String title;
  final String imageUrl;
  final int time;
  final int serves;
  final double price;
  final List<String> ingredients;
  final String category;
  final int calories;
  final int carbs;
  final int protein;

  Recipe({
    required this.title,
    required this.imageUrl,
    required this.time,
    required this.serves,
    required this.price,
    required this.ingredients,
    required this.category,
    required this.calories,
    required this.carbs,
    required this.protein,
  });
}
