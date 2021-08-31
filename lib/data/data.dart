import 'package:faker/faker.dart';
import 'package:recipe_browser/models/recipe_info.dart';

const NUM_OF_RECIPES = 12;

final title = () => faker.lorem.word();
final subtitle = () => faker.lorem.words(3).join(' ');
final description = () => faker.lorem.words(30).join(' ');
//final image = () => 'images/plates/plate${faker.randomGenerator.integer(12, min: 1)}.png';
final recipeId = () => faker.randomGenerator.integer(NUM_OF_RECIPES, min: 1);
final popular = () => Iterable.generate(5).map((i) => recipeId()).toList();

List<RecipeInfo> recipes = Iterable.generate(NUM_OF_RECIPES)
    .map((i) => i + 1)
    .map((i) => RecipeInfo(
          i,
          title: title(),
          subtitle: subtitle(),
          image: 'images/plates/plate$i.png',
          description: description(),
          popular: popular(),
        ))
    .toList();
