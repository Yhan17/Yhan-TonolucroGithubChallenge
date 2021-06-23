import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tonolucro_challenge/features/user_profile/domain/usecases/get_user_profile_usecase.dart';
import 'package:tonolucro_challenge/features/user_profile/domain/usecases/get_user_repos_usecase.dart';
import 'package:tonolucro_challenge/features/user_profile/external/github/github_user_profile_datasource.dart';
import 'package:tonolucro_challenge/features/user_profile/infra/repositories/user_profile_repository_implementation.dart';
import 'package:tonolucro_challenge/features/user_profile/presentation/providers/search_profile_notifier_provider.dart';
import 'package:tonolucro_challenge/features/user_profile/presentation/providers/search_page_state.dart';

class SearchUserPage extends ConsumerWidget {
  SearchUserPage({Key? key}) : super(key: key);
  static const image = "assets/images/github.png";
  final _userProfile =
      StateNotifierProvider<SearchProfileNotifierProvider, ProfileState>((
    ref,
  ) {
    final profileDataSource = Provider((ref) => GithubUserProfileDatasource());
    final userProfileRepository = Provider((ref) =>
        UserProfileRepositoryImplementation(ref.read(profileDataSource)));

    final getUserProfileUsecase = Provider(
        (ref) => GetUserProfileUsecase(ref.read(userProfileRepository)));
    final getUserReposUsecase =
        Provider((ref) => GetUserReposUsecase(ref.read(userProfileRepository)));

    return SearchProfileNotifierProvider(
      getUserProfileUsecase: ref.read(getUserProfileUsecase),
      getUserReposUsecase: ref.read(getUserReposUsecase),
    );
  });
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context, ScopedReader watch) => Scaffold(
          body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Pesquise no Github",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontFamily: 'SF Pro Display',
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Escreva o nickname de um usuário",
                    style: TextStyle(
                        color: Colors.grey[400],
                        fontFamily: 'SF Pro Display',
                        fontSize: 16),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 60, vertical: 29),
                    child: TextFormField(
                        controller: _controller,
                        keyboardType: TextInputType.text,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        cursorColor: Colors.white,
                        onChanged: (param) {},
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 40),
                            ),
                            labelText: "Usuário",
                            labelStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white))),
                  ),
                  TextButton(
                    onPressed: () {
                      var a = context
                          .read(_userProfile.notifier)
                          .getProfile(_controller.text);
                      print(a.toString());
                    },
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(5),
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xFF24292E)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                horizontal: 44, vertical: 14))),
                    child: const Text(
                      'Buscar',
                      style: TextStyle(
                          color: Color(0xFF2188FF),
                          fontSize: 32,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ));
}
