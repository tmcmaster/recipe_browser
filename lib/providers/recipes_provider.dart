import 'package:recipe_browser/models/recipe_info.dart';
import 'package:recipe_browser/repositories/recipes_repository.dart';
import 'package:riverpod/riverpod.dart';

final recipesProvider = Provider<List<RecipeInfo>>((ref) {
  final recipeService = ref.watch(recipesRepositoryProvider);
  return recipeService.getRecipeInfo();
});
