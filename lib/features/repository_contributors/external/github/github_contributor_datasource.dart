import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tonolucro_challenge/core/errors/failures.dart';
import 'package:tonolucro_challenge/features/repository_contributors/infra/datasources/abstract_github_contributors_datasource.dart';
import 'package:tonolucro_challenge/features/repository_contributors/infra/models/contributor_model.dart';

class GithubContributorsDatasource
    implements AbstractGithubContributorsDatasource {
  @override
  Future<List<ContributorModel>>? searchRepoContributors(
      String? nickname, String? repoName) async {
    final response = await http.get(Uri.parse(
        "https://api.github.com/repos/$nickname/$repoName/contributors"));
    if (response.statusCode == 200) {
      final reposJson = json.decode(response.body) as List;
      final repos = reposJson
          .map((e) => ContributorModel.fromMap(e as Map<String, dynamic>))
          .toList();
      return repos;
    }
    throw RepoContributorsDataSourceFailure();
  }
}
