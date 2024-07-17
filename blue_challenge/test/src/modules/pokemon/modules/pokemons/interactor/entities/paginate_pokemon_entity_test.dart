import 'package:blue_challenge/src/modules/pokemon/modules/pokemons/interactor/entites/paginate_pokemon_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../utils/pokemon_utils.dart';

void main() {
  group('PaginatePokemonEntity', () {
    test('fromMap creates a valid instance', () {
      final evolutionChain =
          PaginatePokemonEntity.fromMap(tMockPokemonPaginate);

      expect(evolutionChain, isA<PaginatePokemonEntity>());
    });
  });
}
