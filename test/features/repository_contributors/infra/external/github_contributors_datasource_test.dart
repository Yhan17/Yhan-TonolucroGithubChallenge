import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:tonolucro_challenge/core/errors/failures.dart';
import 'package:tonolucro_challenge/features/repository_contributors/external/github/github_contributor_datasource.dart';
import 'package:tonolucro_challenge/features/repository_contributors/infra/models/contributor_model.dart';

void main() {
  final datasource = GithubContributorsDatasource();

  test("Testa Requisição na Api de contribuidores", () async {
    final result = await http.get(Uri.parse(
        "https://api.github.com/repos/Yhan17/Team-mercury-dashboard/contributors"));

    expect(result.statusCode, 200);
  });

  test("Deve retornar uma lista de contribuidores do repositorio de um usuario",
      () async {
    final result = await datasource.searchRepoContributors(
        "Yhan17", "Team-mercury-dashboard");
    expect(result, isA<List<ContributorModel>>());
  });

  test(
      "Deve retornar um UserProfileDataSourceFailure quando falhar a requisição caso seja passado um usuário invalido",
      () async {
    expect(
        () async => datasource.searchRepoContributors(
            "Yhan1745", "Team-mercury-dashboard"),
        throwsA(isA<RepoContributorsDataSourceFailure>()));
  });
  test(
      "Deve retornar um UserProfileDataSourceFailure quando falhar a requisição caso seja passado um repositório invalido",
      () async {
    expect(
        () async => datasource.searchRepoContributors(
            "Yhan1745", "Team-mercury-dashboardddd"),
        throwsA(isA<RepoContributorsDataSourceFailure>()));
  });
}
