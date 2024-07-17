import 'package:blue_challenge/src/core/failures/failures.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/pokemons/interactor/dtos/get_pokemons_dto.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/pokemons/interactor/entites/paginate_pokemon_entity.dart';
import 'package:dartz/dartz.dart';

abstract class IPokemonsService {
  Future<Either<Failure, PaginatePokemonEntity>> getPokemons(
      GetPokemonsDTO dto);
}
