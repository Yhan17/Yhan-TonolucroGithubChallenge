import 'package:tonolucro_challenge/features/user_profile/domain/entities/user_repos_entity.dart';

import '/core/errors/failures.dart';

abstract class UserRepoState {
  const UserRepoState();
}

class UserRepoInitial extends UserRepoState {
  const UserRepoInitial();
}

class UserRepoLoading extends UserRepoState {
  const UserRepoLoading();
}

class UserRepoLoaded extends UserRepoState {
  final List<UserRepoEntity> repos;
  const UserRepoLoaded(this.repos);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is UserRepoLoaded && o.repos == repos;
  }

  @override
  int get hashCode => repos.hashCode;
}

class UserRepoError extends UserRepoState {
  final Failure failure;
  const UserRepoError(this.failure);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is UserRepoError && o.failure == failure;
  }

  @override
  int get hashCode => failure.hashCode;
}
