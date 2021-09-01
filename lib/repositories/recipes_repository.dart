import 'package:faker/faker.dart';
import 'package:recipe_browser/models/recipe_info.dart';
import 'package:riverpod/riverpod.dart';

final recipesRepositoryProvider = Provider((ref) => RecipesRepository());

class RecipesRepository {
  static final NUM_OF_RECIPES = 12;
  static final TITLES = [
    'Eggs & Bacon',
    'Tortellini',
    'Spaghetti',
    'Chicken',
    'Chicken',
    'Salmon',
    'Cesar Salad',
    'Spaghetti',
    'Ravioli',
    'Fish',
    'Chips & Dip',
    'Chips & Sauce',
  ];
  List<RecipeInfo> getRecipeInfo() {
    final title = (id) => TITLES[id - 1];
    final subtitle = () => faker.lorem.words(3).join(' ');
    final description = () => faker.lorem.words(30).join(' ');
    final recipeId = () => faker.randomGenerator.integer(NUM_OF_RECIPES, min: 1);
    final ingredient = () => faker.lorem.words(3).join(' ');
    final ingredients = () => Iterable.generate(5).map((i) => ingredient()).toList();
    final image = (id) => 'images/plates/plate$id.png';
    final popular =
        (id) => Iterable.generate(20).map((i) => recipeId()).where((i) => i != id).toSet().toList().sublist(0, 4);

    return Iterable.generate(NUM_OF_RECIPES)
        .map((i) => i + 1)
        .map((i) => RecipeInfo(
              i,
              title: title(i),
              subtitle: subtitle(),
              image: image(i),
              description: description(),
              ingredients: ingredients(),
              popular: popular(i),
            ))
        .toList();
  }
}
