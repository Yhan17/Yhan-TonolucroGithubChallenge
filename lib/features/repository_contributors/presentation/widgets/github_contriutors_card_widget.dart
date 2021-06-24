import 'package:flutter/material.dart';
import 'package:tonolucro_challenge/features/repository_contributors/domain/entities/contributor_entity.dart';

class GithubContributorsCard extends StatelessWidget {
  final ContributorEntity contributor;
  const GithubContributorsCard({Key? key, required this.contributor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return GestureDetector(
      onTap: () {
        print("clicou");
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey))),
        child: Row(
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
            )
          ],
        ),
      ),
    );
  }
}
