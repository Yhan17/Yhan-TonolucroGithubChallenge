import 'package:flutter/material.dart';
import 'package:tonolucro_challenge/core/presentation/pages/splash_screen_page.dart';

import 'app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme,
      title: 'Tonolucro Challenge',
      home: const SplashScreenPage(),
    );
  }
}
