import 'package:dartz/dartz.dart';
import 'package:tonolucro_challenge/core/usecases/contributors_usecase.dart';

import '/core/errors/failures.dart';
import '/features/repository_contributors/domain/entities/contributor_entity.dart';
import '/features/repository_contributors/domain/repositories/contributor_repository.dart';

class GetContributorsUsecase implements ContributorsUsecase<List<ContributorEntity>, String> {
  final ContributorRepository repository;

  GetContributorsUsecase(this.repository);

  @override
  Future<Either<Failure, List<ContributorEntity>>?> call(String? owner,String? repoName) async {
    if (owner != null && repoName != null) {
      final result = await repository.getRepoContributors(owner, repoName);
      return result?.where((r) => r.isNotEmpty, () => EmptyList());
    }
    return Left(NullUserParam());
  }
}
