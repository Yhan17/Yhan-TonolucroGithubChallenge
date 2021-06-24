import 'package:flutter/material.dart';
import 'package:tonolucro_challenge/features/repository_contributors/domain/entities/contributor_entity.dart';
import 'package:tonolucro_challenge/features/user_profile/domain/entities/user_profile_entity.dart';
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

      // ignore: cast_nullable_to_non_nullable
      final user = settings.arguments as UserProfileEntity;
      return MaterialPageRoute(
          builder: (context) => UserProfilePage(entity: user));
    case routes.repoContributorsRoute:
      final Map<String, dynamic> args =
          // ignore: cast_nullable_to_non_nullable
          settings.arguments as Map<String, dynamic>;
      // ignore: cast_nullable_to_non_nullable
      final listContributors = args["contributors"] as List<ContributorEntity>;
      final repoName = args["repository"] as String;
      return MaterialPageRoute(
          builder: (context) => RepositoryContributorsPage(
                contributors: listContributors,
                repoName: repoName,
              ));
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
