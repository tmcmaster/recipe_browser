class RecipeInfo {
  final int id;
  final String title;
  final String subtitle;
  final String image;
  final String description;
  final List<String> ingredients;
  final List<int> popular;

  RecipeInfo(
    this.id, {
    required this.title,
    required this.subtitle,
    required this.image,
    required this.description,
    required this.ingredients,
    required this.popular,
  });
}
