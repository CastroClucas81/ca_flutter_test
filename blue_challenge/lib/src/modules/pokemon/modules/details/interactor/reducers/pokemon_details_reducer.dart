import 'package:asp/asp.dart';
import 'package:blue_challenge/generated/l10n.dart';
import 'package:blue_challenge/src/core/failures/failures.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/atoms/pokemon_details_atom.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/dtos/get_evolution_chain_dto.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/dtos/get_pokemon_evolution_chain_dto.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/services/i_pokemon_details_service.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/states/pokemon_details_state.dart';

class PokemonDetailsReducer extends Reducer {
  final IPokemonDetailsService _getPokemonDetailsService;

  PokemonDetailsReducer({
    required IPokemonDetailsService getPokemonDetailsService,
  }) : _getPokemonDetailsService = getPokemonDetailsService {
    on(() => [getPokemonDetailsAction], _getPokemonDetails);
  }

  Future<void> _getPokemonDetails() async {
    pokemonDetailsState.setValue(PokemonDetailsLoading());

    final dto = getPokemonDetailsAction.value;

    final isError = ((bool isConnectionFailure) => pokemonDetailsState.setValue(
          PokemonDetailsError(
            message: isConnectionFailure
                ? S().noInternetConnectionWasFound
                : S().anErrorOcurredPleaseTryAgain,
          ),
        ));

    (await _getPokemonDetailsService.getPokemonDetails(dto)).fold(
      (failure) {
        isError(failure is ConnectionFailure);
      },
      (pokemon) async {
        final getPokemonEvolutionChain =
            await _getPokemonDetailsService.getPokemonEvolutionChainId(
          GetPokemonEvolutionChainDTO(pokemonName: pokemon.name),
        );

        getPokemonEvolutionChain.fold(
          (failure) {
            isError(failure is ConnectionFailure);
          },
          (pokemonEvolutionChainId) async {
            final getEvolutionChain =
                await _getPokemonDetailsService.getEvolutionChain(
              GetEvolutionChainDTO(evolutionChainId: pokemonEvolutionChainId),
            );

            getEvolutionChain.fold((failure) {
              isError(failure is ConnectionFailure);
            }, (evolutionChain) {
              pokemonDetailsState.setValue(PokemonDetailsSuccess(
                pokemon: pokemon,
                evolutionChain: evolutionChain,
              ));
            });
          },
        );
      },
    );
  }
}
