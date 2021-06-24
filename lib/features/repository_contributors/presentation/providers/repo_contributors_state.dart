import 'package:tonolucro_challenge/features/user_profile/domain/entities/user_profile_entity.dart';

import '/core/errors/failures.dart';

abstract class ContributorRepoState {
  const ContributorRepoState();
}

class ContributorRepoStateInitial extends ContributorRepoState {
  const ContributorRepoStateInitial();
}

class ContributorRepoStateLoading extends ContributorRepoState {
  const ContributorRepoStateLoading();
}

class ContributorRepoStateLoaded extends ContributorRepoState {
  final UserProfileEntity profile;
  const ContributorRepoStateLoaded(this.profile);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ContributorRepoStateLoaded && o.profile == profile;
  }

  @override
  int get hashCode => profile.hashCode;
}

class ContributorRepoStateError extends ContributorRepoState {
  final Failure failure;
  const ContributorRepoStateError(this.failure);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ContributorRepoStateError && o.failure == failure;
  }

  @override
  int get hashCode => failure.hashCode;
}
