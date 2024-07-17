import 'package:blue_challenge/src/core/failures/failures.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/atoms/pokemon_details_atom.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/dtos/get_evolution_chain_dto.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/dtos/get_pokemon_details_dto.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/dtos/get_pokemon_evolution_chain_dto.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/reducers/pokemon_details_reducer.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/services/i_pokemon_details_service.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/states/pokemon_details_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/pokemon_utils.dart';

class MockPokemonDetailsService extends Mock
    implements IPokemonDetailsService {}

void main() {
  late PokemonDetailsReducer pokemonDetailsReducer;
  late MockPokemonDetailsService mockPokemonDetailsService;

  setUp(() {
    mockPokemonDetailsService = MockPokemonDetailsService();
    pokemonDetailsReducer = PokemonDetailsReducer(
        getPokemonDetailsService: mockPokemonDetailsService);

    registerFallbackValue(GetPokemonDetailsDTO.empty());
    registerFallbackValue(
        GetPokemonEvolutionChainDTO(pokemonName: 'pokemonName'));
    registerFallbackValue(GetEvolutionChainDTO(evolutionChainId: '1'));
  });

  tearDown(() {
    reset(mockPokemonDetailsService);
    pokemonDetailsReducer.dispose();
  });

  group('PokemonDetailsReducer', () {
    test('initial state is PokemonDetailsLoading', () {
      expect(pokemonDetailsState.value, isA<PokemonDetailsLoading>());
    });

    test('getPokemonDetails sets PokemonDetailsError on failure', () async {
      final dto = GetPokemonDetailsDTO.empty();

      when(() => mockPokemonDetailsService.getPokemonDetails(any())).thenAnswer(
          (_) async => const Left(ServerFailure(message: 'message')));

      getPokemonDetailsAction.setValue(dto);

      expect(
        pokemonDetailsState.buffer(1),
        completion([isA<PokemonDetailsError>()]),
      );
    });

    test('getPokemonDetails sets PokemonDetailsSuccess on success', () async {
      final dto = GetPokemonDetailsDTO.empty();

      when(() => mockPokemonDetailsService.getPokemonDetails(any()))
          .thenAnswer((_) async => const Right(tMockPokemonDetailsEntity));

      when(() => mockPokemonDetailsService.getPokemonEvolutionChainId(any()))
          .thenAnswer((_) async => const Right('1'));

      when(() => mockPokemonDetailsService.getEvolutionChain(any()))
          .thenAnswer((_) async => const Right(tMockEvolutionChainEntity));

      getPokemonDetailsAction.setValue(dto);

      expect(
        pokemonDetailsState.buffer(1),
        completion([
          isA<PokemonDetailsSuccess>(),
        ]),
      );
    });

    test(
        'getPokemonDetails sets PokemonDetailsError on pokemon evolution chain failure',
        () async {
      when(() => mockPokemonDetailsService.getPokemonDetails(any()))
          .thenAnswer((_) async => const Right(tMockPokemonDetailsEntity));

      when(() => mockPokemonDetailsService.getPokemonEvolutionChainId(any()))
          .thenAnswer(
              (_) async => const Left(ServerFailure(message: 'message')));

      getPokemonDetailsAction.setValue(GetPokemonDetailsDTO.empty());

      expect(
        pokemonDetailsState.buffer(1),
        completion([
          isA<PokemonDetailsError>(),
        ]),
      );
    });

    test(
        'getPokemonDetails sets PokemonDetailsError on evolution chain failure',
        () async {
      when(() => mockPokemonDetailsService.getPokemonDetails(any()))
          .thenAnswer((_) async => const Right(tMockPokemonDetailsEntity));

      when(() => mockPokemonDetailsService.getPokemonEvolutionChainId(any()))
          .thenAnswer((_) async => const Right('1'));

      when(() => mockPokemonDetailsService.getEvolutionChain(any())).thenAnswer(
          (_) async => const Left(ServerFailure(message: 'message')));

      getPokemonDetailsAction.setValue(GetPokemonDetailsDTO.empty());

      expect(
        pokemonDetailsState.buffer(1),
        completion([
          isA<PokemonDetailsError>(),
        ]),
      );
    });
  });
}
