import 'package:blue_challenge/src/modules/authentication/authentication_module.dart';
import 'package:blue_challenge/src/modules/pokemon/pokemon_module.dart';
import 'package:blue_challenge/src/modules/splash/splash_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        AuthenticationModule(),
      ];

  @override
  void routes(r) {
    r.module('/splash', module: SplashModule());
    r.module('/auth', module: AuthenticationModule());
    r.module('/pokemon', module: PokemonModule());
  }
}
