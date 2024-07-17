import 'package:blue_challenge/src/modules/pokemon/modules/pokemons/interactor/dtos/get_pokemons_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GetPokemonsDTO', () {
    test('should create an instance with given values', () {
      final dto = GetPokemonsDTO(offset: 0, limit: 20, search: 'pikachu');

      expect(dto.offset, 0);
      expect(dto.limit, 20);
      expect(dto.search, 'pikachu');
    });

    test('should convert to a Map correctly', () {
      final dto = GetPokemonsDTO(offset: 0, limit: 20, search: 'pikachu');
      final map = dto.toMap();

      expect(map, {
        'offset': 0,
        'limit': 20,
        'search': 'pikachu',
      });
    });

    test('should convert to a Map correctly without search', () {
      final dto = GetPokemonsDTO(offset: 0, limit: 20);
      final map = dto.toMap();

      expect(map, {
        'offset': 0,
        'limit': 20,
      });
    });

    test('copyWith should return a new instance with updated values', () {
      final dto = GetPokemonsDTO(offset: 0, limit: 20, search: 'pikachu');
      final updatedDto =
          dto.copyWith(offset: 10, limit: 50, search: 'charmander');

      expect(updatedDto.offset, 10);
      expect(updatedDto.limit, 50);
      expect(updatedDto.search, 'charmander');
    });

    test('copyWith should return a new instance with some updated values', () {
      final dto = GetPokemonsDTO(offset: 0, limit: 20, search: 'pikachu');
      final updatedDto = dto.copyWith(limit: 50);

      expect(updatedDto.offset, 0);
      expect(updatedDto.limit, 50);
      expect(updatedDto.search, 'pikachu');
    });
  });
}
