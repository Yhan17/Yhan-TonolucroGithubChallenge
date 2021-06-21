import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tonolucro_challenge/core/errors/failures.dart';
import 'package:tonolucro_challenge/features/repository_contributors/domain/entities/contributor_entity.dart';
import 'package:tonolucro_challenge/features/repository_contributors/domain/repositories/contributor_repository.dart';
import 'package:tonolucro_challenge/features/repository_contributors/domain/usecases/get_contributors_usecase.dart';

import '../../mocks/contributors_entity_mock.dart';

class ContributorRepositoryMock extends Mock implements ContributorRepository {}

void main() {
  final repository = ContributorRepositoryMock();
  final usecase = GetContributorsUsecase(repository);

  test("Deve Retornar uma lista de Contribuidores de um repositório", () async {
    when(repository.getRepoContributors("Yhan17", "Team-mercury-dashboard"))
        .thenAnswer(
            (_) async => right(<ContributorEntity>[contributorsEntity]));

    final result = await usecase("Yhan17", "Team-mercury-dashboard");
    expect(result?.fold(id, id), isA<List<ContributorEntity>>());
  });
  test("Deve Retornar NullFailure caso não seja passado dono do repositório ",
      () async {
    final result = await usecase(null, "Team-mercury-dashboard");
    expect(result, Left(NullUserParam()));
  });
  test(
      "Deve Retornar NullFailure caso não seja passado o repositório do usuario",
      () async {
    final result = await usecase("Yhan17", null);
    expect(result, Left(NullUserParam()));
  });
  test('Deve retornar um EmptyList caso o retorno seja vazio', () async {
    when(repository.getRepoContributors("Yhan17", "Team-mercury-dashboard"))
        .thenAnswer((_) async => const Right(<ContributorEntity>[]));

    final result = await usecase("Yhan17", "Team-mercury-dashboard");
    expect(result, Left(EmptyList()));
  });
}
