import 'package:dartz/dartz.dart';

import '/features/user_profile/domain/entities/user_entity.dart';
import '/features/user_profile/domain/errors/errors.dart';
import '/features/user_profile/domain/repostiories/user_profile_repository.dart';

class GetProfileRequest {
  final UserProfileRepository repository;

  GetProfileRequest(this.repository);

  Future<Either<Failure, UserEntity>?> call(String? nick) async {
    if (nick != null) {
      return await repository.getProfileRequest(nick);
    }
    return Left(FailureUserProfile());
  }
}
