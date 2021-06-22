import 'package:flutter/material.dart';

class GithubContributorsCard extends StatelessWidget {
  const GithubContributorsCard({Key? key}) : super(key: key);

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
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://ui-avatars.com/api/?name=Yhan&color=ffffff&background=6a86a1"),
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
                Text("Nome de Perfil",
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
                          text: "0",
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
