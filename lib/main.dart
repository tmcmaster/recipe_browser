import 'package:flutter/material.dart';
import 'package:flutter_workbench/flutter_workbench.dart';
import 'package:recipe_browser/config/constants.dart';
import 'package:recipe_browser/pages/browse_page.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DevicePreviewContainer(
        device: Devices.ios.iPhone11,
        child: SafeArea(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: colorScheme,
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: BrowsePage(),
          ),
        ),
      ),
    ));

// void main() => FlutterWorkbench.runAppDevicePreview(
//       title: 'Responsive Card',
//       device: Devices.ios.iPhone11,
//       styles: SharedStyle.themes,
//       child: BrowsePage(),
//       //child: RecipeBrowser(title: 'Recipe Browser'),
//     );

// void main() => FlutterWorkbench.runAppContainer(
//       title: 'Recipe Browser',
//       styles: SharedStyle.themes,
//       child: DevicePreviewContainer(
//         device: Devices.ios.iPhone11,
//         child: SafeArea(
//           child: MaterialApp(
//             debugShowCheckedModeBanner: false,
//             theme: ThemeData(
//               colorScheme: colorScheme,
//               primarySwatch: Colors.blue,
//               visualDensity: VisualDensity.adaptivePlatformDensity,
//             ),
//             home: BrowsePage(),
//           ),
//         ),
//       ),
//       //child: RecipeBrowser(title: 'Recipe Browser'),
//     );

// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return DevicePreviewContainer(
//       device: Devices.ios.iPhone11,
//       child: SafeArea(
//         child: MaterialApp(
//           title: 'Flutter Demo',
//           theme: ThemeData(
//             colorScheme: colorScheme,
//             primarySwatch: Colors.blue,
//             visualDensity: VisualDensity.adaptivePlatformDensity,
//           ),
//           home: BrowsePage(),
//           debugShowCheckedModeBanner: false,
//         ),
//       ),
//     );
//   }
// }
