import 'package:asp/asp.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/pokemons/interactor/atoms/pokemons_atom.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/pokemons/interactor/services/i_pokemons_service.dart';

class PokemonsReducer extends Reducer {
  final IPokemonsService _pokemonsService;

  PokemonsReducer({
    required IPokemonsService pokemonsService,
  }) : _pokemonsService = pokemonsService {
    on(() => [pokemonsState], _getPokemons);
  }

  Future<void> _getPokemons() async {
    final state = pokemonsState.value;

    (await _pokemonsService.getPokemons(state.dto)).fold(
      (failure) {
        state.pagingController.error = failure;
      },
      (paginate) async {
        if (paginate.next == null) {
          state.pagingController.appendLastPage(paginate.results);
        } else {
          final results = paginate.results;

          final newOffSet =
              Uri.parse(paginate.next!).queryParameters['offset']!;
          final newKey = state.dto.offset == 0 ? 1 : int.parse(newOffSet) ~/ 20;

          state.pagingController.appendPage(results, newKey);
        }
      },
    );
  }
}
