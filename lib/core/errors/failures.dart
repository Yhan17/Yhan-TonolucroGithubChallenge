import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable implements Exception {}

class FailureApiUserProfile extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserProfileDataSourceFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class RepoContributorsDataSourceFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InvalidUserParam extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NullUserParam extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class EmptyList extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
