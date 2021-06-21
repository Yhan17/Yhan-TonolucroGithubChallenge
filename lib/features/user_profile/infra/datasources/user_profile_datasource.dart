import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tonolucro_challenge/core/errors/failures.dart';

import '/core/datasources/github_user_datasource.dart';
import '/features/user_profile/infra/models/user_profile_model.dart';
import '/features/user_profile/infra/models/user_repos_model.dart';

class UserProfileDatasource implements GithubDatasource {
  @override
  Future<List<UserRepoModel>> searchRepos(String nickname) async {
    final response = await http
        .get(Uri.parse("https://api.github.com/users/$nickname/repos"));
    if (response.statusCode == 200) {
      final reposJson = json.decode(response.body) as List;
      final repos = reposJson
          .map((e) => UserRepoModel.fromMap(e as Map<String, dynamic>))
          .toList();
      return repos;
    }
    throw UserProfileDataSourceFailure();
  }

  @override
  Future<UserProfileModel> searchUser(String nickname) async {
    final response =
        await http.get(Uri.parse("https://api.github.com/users/$nickname"));
    if (response.statusCode == 200) {
      final profileBody = json.decode(response.body);
      final profile =
          UserProfileModel.fromJson(profileBody as Map<String, dynamic>);
      return profile;
    }
    throw UserProfileDataSourceFailure();
  }
}
