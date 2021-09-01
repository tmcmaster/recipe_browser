import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_workbench/flutter_workbench.dart';
import 'package:recipe_browser/app/recipe_browser.dart';

void main() => runApp(
      ProviderScope(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: DevicePreviewContainer(
            device: Devices.ios.iPhone11,
            child: SafeArea(
              child: RecipeBrowser(),
            ),
          ),
        ),
      ),
    );
