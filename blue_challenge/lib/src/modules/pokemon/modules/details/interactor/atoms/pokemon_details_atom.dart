import 'package:asp/asp.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/dtos/get_pokemon_details_dto.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/states/pokemon_details_state.dart';

final pokemonDetailsState = Atom<PokemonDetailsState>(
  key: 'pokemonDetailsState',
  PokemonDetailsLoading(),
);

final getPokemonDetailsAction = Atom<GetPokemonDetailsDTO>(
  key: 'pokemonDetailsState',
  GetPokemonDetailsDTO.empty(),
);
