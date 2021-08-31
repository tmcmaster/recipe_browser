import 'package:flutter_workbench/flutter_workbench.dart';
import 'package:recipe_browser/pages/browse_page.dart';
import 'package:recipe_browser/shared_style.dart';

void main() => FlutterWorkbench.runAppDevicePreview(
      title: 'Responsive Card',
      device: Devices.ios.iPhone11,
      styles: SharedStyle.themes,
      child: BrowsePage(),
      //child: RecipeBrowser(title: 'Recipe Browser'),
    );
