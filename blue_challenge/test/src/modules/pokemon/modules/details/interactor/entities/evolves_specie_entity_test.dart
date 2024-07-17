import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/entities/evolves_specie_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../utils/pokemon_utils.dart';

void main() {
  group('EvolvesSpecieEntity', () {
    test('fromMap creates a valid instance', () {
      final entity = EvolvesSpecieEntity.fromMap(tMockEvolvesSpecie);

      expect(entity, isA<EvolvesSpecieEntity>());
    });

    test('should be equal when props are the same', () {
      const specie1 = EvolvesSpecieEntity(
        name: 'Pikachu',
        url: 'https://pokeapi.co/api/v2/pokemon-species/25/',
      );

      const specie2 = EvolvesSpecieEntity(
        name: 'Pikachu',
        url: 'https://pokeapi.co/api/v2/pokemon-species/25/',
      );

      expect(specie1, equals(specie2));
    });

    test('should not be equal when props are different', () {
      const specie1 = EvolvesSpecieEntity(
        name: 'Pikachu',
        url: 'https://pokeapi.co/api/v2/pokemon-species/25/',
      );

      const specie2 = EvolvesSpecieEntity(
        name: 'Raichu',
        url: 'https://pokeapi.co/api/v2/pokemon-species/26/',
      );

      expect(specie1, isNot(equals(specie2)));
    });
  });
}
