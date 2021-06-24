import 'package:flutter/material.dart';
import 'package:tonolucro_challenge/features/user_profile/domain/entities/user_repos_entity.dart';
import 'package:tonolucro_challenge/features/user_profile/presentation/widgets/github_repo_card_icon_widget.dart';

class GithubRepoCard extends StatelessWidget {
  final UserRepoEntity repo;
  final String repoOwner;
  const GithubRepoCard({Key? key, required this.repo, required this.repoOwner})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.white))),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(repo.name,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: "SF Pro Display")),
          Text(
              repo.description != "null" && repo.description != null
                  ? repo.description.toString()
                  : "Sem Descrição",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: "SF Pro Display")),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            // ignore: avoid_unnecessary_containers
            Container(
              child: Row(
                children: [
                  GithubRepoCardIconWidget(
                    icon: const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    value: repo.stars.toString(),
                  ),
                  GithubRepoCardIconWidget(
                    icon: const Icon(
                      Icons.circle,
                      color: Colors.green,
                    ),
                    value: repo.language,
                  ),
                  GithubRepoCardIconWidget(
                    icon: const Icon(
                      Icons.account_circle,
                    ),
                    value: repo.forks.toString(),
                  ),
                ],
              ),
            ),
            // ignore: avoid_unnecessary_containers
            Container(
                child: TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFF24292E)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                    ),
                    onPressed: () {},
                    // ignore: prefer_const_constructors
                    child: Text("Contribuintes",
                        style: const TextStyle(color: Color(0xFF2188FF)))))
          ]),
        ],
      ),
    );
  }
}
