import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// TODO: need to switch to a different swiper, or fork and fix Null Safety
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:recipe_browser/pages/detail_page.dart';
import 'package:recipe_browser/pages/groceries_page.dart';
import 'package:recipe_browser/providers/recipes_provider.dart';
import 'package:simple_shadow/simple_shadow.dart';

class BrowsePage extends ConsumerWidget {
  static const CARD_SIZE = 300.0;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final recipes = watch(recipesProvider);
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colors.secondary,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [colors.primary, colors.secondaryVariant, colors.secondary],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.5, 0.8, 1])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: <Widget>[
                  Text(
                    'Recipes',
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 44,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            Container(
              height: 500,
              padding: const EdgeInsets.only(left: 32),
              child: Swiper(
                itemCount: recipes.length,
                itemWidth: CARD_SIZE,
                layout: SwiperLayout.STACK,
                pagination: SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                    activeSize: 20,
                    space: 8,
                    color: colors.onSecondary,
                    activeColor: colors.primary,
                  ),
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (context, a, b) => DetailPage(
                                  recipeInfo: recipes[index],
                                ),
                            transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
                              return FadeTransition(opacity: animation, child: child);
                            }),
                      );
                    },
                    child: Stack(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            SizedBox(height: 100),
                            SizedBox(
                              width: CARD_SIZE,
                              height: CARD_SIZE,
                              child: Card(
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(32.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(height: 80),
                                      Text(
                                        recipes[index].title,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontFamily: 'Avenir',
                                          fontSize: 40,
                                          color: const Color(0xff47455f),
                                          fontWeight: FontWeight.w900,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        recipes[index].subtitle,
                                        style: TextStyle(
                                          fontFamily: 'Avenir',
                                          fontSize: 20,
                                          color: Colors.grey.shade600,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Expanded(
                                        child: SizedBox(height: 32),
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            'View Recipe',
                                            style: TextStyle(
                                              fontFamily: 'Avenir',
                                              fontSize: 18,
                                              color: colors.primary,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                          Icon(
                                            Icons.arrow_forward,
                                            color: colors.primary,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 60, top: 10),
                          child: Hero(
                            tag: recipes[index].id,
                            child: SizedBox(
                              height: 200,
                              width: 200,
                              child: SimpleShadow(
                                opacity: 0.4,
                                color: Colors.grey,
                                offset: Offset(5, 5),
                                child: AnimatedOpacity(
                                  opacity: 1,
                                  duration: Duration(seconds: 1),
                                  child: Image.asset(recipes[index].image),
                                ),
                              ),
                              // child: Image.asset(recipes[index].image),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 24,
                          bottom: 60,
                          child: Text(
                            recipes[index].id.toString(),
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 200,
                              color: colors.onPrimary.withOpacity(0.08),
                              fontWeight: FontWeight.w900,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.menu,
                color: colors.onSecondary,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: colors.onSecondary,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (context, a, b) => GroceriesPage(),
                      transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
                        return FadeTransition(opacity: animation, child: child);
                      }),
                );
              },
            ),
            IconButton(
              icon: Icon(
                Icons.search,
                color: colors.onSecondary,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
