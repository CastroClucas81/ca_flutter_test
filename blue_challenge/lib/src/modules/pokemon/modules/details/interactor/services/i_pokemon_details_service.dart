import 'package:blue_challenge/src/core/failures/failures.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/dtos/get_evolution_chain_dto.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/dtos/get_pokemon_details_dto.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/dtos/get_pokemon_evolution_chain_dto.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/entities/evolution_chain_entity.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/entities/pokemon_details_entity.dart';
import 'package:dartz/dartz.dart';

abstract class IPokemonDetailsService {
  Future<Either<Failure, PokemonDetailsEntity>> getPokemonDetails(
      GetPokemonDetailsDTO dto);

  Future<Either<Failure, EvolutionChainEntity>> getEvolutionChain(
      GetEvolutionChainDTO dto);

  Future<Either<Failure, String>> getPokemonEvolutionChainId(
      GetPokemonEvolutionChainDTO dto);
}
