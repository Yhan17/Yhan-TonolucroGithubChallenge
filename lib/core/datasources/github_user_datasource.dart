import '/features/user_profile/infra/models/user_profile_model.dart';
import '/features/user_profile/infra/models/user_repos_model.dart';

abstract class GithubDatasource {
  Future<UserProfileModel> searchUser(String nickname);
  Future<List<UserRepoModel>> searchRepos(String nickname);
}
