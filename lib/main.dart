import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_workbench/flutter_workbench.dart';
import 'package:recipe_browser/pages/browse_page.dart';

void main() => runApp(
      ProviderScope(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: DevicePreviewContainer(
            device: Devices.ios.iPhone11,
            child: SafeArea(
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  colorScheme: ColorScheme(
                    primary: Color(0xFFFAA06A),
                    onPrimary: Colors.white,
                    primaryVariant: Color(0xFFEBD2C8),
                    background: Colors.white,
                    onBackground: Colors.black,
                    secondary: Color(0xFF36A3A5),
                    onSecondary: Colors.white,
                    secondaryVariant: Color(0xFF91BBC6),
                    error: Colors.red,
                    onError: Colors.white,
                    surface: Colors.white,
                    onSurface: Colors.black,
                    brightness: Brightness.light,
                  ),
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                ),
                home: BrowsePage(),
              ),
            ),
          ),
        ),
      ),
    );
