import 'package:aqarmap/core/services/services_locator.dart';
import 'package:aqarmap/core/utils/app_string.dart';
import 'package:aqarmap/core/utils/app_theme.dart';
import 'package:aqarmap/features/movies/presentation/screens/movies_screen.dart';
import 'package:flutter/material.dart';

void main() {
  ServicesLocator().init();
  runApp(const AqarMapApp());
}

class AqarMapApp extends StatelessWidget {
  const AqarMapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.appName,
      theme: AppTheme.appLightTheme(context),
      home: const MoviesScreen(),
    );
  }
}
