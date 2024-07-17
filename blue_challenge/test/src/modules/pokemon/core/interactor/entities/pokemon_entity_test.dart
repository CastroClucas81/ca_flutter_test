import 'package:blue_challenge/src/modules/pokemon/core/interactor/entities/pokemon_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/pokemon_utils.dart';

void main() {
  group('PokemonEntity', () {
    test('fromMap creates a valid instance', () {
      final entity = PokemonEntity.fromMap(tMockPokemon);

      expect(entity, isA<PokemonEntity>());
    });

    test('should be equal when props are the same', () {
      const pokemon1 = PokemonEntity(
          name: 'Pikachu', url: 'https://pokeapi.co/api/v2/pokemon/25');
      const pokemon2 = PokemonEntity(
          name: 'Pikachu', url: 'https://pokeapi.co/api/v2/pokemon/25');

      expect(pokemon1, equals(pokemon2));
    });

    test('should not be equal when props are different', () {
      const pokemon1 = PokemonEntity(
          name: 'Pikachu', url: 'https://pokeapi.co/api/v2/pokemon/25');
      const pokemon2 = PokemonEntity(
          name: 'Charmander', url: 'https://pokeapi.co/api/v2/pokemon/4');

      expect(pokemon1, isNot(equals(pokemon2)));
    });
  });
}
