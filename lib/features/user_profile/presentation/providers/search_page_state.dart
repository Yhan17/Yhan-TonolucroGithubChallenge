import '/core/errors/failures.dart';

import '/features/user_profile/domain/entities/user_profile_entity.dart';

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
