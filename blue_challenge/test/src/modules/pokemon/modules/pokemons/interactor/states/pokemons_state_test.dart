import 'package:blue_challenge/src/modules/pokemon/core/interactor/entities/pokemon_entity.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/pokemons/interactor/dtos/get_pokemons_dto.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/pokemons/interactor/states/pokemons_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

void main() {
  group('PokemonsState', () {
    test('should return correct props', () {
      final dto = GetPokemonsDTO(offset: 0, limit: 20);
      final pagingController =
          PagingController<int, PokemonEntity>(firstPageKey: 0);
      final state = PokemonsState(dto: dto, pagingController: pagingController);

      expect(state.props, equals([dto, pagingController, false]));
    });

    test('instances with same props should be equal', () {
      final dto = GetPokemonsDTO(offset: 0, limit: 20);
      final pagingController =
          PagingController<int, PokemonEntity>(firstPageKey: 0);
      final state1 =
          PokemonsState(dto: dto, pagingController: pagingController);
      final state2 =
          PokemonsState(dto: dto, pagingController: pagingController);

      expect(state1, equals(state2));
    });

    test('instances with different props should not be equal', () {
      final dto1 = GetPokemonsDTO(offset: 0, limit: 20);
      final pagingController1 =
          PagingController<int, PokemonEntity>(firstPageKey: 0);
      final state1 =
          PokemonsState(dto: dto1, pagingController: pagingController1);

      final dto2 = GetPokemonsDTO(offset: 10, limit: 20);
      final pagingController2 =
          PagingController<int, PokemonEntity>(firstPageKey: 0);
      final state2 =
          PokemonsState(dto: dto2, pagingController: pagingController2);

      expect(state1, isNot(equals(state2)));
    });
  });
}
