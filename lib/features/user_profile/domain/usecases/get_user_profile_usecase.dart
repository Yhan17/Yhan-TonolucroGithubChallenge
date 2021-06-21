import 'package:dartz/dartz.dart';
import 'package:tonolucro_challenge/core/errors/failures.dart';
import 'package:tonolucro_challenge/features/user_profile/domain/repositories/user_profile_repository.dart';

import '../../../../core/usecases/profile_usecase.dart';
import '/features/user_profile/domain/entities/user_profile_entity.dart';

class GetUserProfileUsecase implements ProfileUsecase<UserProfileEntity, String> {
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
