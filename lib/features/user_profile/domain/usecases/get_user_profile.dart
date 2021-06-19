import 'package:dartz/dartz.dart';

import '/features/user_profile/domain/entities/user_entity.dart';
import '/features/user_profile/domain/errors/errors.dart';
import '/features/user_profile/domain/repostiories/user_profile_repository.dart';

class GetUserProfile {
  final UserProfileRepository repository;

  GetUserProfile(this.repository);

  Future<Either<FailureUserProfile, UserEntity>> call(String nick) async {
    return repository.getUserProfile(nick);
  }
}
