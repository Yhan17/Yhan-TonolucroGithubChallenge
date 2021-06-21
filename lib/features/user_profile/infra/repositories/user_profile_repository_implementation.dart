import 'package:dartz/dartz.dart';
import '/core/errors/failures.dart';
import '/features/user_profile/domain/entities/user_profile_entity.dart';
import '/features/user_profile/domain/entities/user_repos_entity.dart';
import '/features/user_profile/domain/repositories/user_profile_repository.dart';
import '/features/user_profile/infra/datasources/github_datasource.dart';
import '/features/user_profile/infra/models/user_profile_model.dart';

class UserProfileRepositoryImplementation implements UserProfileRepository {
  final GithubDatasource datasource;

  UserProfileRepositoryImplementation(this.datasource);
  @override
  Future<Either<Failure, UserProfileEntity>>? getUserProfile(
      String? nick) async {
    UserProfileModel? profile;
    try {
      profile = await datasource.searchUser(nick);
    } catch (e) {
      return Left(UserProfileDataSourceFailure());
    }
    return Right(profile!);
  }

  @override
  Future<Either<Failure, List<UserRepoEntity>>>? getUserRepos(
      String? nick) async {
    List<UserRepoEntity>? repos;
    try {
      repos = await datasource.searchRepos(nick);
    } catch (e) {
      return Left(UserProfileDataSourceFailure());
    }
    return Right(repos!);
  }
}
