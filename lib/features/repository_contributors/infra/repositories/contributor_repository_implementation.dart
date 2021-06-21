import 'package:dartz/dartz.dart';
import '/core/errors/failures.dart';
import '/features/repository_contributors/domain/entities/contributor_entity.dart';
import '/features/repository_contributors/domain/repositories/contributor_repository.dart';
import '/features/repository_contributors/infra/datasources/abstract_github_contributors_datasource.dart';
import '/features/repository_contributors/infra/models/contributor_model.dart';

class ContributorRepositoryImplementation implements ContributorRepository {
  final AbstractGithubContributorsDatasource datasource;

  ContributorRepositoryImplementation(this.datasource);
  @override
  Future<Either<Failure, List<ContributorEntity>>>? getRepoContributors(
      String? owner, String? repoName) async {
    List<ContributorModel>? repos;
    try {
      repos = await datasource.searchRepoContributors(owner, repoName);
    } catch (e) {
      return Left(RepoContributorsDataSourceFailure());
    }
    return Right(repos!);
  }
}
