import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_browser/models/recipe_info.dart';
import 'package:recipe_browser/providers/recipes_provider.dart';
import 'package:simple_shadow/simple_shadow.dart';

class DetailPage extends ConsumerWidget {
  final RecipeInfo recipeInfo;

  const DetailPage({
    Key? key,
    required this.recipeInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final recipes = watch(recipesProvider);
    final colors = Theme.of(context).colorScheme;

    final contentTextColor = colors.onSurface.withOpacity(0.7);
    final primaryTextColor = colors.onSurface;

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 300),
                        Text(
                          recipeInfo.title,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 56,
                            color: primaryTextColor,
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          recipeInfo.subtitle,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 31,
                            color: primaryTextColor,
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Divider(color: Colors.black38),
                        SizedBox(height: 32),
                        Text(
                          recipeInfo.description,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 20,
                            color: contentTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 32),
                        Divider(color: Colors.black38),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0, bottom: 20.0),
                    child: Text(
                      'Popular Dishes',
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 25,
                        color: const Color(0xff47455f),
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    height: 200,
                    padding: const EdgeInsets.only(left: 32.0),
                    child: ListView.builder(
                        itemCount: recipeInfo.popular.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final popularId = recipeInfo.popular[index];
                          final popularRecipeInfo = recipes[popularId - 1];
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, a, b) => DetailPage(
                                    recipeInfo: popularRecipeInfo,
                                  ),
                                ),
                              );
                            },
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Image.asset(
                                    popularRecipeInfo.image,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 30,
              right: 30,
              child: Hero(
                tag: recipeInfo.id,
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: SimpleShadow(
                    opacity: 0.4,
                    color: Colors.grey,
                    offset: Offset(5, 5),
                    child: Image.asset(recipeInfo.image),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 130,
              left: 20,
              child: Text(
                recipeInfo.id.toString(),
                style: TextStyle(
                  fontFamily: 'Avenir',
                  fontSize: 150,
                  color: primaryTextColor.withOpacity(0.08),
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
