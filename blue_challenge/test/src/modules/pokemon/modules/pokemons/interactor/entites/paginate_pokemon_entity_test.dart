import 'package:blue_challenge/src/modules/pokemon/core/interactor/entities/pokemon_entity.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/pokemons/interactor/entites/paginate_pokemon_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../utils/pokemon_utils.dart';

void main() {
  group('PaginatePokemonEntity', () {
    test('fromMap creates a valid instance', () {
      final entity = PaginatePokemonEntity.fromMap(tMockPokemonPaginate);

      expect(entity, isA<PaginatePokemonEntity>());
    });

    test('should be equal when props are the same', () {
      const paginate1 = PaginatePokemonEntity(
        count: 2,
        next: 'next_url',
        previous: 'previous_url',
        results: [],
      );

      const paginate2 = PaginatePokemonEntity(
        count: 2,
        next: 'next_url',
        previous: 'previous_url',
        results: [],
      );

      expect(paginate1, equals(paginate2));
    });

    test('should not be equal when props are different', () {
      const pokemon1 = PokemonEntity(url: 'url', name: 'Bulbasaur');
      const pokemon2 = PokemonEntity(url: 'url 2', name: 'Ivysaur');

      const paginate1 = PaginatePokemonEntity(
        count: 2,
        next: 'next_url',
        previous: 'previous_url',
        results: [pokemon1, pokemon2],
      );

      const paginate2 = PaginatePokemonEntity(
        count: 3,
        next: 'different_next_url',
        previous: 'different_previous_url',
        results: [pokemon2, pokemon1],
      );

      expect(paginate1, isNot(equals(paginate2)));
    });
  });
}
