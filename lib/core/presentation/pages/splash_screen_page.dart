import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:tonolucro_challenge/features/user_profile/presentation/pages/search_user_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tonolucro_challenge/features/user_profile/presentation/pages/user_profile_page.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      splash: Image.asset(
        "assets/images/github.png",
        width: 300,
        height: 300,
      ),
      nextScreen: const UserProfilePage(),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
