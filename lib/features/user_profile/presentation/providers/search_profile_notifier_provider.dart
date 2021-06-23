import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tonolucro_challenge/core/app/locator.dart';
import 'package:tonolucro_challenge/core/app/navigation_service.dart';

import '/core/app/routes/constants/router_constants.dart' as routes;
import '/features/user_profile/domain/usecases/get_user_profile_usecase.dart';
import '/features/user_profile/domain/usecases/get_user_repos_usecase.dart';
import '/features/user_profile/presentation/providers/search_page_state.dart';

class SearchProfileNotifierProvider extends StateNotifier<ProfileState> {
  final GetUserProfileUsecase getUserProfileUsecase;
  final GetUserReposUsecase getUserReposUsecase;
  static final _navigationService = locator<NavigationService>();

  SearchProfileNotifierProvider(
      {required this.getUserProfileUsecase, required this.getUserReposUsecase})
      : super(const ProfileInitial());

  Future<void> getProfile(String profileName) async {
    state = const ProfileLoading();
    final result = await getUserProfileUsecase(profileName);
    result?.fold((l) {
      state = ProfileError(l);
    }, (r) {
      state = ProfileLoaded(r);
      _navigationService.navigateTo(routes.userProfileRoute, arguments: r);
    });
  }
}
