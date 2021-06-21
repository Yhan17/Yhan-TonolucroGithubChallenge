import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tonolucro_challenge/core/errors/failures.dart';
import 'package:tonolucro_challenge/features/user_profile/infra/datasources/abstract_github_profile_datasource.dart';
import 'package:tonolucro_challenge/features/user_profile/infra/models/user_repos_model.dart';
import 'package:tonolucro_challenge/features/user_profile/infra/repositories/user_profile_repository_implementation.dart';

import '../../mocks/user_profile_model_mock.dart';
import '../../mocks/user_repo_model_mock.dart';

class GithubDatasourceMock extends Mock implements AbstractGithubDatasource {}

void main() {
  final datasource = GithubDatasourceMock();
  final repository = UserProfileRepositoryImplementation(datasource);

  test('Deve retornar um perfil do github', () async {
    when(datasource.searchUser("Yhan17")).thenAnswer((_) async => userModel);

    final result = await repository.getUserProfile("Yhan17");
    expect(result, const Right(userModel));
  });

  test(
      'Deve retornar uma UserProfileDataSourceFailure quando não conseguir executar o datasource',
      () async {
    when(datasource.searchUser(any)).thenThrow(UserProfileDataSourceFailure());
    final result = await repository.getUserProfile("Yhan17");
    expect(result, Left(UserProfileDataSourceFailure()));
  });

  test('Deve retornar uma lista de repositórios de um usuario no github',
      () async {
    when(datasource.searchRepos("Yhan17"))
        .thenAnswer((_) async => <UserRepoModel>[repoModel]);

    final result = await repository.getUserRepos("Yhan17");
    expect(result?.fold(id, id), isA<List<UserRepoModel>>());
  });

  test(
      'Deve retornar uma RepoContributorsDataSourceFailure quando não conseguir executar o datasource de contribuidores',
      () async {
    when(datasource.searchRepos(any)).thenThrow(UserProfileDataSourceFailure());
    final result = await repository.getUserRepos("Yhan17");
    expect(result, Left(UserProfileDataSourceFailure()));
  });
}
