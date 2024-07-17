import 'package:blue_challenge/src/core/failures/failures.dart';
import 'package:blue_challenge/src/core/services/interator/i_api_manager.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/data/services/pokemon_details_service.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/dtos/get_evolution_chain_dto.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/dtos/get_pokemon_details_dto.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/dtos/get_pokemon_evolution_chain_dto.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/services/i_pokemon_details_service.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/pokemon_utils.dart';

class MockIApiManager extends Mock implements IApiManager {}

void main() {
  late IPokemonDetailsService pokemonDetailsService;
  late MockIApiManager mockApiManager;

  setUp(() {
    mockApiManager = MockIApiManager();
    pokemonDetailsService = PokemonDetailsService(apiManager: mockApiManager);
  });

  group('PokemonDetailsService', () {
    test('getPokemonDetails returns PokemonDetailsEntity on success', () async {
      final dto = GetPokemonDetailsDTO(name: 'pikachu');

      when(() => mockApiManager.get('/pokemon/${dto.name}'))
          .thenAnswer((_) async => tMockPokemonDetails);

      final result = await pokemonDetailsService.getPokemonDetails(dto);

      expect(result.isRight(), true);
    });

    test('getPokemonDetails returns Failure on known failure', () async {
      final dto = GetPokemonDetailsDTO(name: 'pikachu');
      const failure = ServerFailure(message: 'Some error');

      when(() => mockApiManager.get('/pokemon/${dto.name}')).thenThrow(failure);

      final result = await pokemonDetailsService.getPokemonDetails(dto);

      expect(result, const Left(failure));
    });

    test('getPokemonDetails returns ConnectionFailure on unknown exception',
        () async {
      final dto = GetPokemonDetailsDTO(name: 'pikachu');

      when(() => mockApiManager.get('/pokemon/${dto.name}'))
          .thenThrow(Exception('Unknown error'));

      final result = await pokemonDetailsService.getPokemonDetails(dto);

      expect(result, isA<Left>());
      expect(result.fold((l) => l, (r) => r), isA<ConnectionFailure>());
    });

    test('getEvolutionChain returns EvolutionChainEntity on success', () async {
      final dto = GetEvolutionChainDTO(evolutionChainId: '1');

      when(() => mockApiManager.get('/evolution-chain/${dto.evolutionChainId}'))
          .thenAnswer((_) async => tMockEvolutionChain);

      final result = await pokemonDetailsService.getEvolutionChain(dto);

      expect(result.isRight(), true);
    });

    test('getEvolutionChain returns Failure on known failure', () async {
      final dto = GetEvolutionChainDTO(evolutionChainId: '1');
      const failure = ServerFailure(message: 'Some error');

      when(() => mockApiManager.get('/evolution-chain/${dto.evolutionChainId}'))
          .thenThrow(failure);

      final result = await pokemonDetailsService.getEvolutionChain(dto);

      expect(result.isLeft(), true);
    });

    test('getEvolutionChain returns ConnectionFailure on unknown exception',
        () async {
      final dto = GetEvolutionChainDTO(evolutionChainId: '1');

      when(() => mockApiManager.get('/evolution-chain/${dto.evolutionChainId}'))
          .thenThrow(Exception('Unknown error'));

      final result = await pokemonDetailsService.getEvolutionChain(dto);

      expect(result, isA<Left>());
      expect(result.fold((l) => l, (r) => r), isA<ConnectionFailure>());
    });
  });

  test('getPokemonEvolutionChainId returns evolution chain ID on success',
      () async {
    final dto = GetPokemonEvolutionChainDTO(pokemonName: 'venusaur');

    when(() => mockApiManager.get('/pokemon-species/${dto.pokemonName}'))
        .thenAnswer((_) async => tMockPokemonEvolutionChain);

    final result = await pokemonDetailsService.getPokemonEvolutionChainId(dto);

    expect(result.isRight(), true);
    expect(result.getOrElse(() => ''), '77');
  });

  test('getPokemonEvolutionChainId returns Failure on API failure', () async {
    final dto = GetPokemonEvolutionChainDTO(pokemonName: 'charmander');

    when(() => mockApiManager.get('/pokemon-species/${dto.pokemonName}'))
        .thenThrow(const ServerFailure(message: 'message'));

    final result = await pokemonDetailsService.getPokemonEvolutionChainId(dto);

    expect(result.isLeft(), true);
    expect(result.fold((failure) => failure, (_) => null), isA<Failure>());
  });

  test('getPokemonEvolutionChainId returns ConnectionFailure on exception',
      () async {
    final dto = GetPokemonEvolutionChainDTO(pokemonName: 'squirtle');

    when(() => mockApiManager.get('/pokemon-species/${dto.pokemonName}'))
        .thenThrow(Exception('Connection error'));

    final result = await pokemonDetailsService.getPokemonEvolutionChainId(dto);

    expect(result.isLeft(), true);
    expect(result.fold((failure) => failure, (_) => null),
        isA<ConnectionFailure>());
  });
}
