import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tonolucro_challenge/core/errors/failures.dart';
import 'package:tonolucro_challenge/features/user_profile/domain/entities/user_profile_entity.dart';
import 'package:tonolucro_challenge/features/user_profile/domain/usecases/get_user_profile_usecase.dart';
import 'package:tonolucro_challenge/features/user_profile/domain/usecases/get_user_repos_usecase.dart';

abstract class ProfileState {
  const ProfileState();
}

class ProfileInitial extends ProfileState {
  const ProfileInitial();
}

class ProfileLoading extends ProfileState {
  const ProfileLoading();
}

class ProfileLoaded extends ProfileState {
  final UserProfileEntity profile;
  const ProfileLoaded(this.profile);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ProfileLoaded && o.profile == profile;
  }

  @override
  int get hashCode => profile.hashCode;
}

class ProfileError extends ProfileState {
  final Failure failure;
  const ProfileError(this.failure);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ProfileError && o.failure == failure;
  }

  @override
  int get hashCode => failure.hashCode;
}

class ProfileNotifierController extends StateNotifier<ProfileState> {
  final GetUserProfileUsecase getUserProfileUsecase;
  final GetUserReposUsecase getUserReposUsecase;

  ProfileNotifierController(
      this.getUserProfileUsecase, this.getUserReposUsecase)
      : super(const ProfileInitial());

  Future<void> getProfile(String profileName) async {
    state = const ProfileLoading();
    final result = await getUserProfileUsecase(profileName);
    result?.fold(
        (l) => state = ProfileError(l), (r) => state = ProfileLoaded(r));
  }
}
