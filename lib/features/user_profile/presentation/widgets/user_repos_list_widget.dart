import 'package:flutter/material.dart';
import 'package:tonolucro_challenge/features/user_profile/domain/entities/user_repos_entity.dart';

import 'github_repo_card_widget.dart';

class UserRepoListWidget extends StatelessWidget {
  static List<Map> repos = [
    {
      "name": "Repositório",
      "description": "Uma bela descrição",
      "language": "Vue",
      "stars": 10,
      "forks": 3,
    },
    {
      "name": "Repositório2",
      "description": "Uma bela descrição",
      "language": null,
      "stars": 10,
      "forks": 3,
    },
    {
      "name": "Repositório",
      "description": null,
      "language": "Vue",
      "stars": 10,
      "forks": 3,
    },
    {
      "name": "Repositório",
      "description": null,
      "language": "Vue",
      "stars": 10,
      "forks": 3,
    },
    {
      "name": "Repositório",
      "description": null,
      "language": "Vue",
      "stars": 10,
      "forks": 3,
    },
    {
      "name": "Repositório",
      "description": null,
      "language": "Vue",
      "stars": 10,
      "forks": 3,
    },
  ];
  const UserRepoListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
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
                      "Yhan17",
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
            Flexible(
              flex: 5,
              child: Container(
                child: ListView.builder(
                  itemCount: repos.length,
                  itemBuilder: (context, index) {
                    final entity = UserRepoEntity(
                        forks: repos[index]['forks'] as int,
                        name: repos[index]['name'].toString(),
                        stars: repos[index]['stars'] as int,
                        description: repos[index]['description'].toString());
                    return GithubRepoCard(repo: entity, repoOwner: "Yhan17");
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
