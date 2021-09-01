import 'package:flutter/material.dart';

typedef PageBuilder = Widget Function();

class NavigationItem {
  final IconData icon;
  final PageBuilder? pageBuilder;
  final bool replace;
  NavigationItem({
    required this.icon,
    this.pageBuilder,
    this.replace = false,
  });
}

class NavigationBar extends StatelessWidget {
  final List<NavigationItem> navItems;
  const NavigationBar({
    Key? key,
    required this.navItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: navItems
            .map((navItem) => IconButton(
                  icon: Icon(
                    navItem.icon,
                    color: colors.onSecondary,
                  ),
                  onPressed: () {
                    if (navItem.pageBuilder != null) {
                      final pageBuilder = PageRouteBuilder(
                        pageBuilder: (context, a, b) => navItem.pageBuilder!(),
                        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
                          return FadeTransition(opacity: animation, child: child);
                        },
                      );
                      if (navItem.replace) {
                        Navigator.pushReplacement(context, pageBuilder);
                      } else {
                        Navigator.push(context, pageBuilder);
                      }
                    }
                  },
                ))
            .toList(),
      ),
    );
  }
}
