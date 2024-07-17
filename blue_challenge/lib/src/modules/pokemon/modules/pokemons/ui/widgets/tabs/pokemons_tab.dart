import 'package:blue_challenge/src/modules/pokemon/core/ui/widgets/infinite_pagination.dart';
import 'package:blue_challenge/src/modules/pokemon/core/ui/widgets/pokemon_card.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/pokemons/interactor/atoms/pokemons_atom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PokemonsTab extends StatelessWidget {
  const PokemonsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return InfinitePagination(
      controller: pokemonsState.value.pagingController,
      itemBuilder: (context, pokemon, index) {
        return PokemonCard(
          pokemon: pokemon,
          onPressed: () {
            Modular.to.pushNamed(
              '/pokemon/details',
              arguments: pokemon.name,
            );
          },
        );
      },
    );
  }
}
