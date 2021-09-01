import 'package:faker/faker.dart';
import 'package:recipe_browser/models/recipe_info.dart';
import 'package:riverpod/riverpod.dart';

final recipesRepositoryProvider = Provider((ref) => RecipesRepository());

class RecipesRepository {
  static final NUM_OF_RECIPES = 12;

  List<RecipeInfo> getRecipeInfo() {
    final title = () => faker.lorem.word();
    final subtitle = () => faker.lorem.words(3).join(' ');
    final description = () => faker.lorem.words(30).join(' ');
    final recipeId = () => faker.randomGenerator.integer(NUM_OF_RECIPES, min: 1);

    final popular =
        (id) => Iterable.generate(20).map((i) => recipeId()).where((i) => i != id).toSet().toList().sublist(0, 4);

    return Iterable.generate(NUM_OF_RECIPES)
        .map((i) => i + 1)
        .map((i) => RecipeInfo(
              i,
              title: title(),
              subtitle: subtitle(),
              image: 'images/plates/plate$i.png',
              description: description(),
              popular: popular(i),
            ))
        .toList();
  }
}
