import 'package:asp/asp.dart';
import 'package:blue_challenge/src/core/colors/pokedex_colors.dart';
import 'package:blue_challenge/src/core/design_system/colors/ds_colors.dart';
import 'package:blue_challenge/src/core/widgets/some_error.dart';
import 'package:blue_challenge/src/modules/pokemon/core/interactor/atoms/pokemon_atom.dart';
import 'package:blue_challenge/src/modules/pokemon/core/interactor/dtos/insert_local_pokemon_dto.dart';
import 'package:blue_challenge/src/modules/pokemon/core/interactor/dtos/remove_local_pokemon_dto.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/atoms/pokemon_details_atom.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/dtos/get_pokemon_details_dto.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/states/pokemon_details_state.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/ui/widgets/pokemon_details_data.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/ui/widgets/skeletons/pokemon_details_skeleton.dart';
import 'package:flutter/material.dart';

class PokemonDetailsPage extends StatefulWidget {
  final String pokemonName;

  const PokemonDetailsPage({required this.pokemonName, super.key});

  @override
  State<PokemonDetailsPage> createState() => _PokemonDetailsPageState();
}

class _PokemonDetailsPageState extends State<PokemonDetailsPage> {
  @override
  void initState() {
    fetch();
    super.initState();
  }

  void fetch() {
    getPokemonDetailsAction.value = GetPokemonDetailsDTO(
      name: widget.pokemonName,
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select(() => pokemonDetailsState.value);
    final isSuccess = state is PokemonDetailsSuccess;
    final favoritePokemons = context.select(() => favoritePokemonsState.value);
    final isFavorited =
        isSuccess && favoritePokemons.any((e) => e.name == state.pokemon.name);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: state is PokemonDetailsSuccess
            ? PokedexColors.getByName(state.pokemon.types.first.name)
            : null,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            color: isSuccess ? DSColors.white : DSColors.black,
          ),
        ),
        actions: [
          if (state is PokemonDetailsSuccess)
            IconButton(
              onPressed: () {
                final name = state.pokemon.name;

                if (isFavorited) {
                  unfavoritePokemonAction.setValue(
                    RemoveLocalPokemonDTO(name: name),
                  );
                } else {
                  favoritePokemonAction.setValue(
                    InsertLocalPokemonDTO(
                      name: name,
                      url: state.pokemon.locationAreaEncounters
                          .replaceAll('encounters', ''),
                    ),
                  );
                }
              },
              icon: Icon(
                isFavorited ? Icons.favorite : Icons.favorite_outline,
                color: isFavorited ? DSColors.red : DSColors.white,
              ),
            )
        ],
      ),
      body: SafeArea(
        child: switch (state) {
          PokemonDetailsLoading() => const PokemonDetailsSkeleton(),
          PokemonDetailsError() => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SomeError(
                description: state.message,
                onTryAgain: fetch,
              ),
            ),
          PokemonDetailsSuccess() => PokemonDetailsData(
              pokemon: state.pokemon,
              evolutionChain: state.evolutionChain,
            ),
        },
      ),
    );
  }
}
