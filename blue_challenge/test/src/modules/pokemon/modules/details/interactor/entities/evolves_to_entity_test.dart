import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/entities/evolves_specie_entity.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/entities/evolves_to_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../utils/pokemon_utils.dart';

void main() {
  group('EvolvesToEntity', () {
    test('fromMap creates a valid instance', () {
      final entity = EvolvesToEntity.fromMap(
        tMockEvolutionChain['chain']['evolves_to'][0],
      );

      expect(entity, isA<EvolvesToEntity>());
    });

    test('should be equal when props are the same', () {
      const species = EvolvesSpecieEntity(name: 'Pikachu', url: 'some_url');
      const evolvesTo = EvolvesToEntity(
        minLevel: 10,
        species: species,
        evolvesTo: [],
      );

      const otherEvolvesTo = EvolvesToEntity(
        minLevel: 10,
        species: species,
        evolvesTo: [],
      );

      expect(evolvesTo, equals(otherEvolvesTo));
    });

    test('should not be equal when props are different', () {
      const species1 = EvolvesSpecieEntity(name: 'Pikachu', url: 'some_url');
      const species2 = EvolvesSpecieEntity(name: 'Raichu', url: 'another_url');

      const evolvesTo1 = EvolvesToEntity(
        minLevel: 10,
        species: species1,
        evolvesTo: [],
      );

      const evolvesTo2 = EvolvesToEntity(
        minLevel: 15,
        species: species2,
        evolvesTo: [],
      );

      expect(evolvesTo1, isNot(equals(evolvesTo2)));
    });
  });
}
