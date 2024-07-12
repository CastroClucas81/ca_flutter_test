import 'package:asp/asp.dart';
import 'package:blue_challenge/src/modules/authentication/interactor/atoms/authentication_atom.dart';
import 'package:blue_challenge/src/modules/authentication/interactor/states/authentication_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    rxObserver(
      () => authenticationState.value,
      effect: (state) {
        if (state is UnloggedAuthentication) {
          Modular.to.navigate('/auth/login');
        }

        if (state is LoggedAuthentication) {
          Modular.to.navigate('/pokemon/pokemons');
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/splash/');

    return MaterialApp.router(
      title: 'Blue Challenge',
      debugShowCheckedModeBanner: false,
      routerConfig: Modular.routerConfig,
    );
  }
}
