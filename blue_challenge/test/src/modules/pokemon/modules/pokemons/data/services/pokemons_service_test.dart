import 'package:blue_challenge/src/core/failures/failures.dart';
import 'package:blue_challenge/src/core/services/interator/i_api_manager.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/pokemons/data/services/pokemons_service.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/pokemons/interactor/dtos/get_pokemons_dto.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/pokemons/interactor/services/i_pokemons_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/pokemon_utils.dart';

class MockIApiManager extends Mock implements IApiManager {}

void main() {
  late IPokemonsService pokemonsService;
  late MockIApiManager mockApiManager;

  setUp(() {
    mockApiManager = MockIApiManager();
    pokemonsService = PokemonsService(apiManager: mockApiManager);
  });

  group('PokemonsService', () {
    test('getPokemons returns PaginatePokemonEntity on success', () async {
      final dto = GetPokemonsDTO(limit: 20, offset: 20);

      when(() => mockApiManager.get('/pokemon', queryParams: dto.toMap()))
          .thenAnswer(
        (_) async => tMockPokemonPaginate,
      );

      final result = await pokemonsService.getPokemons(dto);

      expect(result.isRight(), true);
    });

    test('getPokemons returns Failure on known failure', () async {
      final dto = GetPokemonsDTO(limit: 10, offset: 0);
      const failure = ServerFailure(message: 'Some error');

      when(() => mockApiManager.get('/pokemon', queryParams: dto.toMap()))
          .thenThrow(failure);

      final result = await pokemonsService.getPokemons(dto);

      expect(result.isLeft(), true);
    });

    test('getPokemons returns UnexpectedFailure on unknown exception',
        () async {
      final dto = GetPokemonsDTO(limit: 10, offset: 0);

      when(() => mockApiManager.get('/pokemon', queryParams: dto.toMap()))
          .thenThrow(Exception('Unknown error'));

      final result = await pokemonsService.getPokemons(dto);

      expect(result.isLeft(), true);
      expect(result.fold((l) => l, (r) => r), isA<UnexpectedFailure>());
    });
  });
}
