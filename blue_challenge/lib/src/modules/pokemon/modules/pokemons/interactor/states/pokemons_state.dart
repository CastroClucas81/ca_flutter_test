import 'package:equatable/equatable.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:blue_challenge/src/modules/pokemon/core/interactor/entities/pokemon_entity.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/pokemons/interactor/dtos/get_pokemons_dto.dart';

class PokemonsState extends Equatable {
  final GetPokemonsDTO dto;
  final PagingController<int, PokemonEntity> pagingController;
  final bool pagingIsStarted;

  const PokemonsState({
    required this.dto,
    required this.pagingController,
    this.pagingIsStarted = false,
  });

  @override
  List<Object?> get props => [
        dto,
        pagingController,
        pagingIsStarted,
      ];
}
