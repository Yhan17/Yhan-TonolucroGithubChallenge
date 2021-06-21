import 'package:tonolucro_challenge/features/repository_contributors/infra/models/contributor_model.dart';

abstract class AbstractGithubContributorsDatasource {
  Future<List<ContributorModel>>? searchRepoContributors(
      String? nickname, String? repoName);
}
