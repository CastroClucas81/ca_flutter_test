import 'package:blue_challenge/src/modules/pokemon/core/interactor/atoms/pokemon_atom.dart';
import 'package:blue_challenge/src/modules/pokemon/core/interactor/dtos/insert_local_pokemon_dto.dart';
import 'package:blue_challenge/src/modules/pokemon/core/interactor/dtos/remove_local_pokemon_dto.dart';
import 'package:blue_challenge/src/modules/pokemon/core/interactor/entities/pokemon_entity.dart';
import 'package:blue_challenge/src/modules/pokemon/core/interactor/reducers/pokemon_reducer.dart';
import 'package:blue_challenge/src/modules/pokemon/core/interactor/services/i_pokemon_service.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/pokemon_utils.dart';

class MockPokemonService extends Mock implements IPokemonService {}

void main() {
  late PokemonReducer pokemonReducer;
  late IPokemonService mockPokemonService;

  setUp(() {
    mockPokemonService = MockPokemonService();
    pokemonReducer = PokemonReducer(pokemonService: mockPokemonService);

    registerFallbackValue(InsertLocalPokemonDTO(name: 'Pikachu', url: 'url'));
    registerFallbackValue(RemoveLocalPokemonDTO(name: 'Pikachu'));
  });

  tearDown(() {
    reset(mockPokemonService);
    pokemonReducer.dispose();
  });

  group('PokemonReducer', () {
    test('favorite action adds a Pokemon locally', () async {
      final dto = InsertLocalPokemonDTO(name: 'Pikachu', url: 'url');

      when(() => mockPokemonService.insertLocalPokemon(any())).thenAnswer(
        (_) async => const Right(true),
      );
      when(() => mockPokemonService.getLocalPokemons()).thenAnswer(
        (_) async => const Right(<PokemonEntity>[]),
      );

      favoritePokemonAction.setValue(dto);

      verify(() => mockPokemonService.insertLocalPokemon(dto)).called(1);
    });

    test('unfavorite action removes a Pokemon locally', () async {
      final dto = RemoveLocalPokemonDTO(name: 'Pikachu');

      when(() => mockPokemonService.removeLocalPokemon(any())).thenAnswer(
        (_) async => const Right(true),
      );
      when(() => mockPokemonService.getLocalPokemons()).thenAnswer(
        (_) async => const Right(<PokemonEntity>[]),
      );

      unfavoritePokemonAction.setValue(dto);

      verify(() => mockPokemonService.removeLocalPokemon(dto)).called(1);
    });

    test('getFavoritePokemons action updates favoritePokemonsState', () async {
      final localPokemons = [tMockPokemonEntity];

      when(() => mockPokemonService.getLocalPokemons())
          .thenAnswer((_) async => Right(localPokemons));

      getFavoritePokemonsAction();

      Future.delayed(Duration.zero, () {
        expect(favoritePokemonsState.value, equals(localPokemons));
        expect(favoritePokemonsState.value.length, equals(1));
      });
    });
  });
}
