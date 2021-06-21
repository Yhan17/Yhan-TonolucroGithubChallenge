import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '/core/errors/failures.dart';

abstract class ContributorsUsecase<Output, Input> {
  Future<Either<Failure, Output>?> call(Input owner, Input repoName);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
