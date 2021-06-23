import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tonolucro_challenge/features/user_profile/domain/entities/user_profile_entity.dart';
import 'package:tonolucro_challenge/features/user_profile/presentation/widgets/user_profile_topbar_widget.dart';
import 'package:tonolucro_challenge/features/user_profile/presentation/widgets/user_repos_list_widget.dart';

class UserProfilePage extends StatelessWidget {
  final UserProfileEntity entity;

  const UserProfilePage({Key? key, required this.entity}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UserProfileTopbarWidget(
        entity: entity,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 20,
              width: MediaQuery.of(context).size.width,
              color: const Color(0xFF24292E),
            ),
            const UserRepoListWidget()
          ],
        ),
      ),
    );
  }
}
