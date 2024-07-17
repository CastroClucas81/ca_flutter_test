import 'package:blue_challenge/src/core/failures/failures.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/pokemons/interactor/atoms/pokemons_atom.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/pokemons/interactor/dtos/get_pokemons_dto.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/pokemons/interactor/entites/paginate_pokemon_entity.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/pokemons/interactor/reducers/pokemons_reducer.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/pokemons/interactor/services/i_pokemons_service.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/pokemons/interactor/states/pokemons_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/pokemon_utils.dart';

class MockPokemonsService extends Mock implements IPokemonsService {}

void main() {
  late PokemonsReducer pokemonsReducer;
  late MockPokemonsService mockPokemonsService;

  setUp(() {
    mockPokemonsService = MockPokemonsService();
    pokemonsReducer = PokemonsReducer(pokemonsService: mockPokemonsService);

    registerFallbackValue(GetPokemonsDTO(offset: 0, limit: 20));
  });

  tearDown(() {
    reset(mockPokemonsService);
    pokemonsReducer.dispose();
  });

  group('PokemonsReducer', () {
    test('initial state has correct default values', () {
      final state = pokemonsState.value;

      expect(state.dto.limit, equals(20));
      expect(state.pagingController.firstPageKey, equals(0));
    });

    test('getPokemons sets error on ServerFailure', () async {
      final dto = GetPokemonsDTO(offset: 0, limit: 20);

      when(() => mockPokemonsService.getPokemons(any())).thenAnswer(
        (_) async => const Left(ServerFailure(message: 'message')),
      );

      pokemonsState.value = PokemonsState(
        dto: dto,
        pagingController: pokemonsState.value.pagingController,
        pagingIsStarted: false,
      );

      Future.delayed(
        Duration.zero,
        () {
          expect(
              pokemonsState.value.pagingController.error, isA<ServerFailure>());
        },
      );
    });

    test('getPokemons appends last page on success with no next page',
        () async {
      final dto = GetPokemonsDTO(offset: 0, limit: 20);

      when(() => mockPokemonsService.getPokemons(any()))
          .thenAnswer((_) async => const Right(tMockPokemonPaginateEntity));

      pokemonsState.value = PokemonsState(
        dto: dto,
        pagingController: pokemonsState.value.pagingController,
        pagingIsStarted: false,
      );

      Future.delayed(Duration.zero, () {
        expect(
          pokemonsState.value.pagingController.itemList,
          equals([tMockPokemonEntity]),
        );
        expect(pokemonsState.value.pagingController.nextPageKey, isNull);
      });
    });

    test('getPokemons appends pages correctly with next page available',
        () async {
      final dto = GetPokemonsDTO(offset: 0, limit: 20);
      const paginateEntity = PaginatePokemonEntity(
        count: 1302,
        next: 'https://pokeapi.co/api/v2/pokemon?offset=40&limit=20',
        results: [tMockPokemonEntity],
      );

      when(() => mockPokemonsService.getPokemons(any())).thenAnswer(
        (_) async => const Right(paginateEntity),
      );

      pokemonsState.value = PokemonsState(
        dto: dto,
        pagingController: pokemonsState.value.pagingController,
        pagingIsStarted: true,
      );

      Future.delayed(const Duration(milliseconds: 100), () {
        expect(
          pokemonsState.value.pagingController.itemList,
          isNot(
            equals([tMockPokemonEntity]),
          ),
        );
        expect(pokemonsState.value.pagingController.nextPageKey, equals(2));
      });
    });
  });
}
