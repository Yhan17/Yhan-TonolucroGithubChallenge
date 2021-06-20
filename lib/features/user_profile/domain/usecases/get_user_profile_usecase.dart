import 'package:dartz/dartz.dart';
import 'package:tonolucro_challenge/core/errors/failures.dart';

import '/core/usecases/usecase.dart';
import '/features/user_profile/domain/entities/user_profile_entity.dart';
import '/features/user_profile/domain/repostiories/user_profile_repository.dart';

class GetUserProfileUsecase implements Usecase<UserProfileEntity, String> {
  final UserProfileRepository repository;

  GetUserProfileUsecase(this.repository);

  @override
  Future<Either<Failure, UserProfileEntity>?> call(String? params) async {
    if (params != null) {
      return repository.getUserProfile(params);
    }
    return Left(NullUserParam());
  }
}
