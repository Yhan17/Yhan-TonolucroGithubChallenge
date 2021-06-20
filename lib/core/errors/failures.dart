import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class FailureApiUserProfile extends Failure {
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
