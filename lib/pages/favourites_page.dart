import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_browser/pages/browse_page.dart';

/// TODO: need to switch to a different swiper, or fork and fix Null Safety
import 'package:recipe_browser/pages/groceries_page.dart';
import 'package:recipe_browser/pages/pinned_page.dart';
import 'package:recipe_browser/providers/recipes_provider.dart';
import 'package:recipe_browser/widgets/navigation_bar.dart';
import 'package:recipe_browser/widgets/recipe_swiper.dart';

class FavouritesPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final colors = Theme.of(context).colorScheme;
    final recipes = watch(favouriteRecipesProvider);

    return SafeArea(
      child: Scaffold(
        backgroundColor: colors.secondary,
        body: RecipeSwiper(
          title: 'Favourites',
          heroPrefix: 'favourites',
          recipes: recipes,
          backButton: true,
        ),
        bottomNavigationBar: NavigationBar(
          navItems: [
            NavigationItem(icon: Icons.push_pin, replace: true, pageBuilder: () => PinnedPage()),
            NavigationItem(icon: Icons.shopping_cart, pageBuilder: () => GroceriesPage()),
            NavigationItem(icon: Icons.home, replace: true, pageBuilder: () => BrowsePage()),
          ],
        ),
      ),
    );
  }
}
