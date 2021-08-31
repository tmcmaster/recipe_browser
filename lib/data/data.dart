import 'package:faker/faker.dart';
import 'package:recipe_browser/models/recipe_info.dart';

final title = () => faker.lorem.word();
final subtitle = () => faker.lorem.words(3).join(' ');
final description = () => faker.lorem.words(30).join(' ');
final image = () => 'images/plates/plate${faker.randomGenerator.integer(12, min: 1)}.png';
final images = () => Iterable.generate(5).map((i) => image()).toList();

List<RecipeInfo> recipes = Iterable.generate(12)
    .map((i) => i + 1)
    .map((i) => RecipeInfo(
          i,
          title: title(),
          subtitle: subtitle(),
          image: 'images/plates/plate$i.png',
          description: description(),
          popular: images(),
        ))
    .toList();
