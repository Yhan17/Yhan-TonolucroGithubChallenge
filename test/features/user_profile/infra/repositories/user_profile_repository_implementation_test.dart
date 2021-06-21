import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tonolucro_challenge/core/errors/failures.dart';
import 'package:tonolucro_challenge/features/user_profile/domain/entities/user_profile_entity.dart';
import 'package:tonolucro_challenge/features/user_profile/infra/datasources/github_datasource.dart';
import 'package:tonolucro_challenge/features/user_profile/infra/models/user_profile_model.dart';
import 'package:tonolucro_challenge/features/user_profile/infra/repositories/user_profile_repository_implementation.dart';

import '../../mocks/user_profile_model_mock.dart';

class GithubDatasourceMock extends Mock implements GithubDatasource {}

void main() {
  final datasource = GithubDatasourceMock();
  final repository = UserProfileRepositoryImplementation(datasource);

  test('Deve retornar um perfil do github', () async {
    when(datasource.searchUser("Yhan17")).thenAnswer((_) async => userModel);

    final result = await repository.getUserProfile("Yhan17");
    expect(result, const Right(userModel));
  });

  test(
      'Deve retornar uma UserProfileDataSourceFailure quando não conseguir executar o datasource',
      () async {
    when(datasource.searchUser(any)).thenThrow(UserProfileDataSourceFailure());
    final result = await repository.getUserProfile("Yhan17");
    expect(result, Left(UserProfileDataSourceFailure()));
  });
}
