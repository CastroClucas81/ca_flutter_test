import 'package:asp/asp.dart';
import 'package:blue_challenge/src/modules/pokemon/core/interactor/atoms/pokemon_atom.dart';
import 'package:blue_challenge/src/modules/pokemon/core/interactor/entities/pokemon_entity.dart';
import 'package:blue_challenge/src/modules/pokemon/core/interactor/services/i_pokemon_service.dart';

class PokemonReducer extends Reducer {
  final IPokemonService _pokemonService;

  PokemonReducer({
    required IPokemonService pokemonService,
  }) : _pokemonService = pokemonService {
    on(() => [favoritePokemonAction], _favorite);
    on(() => [unfavoritePokemonAction], _unfavorite);
    on(() => [getFavoritePokemonsAction], _getLocalPokemons);
  }

  Future<void> _favorite() async {
    final dto = favoritePokemonAction.value;

    if (dto != null) {
      await _pokemonService.insertLocalPokemon(dto);
      _getLocalPokemons();
    }
  }

  Future<void> _unfavorite() async {
    final dto = unfavoritePokemonAction.value;

    if (dto != null) {
      await _pokemonService.removeLocalPokemon(dto);
      _getLocalPokemons();
    }
  }

  Future<void> _getLocalPokemons() async {
    final localPokemons = (await _pokemonService.getLocalPokemons())
        .getOrElse(() => <PokemonEntity>[]);

    favoritePokemonsState.setValue(localPokemons);
  }
}
