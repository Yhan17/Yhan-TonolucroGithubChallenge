import "package:dartz/dartz.dart";
import '/core/errors/failures.dart';
import '/features/user_profile/domain/entities/user_profile_entity.dart';
import '/features/user_profile/domain/entities/user_repos_entity.dart';
//Padrão Dart

abstract class UserProfileRepository {
  Future<Either<Failure, UserProfileEntity>>? getUserProfile(String? nick);
  Future<Either<Failure, List<UserRepoEntity>>>? getUserRepos(String? nick);
}
