import 'package:blue_challenge/src/core/failures/failures.dart';
import 'package:blue_challenge/src/core/services/interator/i_database_manager.dart';
import 'package:blue_challenge/src/core/utils/enums/database_result_enum.dart';
import 'package:blue_challenge/src/core/utils/enums/tables_enum.dart';
import 'package:blue_challenge/src/modules/pokemon/core/interactor/dtos/insert_local_pokemon_dto.dart';
import 'package:blue_challenge/src/modules/pokemon/core/interactor/dtos/remove_local_pokemon_dto.dart';
import 'package:blue_challenge/src/modules/pokemon/core/interactor/entities/pokemon_entity.dart';
import 'package:blue_challenge/src/modules/pokemon/core/interactor/services/i_pokemon_service.dart';
import 'package:dartz/dartz.dart';

class PokemonService implements IPokemonService {
  final IDatabaseManager _databaseManager;
  final _tableName = TablesEnum.pokemons.table;

  PokemonService({
    required IDatabaseManager databaseManager,
  }) : _databaseManager = databaseManager;

  @override
  Future<Either<Failure, List<PokemonEntity>>> getLocalPokemons() async {
    try {
      final result = await _databaseManager.getAll(
        _tableName,
      );

      return Right(result.map((e) => PokemonEntity.fromMap(e)).toList());
    } catch (e) {
      return Left(LocalFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> insertLocalPokemon(
      InsertLocalPokemonDTO dto) async {
    try {
      final result = await _databaseManager.insert(
        _tableName,
        [dto.toMap()],
      );

      return Right(DatabaseResultEnum.fromCode(result).isSuccess);
    } catch (e) {
      return Left(LocalFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> removeLocalPokemon(
      RemoveLocalPokemonDTO dto) async {
    try {
      final result = await _databaseManager.delete(
        column: 'name',
        id: dto.name,
        table: _tableName,
      );

      return Right(DatabaseResultEnum.fromCode(result).isSuccess);
    } catch (e) {
      return Left(LocalFailure(message: e.toString()));
    }
  }
}
