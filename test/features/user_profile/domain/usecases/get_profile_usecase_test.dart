import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tonolucro_challenge/core/errors/failures.dart';
import 'package:tonolucro_challenge/features/user_profile/domain/entities/user_profile_entity.dart';
import 'package:tonolucro_challenge/features/user_profile/domain/repostiories/user_profile_repository.dart';
import 'package:tonolucro_challenge/features/user_profile/domain/usecases/get_user_profile_usecase.dart';

import '../../mocks/profile_name_mock.dart';
import '../../mocks/user_profile_mock.dart';

class UserProfileRepositoryMock extends Mock implements UserProfileRepository {}

void main() {
  final repository = UserProfileRepositoryMock();
  final usecase = GetUserProfileUsecase(repository);

  test('Deve retornar uma entidade ao passar um nick do github válido',
      () async {
    when(repository.getUserProfile(param))
        .thenAnswer((_) async => const Right(userEntity));

    final result = await usecase(param);
    expect(result, const Right(userEntity));
  });
  test('Deve retornar um FailureApiUserProfile quando a requisição der errado',
      () async {
    when(repository.getUserProfile(any)).thenAnswer(
        (_) async => Left<Failure, UserProfileEntity>(FailureApiUserProfile()));
    final result = await usecase(param);
    expect(result, Left(FailureApiUserProfile()));
  });
  test('Deve retornar null caso a seja passado como parametro', () async {
    final result = await usecase(null);
    expect(result, Left(NullUserParam()));
  });
}
