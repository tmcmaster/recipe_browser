import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_browser/pages/favourites_page.dart';

/// TODO: need to switch to a different swiper, or fork and fix Null Safety
import 'package:recipe_browser/pages/groceries_page.dart';
import 'package:recipe_browser/pages/pinned_page.dart';
import 'package:recipe_browser/providers/recipes_provider.dart';
import 'package:recipe_browser/widgets/navigation_bar.dart';
import 'package:recipe_browser/widgets/recipe_swiper.dart';

class BrowsePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final colors = Theme.of(context).colorScheme;
    final recipes = watch(recipesProvider);

    return SafeArea(
      child: Scaffold(
        backgroundColor: colors.secondary,
        body: RecipeSwiper(
          title: 'Recipes',
          heroPrefix: 'browse',
          recipes: recipes,
        ),
        bottomNavigationBar: NavigationBar(
          navItems: [
            NavigationItem(icon: Icons.push_pin, pageBuilder: () => PinnedPage()),
            NavigationItem(icon: Icons.shopping_cart, pageBuilder: () => GroceriesPage()),
            NavigationItem(icon: Icons.favorite, pageBuilder: () => FavouritesPage()),
          ],
        ),
      ),
    );
  }
}
