import 'package:flutter/material.dart';
import '/core/app/locator.dart';
import '/core/app/navigation_service.dart';
import '/core/app/routes/constants/router_constants.dart' as routes;
import '/core/app/routes/router.dart' as router;
import '/core/presentation/pages/splash_screen_page.dart';

import 'app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme,
      title: 'Tonolucro Challenge',
      home: const SplashScreenPage(),
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: router.generateRoute,
      initialRoute: routes.splashScreenRoute,
    );
  }
}
