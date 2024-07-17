import 'package:blue_challenge/src/core/failures/failures.dart';
import 'package:blue_challenge/src/core/services/interator/i_database_manager.dart';
import 'package:blue_challenge/src/core/utils/enums/database_result_enum.dart';
import 'package:blue_challenge/src/core/utils/enums/tables_enum.dart';
import 'package:blue_challenge/src/modules/pokemon/core/data/services/pokemon_service.dart';
import 'package:blue_challenge/src/modules/pokemon/core/interactor/dtos/insert_local_pokemon_dto.dart';
import 'package:blue_challenge/src/modules/pokemon/core/interactor/dtos/remove_local_pokemon_dto.dart';
import 'package:blue_challenge/src/modules/pokemon/core/interactor/services/i_pokemon_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockIDatabaseManager extends Mock implements IDatabaseManager {}

void main() {
  late IPokemonService pokemonService;
  late MockIDatabaseManager mockDatabaseManager;
  final tableName = TablesEnum.pokemons.table;

  setUp(() {
    mockDatabaseManager = MockIDatabaseManager();
    pokemonService = PokemonService(databaseManager: mockDatabaseManager);
  });

  group('PokemonService', () {
    test('getLocalPokemons returns list of PokemonEntity on success', () async {
      final response = [
        {'name': 'pikachu', 'url': 'url'},
        {'name': 'bulbasaur', 'url': 'url'},
      ];

      when(() => mockDatabaseManager.getAll(tableName))
          .thenAnswer((_) async => response);

      final result = await pokemonService.getLocalPokemons();

      expect(result.isRight(), true);
    });

    test('getLocalPokemons returns LocalFailure on exception', () async {
      when(() => mockDatabaseManager.getAll(tableName))
          .thenThrow(Exception('Database error'));

      final result = await pokemonService.getLocalPokemons();

      expect(result.isLeft(), true);
      expect(result.fold((l) => l, (r) => r), isA<LocalFailure>());
    });

    test('insertLocalPokemon returns true on success', () async {
      final dto = InsertLocalPokemonDTO(name: 'pikachu', url: 'url');

      when(() => mockDatabaseManager.insert(tableName, [dto.toMap()]))
          .thenAnswer((_) async => DatabaseResultEnum.success.code);

      final result = await pokemonService.insertLocalPokemon(dto);

      expect(result.isRight(), true);
    });

    test('insertLocalPokemon returns LocalFailure on exception', () async {
      final dto = InsertLocalPokemonDTO(
        name: 'pikachu',
        url: 'url',
      );

      when(() => mockDatabaseManager.insert(tableName, [dto.toMap()]))
          .thenThrow(Exception('Database error'));

      final result = await pokemonService.insertLocalPokemon(dto);

      expect(result.isLeft(), true);
      expect(result.fold((l) => l, (r) => r), isA<LocalFailure>());
    });

    test('removeLocalPokemon returns true on success', () async {
      final dto = RemoveLocalPokemonDTO(name: 'pikachu');

      when(
        () => mockDatabaseManager.delete(
          column: 'name',
          id: dto.name,
          table: tableName,
        ),
      ).thenAnswer((_) async => DatabaseResultEnum.success.code);

      final result = await pokemonService.removeLocalPokemon(dto);

      expect(result.isRight(), true);
    });

    test('removeLocalPokemon returns LocalFailure on exception', () async {
      final dto = RemoveLocalPokemonDTO(name: 'pikachu');

      when(
        () => mockDatabaseManager.delete(
          column: 'name',
          id: dto.name,
          table: tableName,
        ),
      ).thenThrow(Exception('Database error'));

      final result = await pokemonService.removeLocalPokemon(dto);

      expect(result.isLeft(), true);
      expect(result.fold((l) => l, (r) => r), isA<LocalFailure>());
    });
  });
}
