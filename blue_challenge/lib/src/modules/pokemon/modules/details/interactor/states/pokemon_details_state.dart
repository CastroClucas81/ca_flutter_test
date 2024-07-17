import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/entities/evolution_chain_entity.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/entities/pokemon_details_entity.dart';
import 'package:equatable/equatable.dart';

sealed class PokemonDetailsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PokemonDetailsLoading extends PokemonDetailsState {}

class PokemonDetailsError extends PokemonDetailsState {
  final String message;

  PokemonDetailsError({required this.message});

  @override
  List<Object?> get props => [message];
}

class PokemonDetailsSuccess extends PokemonDetailsState {
  final PokemonDetailsEntity pokemon;
  final EvolutionChainEntity evolutionChain;

  PokemonDetailsSuccess({
    required this.pokemon,
    required this.evolutionChain,
  });

  @override
  List<Object?> get props => [pokemon, evolutionChain];
}
