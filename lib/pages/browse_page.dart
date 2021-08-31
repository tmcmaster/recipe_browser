import 'package:flutter/material.dart';

/// TODO: need to switch to a different swiper, or fork and fix Null Safety
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:recipe_browser/pages/detail_page.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../data/data.dart';

class BrowsePage extends StatefulWidget {
  @override
  _BrowsePageState createState() => _BrowsePageState();
}

class _BrowsePageState extends State<BrowsePage> {
  static const CARD_SIZE = 300.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final gradientStartColor = colors.primary;
    final gradientEndColor = colors.secondary;
    final primaryTextColor = colors.onPrimary;
    final secondaryTextColor = colors.onPrimary;
    final navigationColor = Colors.transparent; //colors.primaryVariant;

    return Scaffold(
      backgroundColor: gradientEndColor,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [gradientStartColor, colors.secondaryVariant, gradientEndColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.5, 0.8, 1])),
        child: SafeArea(
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

                    /// TODO: need to look into why DropdownButton had issue
                    // DropdownButton(
                    //   items: [
                    //     DropdownMenuItem(
                    //       child: Text(
                    //         'Solar System',
                    //         style: TextStyle(
                    //           fontFamily: 'Avenir',
                    //           fontSize: 24,
                    //           color: const Color(0x7cdbf1ff),
                    //           fontWeight: FontWeight.w500,
                    //         ),
                    //         textAlign: TextAlign.left,
                    //       ),
                    //     ),
                    //   ],
                    //   onChanged: (value) {},
                    //   icon: Padding(
                    //     padding: const EdgeInsets.only(left: 16.0),
                    //     child: Image.asset('assets/drop_down_icon.png'),
                    //   ),
                    //   underline: SizedBox(),
                    // ),
                  ],
                ),
              ),
              Container(
                height: 500,
                padding: const EdgeInsets.only(left: 32),
                child: Swiper(
                  itemCount: recipes.length,
                  itemWidth: CARD_SIZE, //MediaQuery.of(context).size.width - 2 * 64,
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
                          ),
                        );
                      },
                      child: Stack(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              SizedBox(height: 100),
                              SizedBox(
                                width: 300,
                                height: 300,
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
                                          style: TextStyle(
                                            fontFamily: 'Avenir',
                                            fontSize: 44,
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
                                  child: Image.asset(recipes[index].image),
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
                                color: primaryTextColor.withOpacity(0.08),
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
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(36.0),
          ),
          color: navigationColor,
        ),
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
                Icons.stop,
                color: colors.onSecondary,
              ),
              onPressed: () {},
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
