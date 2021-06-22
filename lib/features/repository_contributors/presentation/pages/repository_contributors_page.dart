import 'package:flutter/material.dart';
import 'package:tonolucro_challenge/features/repository_contributors/presentation/widgets/github_contriutors_card_widget.dart';

class RepositoryContributorsPage extends StatelessWidget {
  const RepositoryContributorsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // ignore: prefer_const_constructors
            Text(
              "Nome do Repositorio",
              style: const TextStyle(
                  color: Colors.grey,
                  fontFamily: 'SF Pro Display',
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
            // ignore: prefer_const_constructors
            Text("Contribuintes",
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'SF Pro Display',
                    fontSize: 24)),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.onBackground,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const GithubContributorsCard();
        },
      ),
    );
  }
}
