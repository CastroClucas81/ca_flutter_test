import 'package:blue_challenge/src/core/failures/failures.dart';
import 'package:blue_challenge/src/core/services/interator/i_api_manager.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/pokemons/interactor/dtos/get_pokemons_dto.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/pokemons/interactor/entites/paginate_pokemon_entity.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/pokemons/interactor/services/i_pokemons_service.dart';
import 'package:dartz/dartz.dart';

class PokemonsService implements IPokemonsService {
  final IApiManager _apiManager;

  PokemonsService({
    required IApiManager apiManager,
  }) : _apiManager = apiManager;

  @override
  Future<Either<Failure, PaginatePokemonEntity>> getPokemons(
      GetPokemonsDTO dto) async {
    try {
      final result = await _apiManager.get(
        '/pokemon',
        queryParams: dto.toMap(),
      );

      return Right(PaginatePokemonEntity.fromMap(result));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }
}
