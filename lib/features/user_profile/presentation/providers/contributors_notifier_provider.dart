import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/core/app/locator.dart';
import '/core/app/navigation_service.dart';
import '/core/app/routes/constants/router_constants.dart' as routes;
import '/features/repository_contributors/domain/usecases/get_contributors_usecase.dart';

import 'contributors_state.dart';

class ContributorsNotifierProvider extends StateNotifier<ContributorsState> {
  final GetContributorsUsecase getRepoContributors;

  static final _navigationService = locator<NavigationService>();

  ContributorsNotifierProvider({required this.getRepoContributors})
      : super(const ContributorsStateInitial());

  Future<void> getProfile(String owner, String repoName) async {
    state = const ContributorsStateLoading();
    final result = await getRepoContributors(owner, repoName);
    result?.fold((l) {
      state = ContributorsStateError(l);
    }, (r) {
      state = ContributorsStateLoaded(r);
      _navigationService.navigateTo(routes.repoContributorsRoute, arguments: {"contributors": r, "repository": repoName});
    });
  }
}
