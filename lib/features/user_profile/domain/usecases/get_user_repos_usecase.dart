import 'package:dartz/dartz.dart';

import '/core/errors/failures.dart';
import '/core/usecases/usecase.dart';
import '/features/user_profile/domain/entities/user_repos_entity.dart';
import '/features/user_profile/domain/repostiories/user_profile_repository.dart';

class GetUserReposUsecase implements Usecase<List<UserRepoEntity>, String> {
  final UserProfileRepository repository;

  GetUserReposUsecase(this.repository);

  @override
  Future<Either<Failure, List<UserRepoEntity>>?> call(String? params) async {
    if (params != null) {
      final result = await repository.getUserRepos(params);
      return result?.where((r) => r.isNotEmpty, () => EmptyList());
    }
    return Left(NullUserParam());
  }
}
