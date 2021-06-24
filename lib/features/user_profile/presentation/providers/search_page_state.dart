import '/core/errors/failures.dart';

import '/features/user_profile/domain/entities/user_profile_entity.dart';

abstract class SearchState {
  const SearchState();
}

class SearchInitial extends SearchState {
  const SearchInitial();
}

class SearchLoading extends SearchState {
  const SearchLoading();
}

class SearchLoaded extends SearchState {
  final UserProfileEntity profile;
  const SearchLoaded(this.profile);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SearchLoaded && o.profile == profile;
  }

  @override
  int get hashCode => profile.hashCode;
}

class SearchError extends SearchState {
  final Failure failure;
  const SearchError(this.failure);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SearchError && o.failure == failure;
  }

  @override
  int get hashCode => failure.hashCode;
}
