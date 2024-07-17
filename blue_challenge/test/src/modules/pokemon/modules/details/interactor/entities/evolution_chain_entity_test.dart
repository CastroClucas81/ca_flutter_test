import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/entities/evolution_chain_entity.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/entities/evolves_specie_entity.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/entities/evolves_to_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../utils/pokemon_utils.dart';

void main() {
  group('EvolutionChainEntity', () {
    test('fromMap creates a valid instance', () {
      final entity = EvolutionChainEntity.fromMap(tMockEvolutionChain);

      expect(entity, isA<EvolutionChainEntity>());
    });

    test('should be equal when props are the same', () {
      const specie = EvolvesSpecieEntity(
          name: 'Pikachu',
          url: 'https://pokeapi.co/api/v2/pokemon-species/25/');
      final evolvesTo = [
        const EvolvesToEntity(
          minLevel: 16,
          species: EvolvesSpecieEntity(
              name: 'Raichu',
              url: 'https://pokeapi.co/api/v2/pokemon-species/26/'),
          evolvesTo: [],
        ),
      ];

      final chain1 = EvolutionChainEntity(
        species: specie,
        evolvesTo: evolvesTo,
      );

      final chain2 = EvolutionChainEntity(
        species: specie,
        evolvesTo: evolvesTo,
      );

      expect(chain1, equals(chain2));
    });

    test('should not be equal when props are different', () {
      const specie1 = EvolvesSpecieEntity(
          name: 'Pikachu',
          url: 'https://pokeapi.co/api/v2/pokemon-species/25/');
      final evolvesTo1 = [
        const EvolvesToEntity(
          minLevel: 16,
          species: EvolvesSpecieEntity(
              name: 'Raichu',
              url: 'https://pokeapi.co/api/v2/pokemon-species/26/'),
          evolvesTo: [],
        ),
      ];

      const specie2 = EvolvesSpecieEntity(
          name: 'Charmander',
          url: 'https://pokeapi.co/api/v2/pokemon-species/4/');
      final evolvesTo2 = [
        const EvolvesToEntity(
          minLevel: 16,
          species: EvolvesSpecieEntity(
              name: 'Charmeleon',
              url: 'https://pokeapi.co/api/v2/pokemon-species/5/'),
          evolvesTo: [],
        ),
      ];

      final chain1 = EvolutionChainEntity(
        species: specie1,
        evolvesTo: evolvesTo1,
      );

      final chain2 = EvolutionChainEntity(
        species: specie2,
        evolvesTo: evolvesTo2,
      );

      expect(chain1, isNot(equals(chain2)));
    });
  });
}
