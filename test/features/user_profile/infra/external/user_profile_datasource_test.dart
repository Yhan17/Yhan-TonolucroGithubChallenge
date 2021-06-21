import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:tonolucro_challenge/core/errors/failures.dart';
import 'package:tonolucro_challenge/features/user_profile/external/github/github_user_profile_datasource.dart';
import 'package:tonolucro_challenge/features/user_profile/infra/models/user_profile_model.dart';
import 'package:tonolucro_challenge/features/user_profile/infra/models/user_repos_model.dart';
import '../../mocks/user_external_request_mock.dart';

void main() {
  final datasource = GithubUserProfileDatasource();

  test("Testa Requisição na Api usuario", () async {
    final client = MockClient((request) async {
      return http.Response(json.encode(response), 200);
    });
    final result =
        await http.get(Uri.parse("https://api.github.com/users/Yhan17"));

    expect(result.body, contains('login'));
  });
  test("Deve retornar um perfil do github", () async {
    final result = await datasource.searchUser("Yhan17");
    expect(result, isA<UserProfileModel>());
  });
  test(
      "Deve retornar um UserProfileDataSourceFailure quando não encontrar um perfil",
      () async {
    expect(() async => datasource.searchUser("Yhan1745"),
        throwsA(isA<UserProfileDataSourceFailure>()));
  });
  test("Testa Requisição na Api repositorios", () async {
    final result =
        await http.get(Uri.parse("https://api.github.com/users/Yhan17/repos"));

    expect(result.statusCode, 200);
  });

  test("Deve retornar uma lista de repositorios de um usuario", () async {
    final result = await datasource.searchRepos("Yhan17");
    expect(result, isA<List<UserRepoModel>>());
  });

  test(
      "Deve retornar um UserProfileDataSourceFailure quando falhar a requisição de uma lista de repositorios",
      () async {
    expect(() async => datasource.searchRepos("Yhan1745"),
        throwsA(isA<UserProfileDataSourceFailure>()));
  });
}
