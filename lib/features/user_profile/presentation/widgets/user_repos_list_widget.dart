import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tonolucro_challenge/features/user_profile/domain/entities/user_profile_entity.dart';
import 'package:tonolucro_challenge/features/user_profile/domain/entities/user_repos_entity.dart';
import 'package:tonolucro_challenge/features/user_profile/domain/usecases/get_user_repos_usecase.dart';
import 'package:tonolucro_challenge/features/user_profile/external/github/github_user_profile_datasource.dart';
import 'package:tonolucro_challenge/features/user_profile/infra/repositories/user_profile_repository_implementation.dart';
import 'package:tonolucro_challenge/features/user_profile/presentation/providers/user_repos_notifier_provider.dart';
import 'package:tonolucro_challenge/features/user_profile/presentation/providers/user_repos_state.dart';

import 'github_repo_card_widget.dart';

class UserRepoListWidget extends StatefulWidget {
  final UserProfileEntity entity;
  const UserRepoListWidget({Key? key, required this.entity}) : super(key: key);

  @override
  _UserRepoListWidgetState createState() => _UserRepoListWidgetState();
}

class _UserRepoListWidgetState extends State<UserRepoListWidget> {
  final _userRepos =
      StateNotifierProvider<UserRepoNotifierProvider, UserRepoState>((
    ref,
  ) {
    final profileDataSource = Provider((ref) => GithubUserProfileDatasource());
    final userProfileRepository = Provider((ref) =>
        UserProfileRepositoryImplementation(ref.read(profileDataSource)));

    final getUserReposUsecase =
        Provider((ref) => GetUserReposUsecase(ref.read(userProfileRepository)));

    return UserRepoNotifierProvider(
        getUserReposUsecase: ref.read(getUserReposUsecase));
  });
  List<UserRepoEntity> repos = [];
  @override
  void initState() {
    super.initState();
    context
        .read(_userRepos.notifier)
        .getUserReposUsecase(widget.entity.nick)
        .then((value) {
      value?.fold((l) => null, (r) {
        repos.addAll(r);
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    context.read(_userRepos.notifier).getUserReposUsecase(widget.entity.nick);

    repos = context.read(_userRepos.notifier).repos;
    return Expanded(
      child: Container(
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(16),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    // ignore: prefer_const_constructors
                    Text(
                      widget.entity.nick,
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontFamily: "SF Pro Display"),
                    ),
                    // ignore: prefer_const_constructors
                    Text(
                      "Repositórios",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: "SF Pro Display"),
                    ),
                  ],
                ),
              ),
            ),
            Consumer(
              builder: (context, watch, child) {
                watch(_userRepos.notifier).getUserRepos(widget.entity.nick);
                final repos = watch(_userRepos.notifier).repos;
                return Flexible(
                  flex: 5,
                  child: Container(
                    child: ListView.builder(
                      itemCount: repos.length,
                      itemBuilder: (context, index) {
                        return GithubRepoCard(
                            repo: repos[index], repoOwner: widget.entity.nick);
                      },
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
