import 'package:blue_challenge/src/core/services/data/api_manager.dart';
import 'package:blue_challenge/src/core/services/data/database_manager.dart';
import 'package:blue_challenge/src/core/services/interator/i_api_manager.dart';
import 'package:blue_challenge/src/modules/pokemon/core/data/services/pokemon_service.dart';
import 'package:blue_challenge/src/modules/pokemon/core/interactor/reducers/pokemon_reducer.dart';
import 'package:blue_challenge/src/modules/pokemon/core/interactor/services/i_pokemon_service.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/data/services/pokemon_details_service.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/reducers/pokemon_details_reducer.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/services/i_pokemon_details_service.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/ui/pages/pokemon_details_page.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/pokemons/data/services/pokemons_service.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/pokemons/interactor/reducers/pokemons_reducer.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/pokemons/interactor/services/i_pokemons_service.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/pokemons/ui/pages/pokemons_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PokemonModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton<IApiManager>(ApiManager.new);

    i.add<IPokemonService>(
        () => PokemonService(databaseManager: DatabaseManager()));
    i.add<IPokemonsService>(PokemonsService.new);
    i.add<IPokemonDetailsService>(PokemonDetailsService.new);

    i.addSingleton(PokemonReducer.new);
    i.addSingleton(PokemonsReducer.new);
    i.addSingleton(PokemonDetailsReducer.new);

    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child('/pokemons', child: (context) => const PokemonsPage());
    r.child(
      '/details',
      child: (context) => PokemonDetailsPage(
        pokemonName: r.args.data as String,
      ),
    );
    super.routes(r);
  }
}
