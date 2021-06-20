import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tonolucro_challenge/core/errors/failures.dart';
import 'package:tonolucro_challenge/features/user_profile/domain/entities/user_repos_entity.dart';
import 'package:tonolucro_challenge/features/user_profile/domain/repostiories/user_profile_repository.dart';
import 'package:tonolucro_challenge/features/user_profile/domain/usecases/get_user_repos_usecase.dart';

import '../../mocks/repos_mock.dart';

class UserProfileRepositoryMock extends Mock implements UserProfileRepository {}

void main() {
  final repository = UserProfileRepositoryMock();
  final usecase = GetUserReposUsecase(repository);

  test(
      "Deve Retornar NullFailure caso não seja passado usuario para os repositorios",
      () async {
    final result = await usecase(null);
    expect(result, Left(NullUserParam()));
  });
  test("Deve Retornar uma lista de Repositórios", () async {
    when(repository.getUserRepos("Yhan17"))
        .thenAnswer((_) async => const Right(<UserRepoEntity>[repoEntity]));

    final result = await usecase("Yhan17");
    expect(result, isA<List<UserRepoEntity>>());
  });
}
