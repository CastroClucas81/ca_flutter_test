import 'package:blue_challenge/src/modules/pokemon/pokemons/ui/pages/pokemons_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PokemonModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/pokemons', child: (context) => const PokemonsPage());
    super.routes(r);
  }
}
