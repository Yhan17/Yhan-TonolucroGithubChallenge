import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tonolucro_challenge/features/user_profile/domain/usecases/get_user_profile_usecase.dart';
import 'package:tonolucro_challenge/features/user_profile/domain/usecases/get_user_repos_usecase.dart';

// final userProfileProvider = Provider<GetUserProfileUsecase>(
//   (ref) {
//     return GetUserProfileUsecase();
//   };

// );
final userProfileProvider = Provider((ref) => GetUserProfileUsecase);
final userReposProvider = Provider((ref) => GetUserReposUsecase);

// final userNotifierProvider = StateNotifierProvider(
//   (ref) => ProfileNotifierController()),
// );