import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/entities/pokemon_stat_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../utils/pokemon_utils.dart';

void main() {
  group('PokemonStatEntity', () {
    test('fromMap creates a valid instance', () {
      final entity = PokemonStatEntity.fromMap(
        tMockPokemonDetails['stats'][0],
      );

      expect(entity, isA<PokemonStatEntity>());
    });

    test('should be equal when props are the same', () {
      const effort = 2;
      const baseStat = 45;
      const name = 'Speed';
      const url = 'https://pokeapi.co/api/v2/stat/6/';
      const entity1 = PokemonStatEntity(
        effort: effort,
        baseStat: baseStat,
        name: name,
        url: url,
      );
      const entity2 = PokemonStatEntity(
        effort: effort,
        baseStat: baseStat,
        name: name,
        url: url,
      );

      expect(entity1, equals(entity2));
    });

    test('should not be equal when props are different', () {
      const effort1 = 2;
      const baseStat1 = 45;
      const name1 = 'Speed';
      const url1 = 'https://pokeapi.co/api/v2/stat/6/';
      const effort2 = 1;
      const baseStat2 = 60;
      const name2 = 'Attack';
      const url2 = 'https://pokeapi.co/api/v2/stat/2/';
      const entity1 = PokemonStatEntity(
        effort: effort1,
        baseStat: baseStat1,
        name: name1,
        url: url1,
      );
      const entity2 = PokemonStatEntity(
        effort: effort2,
        baseStat: baseStat2,
        name: name2,
        url: url2,
      );

      expect(entity1, isNot(equals(entity2)));
    });
  });
}
