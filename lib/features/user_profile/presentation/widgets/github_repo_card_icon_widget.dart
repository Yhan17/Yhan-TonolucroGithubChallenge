import 'package:flutter/material.dart';

class GithubRepoCardIconWidget extends StatelessWidget {
  final Icon icon;
  final String? value;
  const GithubRepoCardIconWidget(
      {Key? key, required this.icon, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 10),
      child: Row(
        children: [
          icon,
          Text(
              value != "null" && value != null
                  ? value.toString()
                  : "Não definido",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: "SF Pro Display"))
        ],
      ),
    );
  }
}
