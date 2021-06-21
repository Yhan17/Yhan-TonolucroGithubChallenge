import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tonolucro_challenge/core/errors/failures.dart';
import 'package:tonolucro_challenge/features/repository_contributors/domain/entities/contributor_entity.dart';
import 'package:tonolucro_challenge/features/repository_contributors/external/github/github_contributor_datasource.dart';
import 'package:tonolucro_challenge/features/repository_contributors/infra/models/contributor_model.dart';
import 'package:tonolucro_challenge/features/repository_contributors/infra/repositories/contributor_repository_implementation.dart';

import '../../mocks/contributors_model_mock.dart';

class GithubContributorsDatasourceMock extends Mock
    implements GithubContributorsDatasource {}

void main() {
  final datasource = GithubContributorsDatasourceMock();
  final repository = ContributorRepositoryImplementation(datasource);

  test('Deve retornar uma lista de contribuidores de um repositorio no github',
      () async {
    when(datasource.searchRepoContributors("Yhan17", "Team-mercury-dashboard"))
        .thenAnswer((_) async => <ContributorModel>[contributorsModel]);

    final result = await repository.getRepoContributors(
        "Yhan17", "Team-mercury-dashboard");
    expect(result?.fold(id, id), isA<List<ContributorModel>>());
  });

  test(
      'Deve retornar uma RepoContributorsDataSourceFailure quando não conseguir executar o datasource de contribuidores',
      () async {
    when(datasource.searchRepoContributors(any, any))
        .thenThrow(RepoContributorsDataSourceFailure());
    final result = await repository.getRepoContributors(
        "Yhan17", "Team-mercury-dashboard");
    expect(result, Left(RepoContributorsDataSourceFailure()));
  });
}
