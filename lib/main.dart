import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_browser/app/recipe_browser.dart';

void main() => runApp(
      ProviderScope(
        child: RecipeBrowser(),
      ),
    );
