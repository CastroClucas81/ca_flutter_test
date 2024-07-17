import 'package:asp/asp.dart';
import 'package:blue_challenge/src/modules/pokemon/core/interactor/dtos/insert_local_pokemon_dto.dart';
import 'package:blue_challenge/src/modules/pokemon/core/interactor/dtos/remove_local_pokemon_dto.dart';
import 'package:blue_challenge/src/modules/pokemon/core/interactor/entities/pokemon_entity.dart';

final favoritePokemonsState = Atom<List<PokemonEntity>>(
  [],
  key: 'favoritePokemonsState',
);

final getFavoritePokemonsAction = Atom.action(key: 'getFavoritePokemonsAction');

final favoritePokemonAction = Atom<InsertLocalPokemonDTO?>(
  null,
  key: 'favoritePokemonAction',
);

final unfavoritePokemonAction = Atom<RemoveLocalPokemonDTO?>(
  null,
  key: 'unfavoritePokemonAction',
);
