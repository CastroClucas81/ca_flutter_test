import 'package:asp/asp.dart';
import 'package:blue_challenge/generated/l10n.dart';
import 'package:blue_challenge/src/core/widgets/not_found.dart';
import 'package:blue_challenge/src/modules/pokemon/core/interactor/atoms/pokemon_atom.dart';
import 'package:blue_challenge/src/modules/pokemon/core/ui/widgets/pokemon_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FavoritePokemonsTab extends StatelessWidget {
  const FavoritePokemonsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritePokemons = context.select(() => favoritePokemonsState.value);

    if (favoritePokemons.isEmpty) {
      return NotFound(
        title: S.of(context).whoops,
        description: S.of(context).youDidntFavoriteAnyPokemon,
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      itemCount: favoritePokemons.length,
      itemBuilder: (context, index) {
        final pokemon = favoritePokemons[index];

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
