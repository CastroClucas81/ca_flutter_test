import 'package:blue_challenge/src/core/failures/failures.dart';
import 'package:blue_challenge/src/core/services/interator/i_api_manager.dart';
import 'package:blue_challenge/src/core/utils/utils.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/dtos/get_evolution_chain_dto.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/dtos/get_pokemon_details_dto.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/dtos/get_pokemon_evolution_chain_dto.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/entities/evolution_chain_entity.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/entities/pokemon_details_entity.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/services/i_pokemon_details_service.dart';
import 'package:dartz/dartz.dart';

class PokemonDetailsService implements IPokemonDetailsService {
  final IApiManager _apiManager;

  PokemonDetailsService({required IApiManager apiManager})
      : _apiManager = apiManager;

  @override
  Future<Either<Failure, PokemonDetailsEntity>> getPokemonDetails(
    GetPokemonDetailsDTO dto,
  ) async {
    try {
      final result = await _apiManager.get('/pokemon/${dto.name}');

      return Right(PokemonDetailsEntity.fromMap(result));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ConnectionFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, EvolutionChainEntity>> getEvolutionChain(
      GetEvolutionChainDTO dto) async {
    try {
      final result =
          await _apiManager.get('/evolution-chain/${dto.evolutionChainId}');

      return Right(EvolutionChainEntity.fromMap(result));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ConnectionFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> getPokemonEvolutionChainId(
      GetPokemonEvolutionChainDTO dto) async {
    try {
      final result =
          await _apiManager.get('/pokemon-species/${dto.pokemonName}');

      final url = result['evolution_chain']['url'] as String;

      return Right(Utils.extractIdFromUrl(url));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ConnectionFailure(message: e.toString()));
    }
  }
}
