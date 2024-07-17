import 'package:blue_challenge/src/core/failures/failures.dart';
import 'package:blue_challenge/src/modules/pokemon/core/interactor/dtos/insert_local_pokemon_dto.dart';
import 'package:blue_challenge/src/modules/pokemon/core/interactor/dtos/remove_local_pokemon_dto.dart';
import 'package:blue_challenge/src/modules/pokemon/core/interactor/entities/pokemon_entity.dart';
import 'package:dartz/dartz.dart';

abstract class IPokemonService {
  Future<Either<Failure, bool>> insertLocalPokemon(InsertLocalPokemonDTO dto);
  Future<Either<Failure, bool>> removeLocalPokemon(RemoveLocalPokemonDTO dto);
  Future<Either<Failure, List<PokemonEntity>>> getLocalPokemons();
}
