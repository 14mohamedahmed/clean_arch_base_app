import 'package:aqarmap/core/utils/app_string.dart';
import 'package:aqarmap/core/utils/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AqarMapApp());
}

class AqarMapApp extends StatelessWidget {
  const AqarMapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.appName,
      theme: AppTheme.appLightTheme(context),
      home: const Placeholder(),
    );
  }
}
