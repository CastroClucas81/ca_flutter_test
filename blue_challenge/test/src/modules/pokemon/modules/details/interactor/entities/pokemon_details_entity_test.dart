import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/entities/pokemon_details_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../utils/pokemon_utils.dart';

void main() {
  group('PokemonDetailsEntity', () {
    test('fromMap creates a valid instance', () {
      final entity = PokemonDetailsEntity.fromMap(
        tMockPokemonDetails,
      );

      expect(entity, isA<PokemonDetailsEntity>());
    });

    test('should be equal when props are the same', () {
      const id = 1;
      const weight = 69;
      const height = 7;
      const name = 'Bulbasaur';
      const locationAreaEncounters =
          'https://pokeapi.co/api/v2/pokemon/1/encounters';
      const gif =
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/1.gif';
      const abilityName = 'Overgrow';

      const entity1 = PokemonDetailsEntity(
        id: id,
        weight: weight,
        height: height,
        name: name,
        locationAreaEncounters: locationAreaEncounters,
        types: [],
        stats: [],
        gif: gif,
        abilityName: abilityName,
      );

      const entity2 = PokemonDetailsEntity(
        id: id,
        weight: weight,
        height: height,
        name: name,
        locationAreaEncounters: locationAreaEncounters,
        types: [],
        stats: [],
        gif: gif,
        abilityName: abilityName,
      );

      expect(entity1, equals(entity2));
    });

    test('should not be equal when props are different', () {
      const id1 = 1;
      const weight1 = 69;
      const height1 = 7;
      const name1 = 'Bulbasaur';
      const locationAreaEncounters1 =
          'https://pokeapi.co/api/v2/pokemon/1/encounters';
      const gif1 =
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/1.gif';
      const abilityName1 = 'Overgrow';

      const id2 = 2;
      const weight2 = 90;
      const height2 = 10;
      const name2 = 'Ivysaur';
      const locationAreaEncounters2 =
          'https://pokeapi.co/api/v2/pokemon/2/encounters';
      const gif2 =
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/2.gif';
      const abilityName2 = 'Chlorophyll';

      const entity1 = PokemonDetailsEntity(
        id: id1,
        weight: weight1,
        height: height1,
        name: name1,
        locationAreaEncounters: locationAreaEncounters1,
        types: [],
        stats: [],
        gif: gif1,
        abilityName: abilityName1,
      );

      const entity2 = PokemonDetailsEntity(
        id: id2,
        weight: weight2,
        height: height2,
        name: name2,
        locationAreaEncounters: locationAreaEncounters2,
        types: [],
        stats: [],
        gif: gif2,
        abilityName: abilityName2,
      );

      expect(entity1, isNot(equals(entity2)));
    });
  });
}
