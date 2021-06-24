import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tonolucro_challenge/features/repository_contributors/presentation/providers/repo_contributors_notifier_provider.dart';
import 'package:tonolucro_challenge/features/repository_contributors/presentation/providers/repo_contributors_state.dart';
import '/features/repository_contributors/domain/entities/contributor_entity.dart';
import '/features/user_profile/domain/usecases/get_user_profile_usecase.dart';
import '/features/user_profile/external/github/github_user_profile_datasource.dart';
import '/features/user_profile/infra/repositories/user_profile_repository_implementation.dart';

class GithubContributorsCard extends ConsumerWidget {
  final ContributorEntity contributor;
  GithubContributorsCard({Key? key, required this.contributor})
      : super(key: key);
  final _contributorProfile = StateNotifierProvider<
      RepoContributorNotifierProvider, ContributorRepoState>((
    ref,
  ) {
    final profileDataSource = Provider((ref) => GithubUserProfileDatasource());
    final userProfileRepository = Provider((ref) =>
        UserProfileRepositoryImplementation(ref.read(profileDataSource)));

    final getUserProfileUsecase = Provider(
        (ref) => GetUserProfileUsecase(ref.read(userProfileRepository)));

    return RepoContributorNotifierProvider(
      getUserProfileUsecase: ref.read(getUserProfileUsecase),
    );
  });
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(900),
                    image: DecorationImage(
                        image: NetworkImage(contributor.avatar),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  // ignore: prefer_const_constructors
                  Text("Contribuidor",
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'SF Pro Display',
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                  // ignore: prefer_const_constructors
                  Text(contributor.nick,
                      style: const TextStyle(
                          color: Colors.grey,
                          fontFamily: 'SF Pro Display',
                          fontSize: 12)),
                  // ignore: prefer_const_constructors
                  Text.rich(TextSpan(
                      text: "Contribuições: ",
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'SF Pro Display',
                          fontSize: 12),
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        // ignore: prefer_const_constructors
                        TextSpan(
                            text: contributor.contributions.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'SF Pro Display',
                                fontSize: 12))
                      ])),
                ],
              ),
            ],
          ),
          TextButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(const Color(0xFF24292E)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5))),
              ),
              onPressed: () {
                context
                    .read(_contributorProfile.notifier)
                    .getProfile(contributor.nick);
              },
              // ignore: prefer_const_constructors
              child: Text("Visualizar Perfil",
                  style: const TextStyle(color: Color(0xFF2188FF))))
        ],
      ),
    );
  }
}
