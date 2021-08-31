import 'package:flutter_workbench/flutter_workbench.dart';
import 'package:recipe_browser/apps/recipe_browser.dart';
import 'package:recipe_browser/shared_style.dart';

void main() => FlutterWorkbench.runAppDevicePreview(
      title: 'Responsive Card',
      device: Devices.ios.iPhone11,
      styles: SharedStyle.themes,
      child: RecipeBrowser(title: 'Recipe Browser'),
    );
