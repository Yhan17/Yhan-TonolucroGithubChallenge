import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tonolucro_challenge/features/user_profile/domain/usecases/get_user_repos_usecase.dart';

import '/features/user_profile/domain/usecases/get_user_profile_usecase.dart';
import '/features/user_profile/external/github/github_user_profile_datasource.dart';
import '/features/user_profile/infra/repositories/user_profile_repository_implementation.dart';
import '/features/user_profile/presentation/providers/search_page_state.dart';
import '/features/user_profile/presentation/providers/search_profile_notifier_provider.dart';
import '/features/user_profile/presentation/widgets/search_user_text_widget.dart';

class SearchUserPage extends ConsumerWidget {
  SearchUserPage({Key? key}) : super(key: key);
  static const image = "assets/images/github.png";
  final _userProfile =
      StateNotifierProvider<SearchProfileNotifierProvider, SearchState>((
    ref,
  ) {
    final profileDataSource = Provider((ref) => GithubUserProfileDatasource());
    final userProfileRepository = Provider((ref) =>
        UserProfileRepositoryImplementation(ref.read(profileDataSource)));

    final getUserProfileUsecase = Provider(
        (ref) => GetUserProfileUsecase(ref.read(userProfileRepository)));

    return SearchProfileNotifierProvider(
      getUserProfileUsecase: ref.read(getUserProfileUsecase),
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
                  ProviderListener(
                    onChange: (context, state) {},
                    provider: _userProfile,
                    child: Consumer(
                      builder: (context, watch, child) {
                        final state = watch(_userProfile);
                        if (state is SearchInitial) {
                          return SearchUserTextInputWidget(
                              controller: _controller);
                        }

                        if (state is SearchLoading) {
                          // ignore: avoid_unnecessary_containers
                          return const Padding(
                            padding: EdgeInsets.all(12),
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }

                        if (state is SearchError) {
                          return SearchUserTextInputWidget(
                              controller: _controller,
                              errorText: "Erro ao realizar a requisição");
                        }
                        return SearchUserTextInputWidget(
                            controller: _controller);
                      },
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context
                          .read(_userProfile.notifier)
                          .getProfile(_controller.text.trim());
                      _controller.text = "";
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
