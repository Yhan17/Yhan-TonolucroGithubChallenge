import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tonolucro_challenge/core/app/locator.dart';
import 'package:tonolucro_challenge/core/app/navigation_service.dart';

import '/core/app/routes/constants/router_constants.dart' as routes;
import '/features/user_profile/domain/usecases/get_user_profile_usecase.dart';
import '/features/user_profile/presentation/providers/search_page_state.dart';

class SearchProfileNotifierProvider extends StateNotifier<SearchState> {
  final GetUserProfileUsecase getUserProfileUsecase;
  
  static final _navigationService = locator<NavigationService>();

  SearchProfileNotifierProvider(
      {required this.getUserProfileUsecase})
      : super(const SearchInitial());

  Future<void> getProfile(String profileName) async {
    state = const SearchLoading();
    final result = await getUserProfileUsecase(profileName);
    result?.fold((l) {
      state = SearchError(l);
    }, (r) {
      state = SearchLoaded(r);
      _navigationService.navigateTo(routes.userProfileRoute, arguments: r);
    });
  }
}
