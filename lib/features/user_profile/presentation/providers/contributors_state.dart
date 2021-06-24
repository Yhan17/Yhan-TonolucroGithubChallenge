import 'package:tonolucro_challenge/features/repository_contributors/domain/entities/contributor_entity.dart';

import '/core/errors/failures.dart';

abstract class ContributorsState {
  const ContributorsState();
}

class ContributorsStateInitial extends ContributorsState {
  const ContributorsStateInitial();
}

class ContributorsStateLoading extends ContributorsState {
  const ContributorsStateLoading();
}

class ContributorsStateLoaded extends ContributorsState {
  final List<ContributorEntity> repos;
  const ContributorsStateLoaded(this.repos);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ContributorsStateLoaded && o.repos == repos;
  }

  @override
  int get hashCode => repos.hashCode;
}

class ContributorsStateError extends ContributorsState {
  final Failure failure;
  const ContributorsStateError(this.failure);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ContributorsStateError && o.failure == failure;
  }

  @override
  int get hashCode => failure.hashCode;
}
