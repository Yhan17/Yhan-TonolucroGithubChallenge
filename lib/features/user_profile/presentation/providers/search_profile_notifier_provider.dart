import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/features/user_profile/domain/usecases/get_user_profile_usecase.dart';
import '/features/user_profile/domain/usecases/get_user_repos_usecase.dart';
import '/features/user_profile/presentation/providers/search_page_state.dart';

class SearchProfileNotifierProvider extends StateNotifier<ProfileState> {
  final GetUserProfileUsecase getUserProfileUsecase;
  final GetUserReposUsecase getUserReposUsecase;

  SearchProfileNotifierProvider(
      {required this.getUserProfileUsecase, required this.getUserReposUsecase})
      : super(const ProfileInitial());

  Future<void> getProfile(String profileName) async {
    state = const ProfileLoading();
    final result = await getUserProfileUsecase(profileName);
    result?.fold((l) {
      print(l);
      state = ProfileError(l);
    }, (r) {
      print(r.toString());
      state = ProfileLoaded(r);
    });
  }
}
