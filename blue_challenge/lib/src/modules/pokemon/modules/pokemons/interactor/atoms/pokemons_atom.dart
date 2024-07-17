import 'package:asp/asp.dart';
import 'package:blue_challenge/src/modules/pokemon/core/interactor/entities/pokemon_entity.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/pokemons/interactor/dtos/get_pokemons_dto.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/pokemons/interactor/states/pokemons_state.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

final pokemonsState = Atom<PokemonsState>(
  PokemonsState(
    dto: GetPokemonsDTO(offset: 0, limit: 20),
    pagingController: PagingController<int, PokemonEntity>(firstPageKey: 0),
  ),
);
