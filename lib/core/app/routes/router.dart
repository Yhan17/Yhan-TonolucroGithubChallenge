import 'package:flutter/material.dart';
import './constants/router_constants.dart' as routes;
import '/core/presentation/pages/splash_screen_page.dart';
import '/features/repository_contributors/presentation/pages/repository_contributors_page.dart';
import '/features/user_profile/presentation/pages/search_user_page.dart';
import '/features/user_profile/presentation/pages/user_profile_page.dart';
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routes.splashScreenRoute:
      return MaterialPageRoute(builder: (context) => const SplashScreenPage());
    case routes.userSearchRoute:
      return MaterialPageRoute(builder: (context) => SearchUserPage());
    case routes.userProfileRoute:
      return MaterialPageRoute(builder: (context) => const UserProfilePage());
    case routes.repoContributorsRoute:
      return MaterialPageRoute(builder: (context) => const RepositoryContributorsPage());
    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(
            child: Text('No path for ${settings.name}'),
          ),
        ),
      );
  }
}