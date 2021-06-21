import "package:dartz/dartz.dart";
import '/core/errors/failures.dart';
import '/features/repository_contributors/domain/entities/contributor_entity.dart';

//Padrão Dart

abstract class ContributorRepository {
  Future<Either<Failure, List<ContributorEntity>>>? getRepoContributors(
      String? owner, String? repoName);
}
