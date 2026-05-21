import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'splash_screen.dart';

void main() {
  runApp(const DevFocusApp());
}

class DevFocusApp extends StatelessWidget {
  const DevFocusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DevFocus',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}
