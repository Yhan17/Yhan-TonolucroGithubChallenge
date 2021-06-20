import "package:dartz/dartz.dart";
//Padrão Dart
import '../entities/user_entity.dart';
import '/features/user_profile/domain/errors/errors.dart';

abstract class UserProfileRepository {
  Future<Either<InvalidUserProfile, UserEntity>>? getUserProfile(String? nick);

  Future<Either<FailureUserProfile, UserEntity>>? getProfileRequest(String? nick);
}
