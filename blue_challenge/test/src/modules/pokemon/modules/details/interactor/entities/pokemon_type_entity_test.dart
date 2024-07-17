import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/entities/pokemon_type_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../utils/pokemon_utils.dart';

void main() {
  group('PokemonTypeEntity', () {
    test('fromMap creates a valid instance', () {
      final entity = PokemonTypeEntity.fromMap(
        tMockPokemonDetails['types'][0],
      );

      expect(entity, isA<PokemonTypeEntity>());
    });

    test('should have correct props', () {
      const name = 'name';
      const url = 'url';
      const entity = PokemonTypeEntity(name: name, url: url);

      expect(entity.props, [name, url]);
    });

    test('should not be equal when props are different', () {
      const name1 = 'Fire';
      const url1 = 'https://pokeapi.co/api/v2/type/10/';

      const name2 = 'Water';
      const url2 = 'https://pokeapi.co/api/v2/type/11/';

      const entity1 = PokemonTypeEntity(name: name1, url: url1);
      const entity2 = PokemonTypeEntity(name: name2, url: url2);

      expect(entity1, isNot(equals(entity2)));
    });
  });
}
