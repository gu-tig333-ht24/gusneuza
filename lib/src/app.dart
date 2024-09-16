import 'package:flutter/material.dart';

import 'core/constants/app_constants.dart';
import 'core/constants/app_theme.dart';
import 'ui/screens/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appTitle,
      theme: AppTheme.theme,
      home: const HomeScreen(),
    );
  }
}
