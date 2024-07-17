import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/entities/evolution_chain_entity.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/entities/evolves_specie_entity.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/entities/pokemon_details_entity.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/states/pokemon_details_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PokemonDetailsState', () {
    test('PokemonDetailsLoading should have correct props', () {
      final state = PokemonDetailsLoading();

      expect(state.props, isEmpty);
    });

    test('PokemonDetailsError should have correct props', () {
      final state = PokemonDetailsError(message: 'Error message');

      expect(state.props, equals(['Error message']));
    });

    test('PokemonDetailsSuccess should have correct props', () {
      const pokemon = PokemonDetailsEntity(
        id: 1,
        weight: 10,
        height: 5,
        name: 'Pikachu',
        locationAreaEncounters: 'Route 1',
        types: [],
        stats: [],
        gif: 'pikachu.gif',
        abilityName: 'Static',
      );
      const evolutionChain = EvolutionChainEntity(
        species: EvolvesSpecieEntity(
            name: 'Pikachu', url: 'https://pokeapi.co/pokemon/25/'),
        evolvesTo: [],
      );
      final state = PokemonDetailsSuccess(
        pokemon: pokemon,
        evolutionChain: evolutionChain,
      );

      expect(state.props, equals([pokemon, evolutionChain]));
    });
  });
}
