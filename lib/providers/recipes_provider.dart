import 'package:recipe_browser/models/recipe_info.dart';
import 'package:recipe_browser/services/recipe_service.dart';
import 'package:riverpod/riverpod.dart';

final recipesProvider = Provider<List<RecipeInfo>>((ref) {
  final recipeService = ref.watch(recipeServiceProvider);
  return recipeService.getRecipeInfo();
});
