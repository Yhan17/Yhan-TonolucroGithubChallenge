import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tonolucro_challenge/core/app/locator.dart';
import 'package:tonolucro_challenge/core/app/navigation_service.dart';
import 'package:tonolucro_challenge/features/user_profile/domain/entities/user_repos_entity.dart';
import 'package:tonolucro_challenge/features/user_profile/presentation/providers/user_repos_state.dart';

import '/core/app/routes/constants/router_constants.dart' as routes;
import '/features/user_profile/domain/usecases/get_user_repos_usecase.dart';

class UserRepoNotifierProvider extends StateNotifier<UserRepoState> {
  final GetUserReposUsecase getUserReposUsecase;
  static final _navigationService = locator<NavigationService>();
  List<UserRepoEntity> repos = [];

  UserRepoNotifierProvider({required this.getUserReposUsecase})
      : super(const UserRepoInitial());

  Future<void> getUserRepos(String profileName) async {
    state = const UserRepoLoading();
    final result = await getUserReposUsecase(profileName);
    result?.fold((l) => null, (r) {
      repos.addAll(r);
      state = UserRepoLoaded(r);
      return r;
    });
  }
}
