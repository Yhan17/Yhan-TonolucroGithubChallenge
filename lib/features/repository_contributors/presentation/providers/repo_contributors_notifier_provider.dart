import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tonolucro_challenge/core/app/locator.dart';
import 'package:tonolucro_challenge/core/app/navigation_service.dart';
import 'package:tonolucro_challenge/features/repository_contributors/presentation/providers/repo_contributors_state.dart';

import '/core/app/routes/constants/router_constants.dart' as routes;
import '/features/user_profile/domain/usecases/get_user_profile_usecase.dart';
import '/features/user_profile/presentation/providers/search_page_state.dart';

class RepoContributorNotifierProvider extends StateNotifier<ContributorRepoState> {
  final GetUserProfileUsecase getUserProfileUsecase;

  static final _navigationService = locator<NavigationService>();

  RepoContributorNotifierProvider({required this.getUserProfileUsecase})
      : super(const ContributorRepoStateInitial());

  Future<void> getProfile(String profileName) async {
    state = const ContributorRepoStateLoading();
    final result = await getUserProfileUsecase(profileName);
    result?.fold((l) {
      state = ContributorRepoStateError(l);
    }, (r) {
      state = ContributorRepoStateLoaded(r);
      _navigationService.navigateTo(routes.userProfileRoute, arguments: r);
    });
  }
}
