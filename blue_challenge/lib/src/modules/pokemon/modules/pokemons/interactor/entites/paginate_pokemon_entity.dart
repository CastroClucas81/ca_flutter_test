import 'package:blue_challenge/src/modules/pokemon/core/interactor/entities/pokemon_entity.dart';
import 'package:equatable/equatable.dart';

class PaginatePokemonEntity extends Equatable {
  final int count;
  final String? next;
  final String? previous;
  final List<PokemonEntity> results;

  const PaginatePokemonEntity({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory PaginatePokemonEntity.fromMap(Map<String, dynamic> map) {
    return PaginatePokemonEntity(
      count: map['count'] as int,
      next: map['next'],
      previous: map['previous'],
      results: (map['results'] as List)
          .map(
            (x) => PokemonEntity.fromMap(x as Map<String, dynamic>),
          )
          .toList(),
    );
  }

  @override
  List<Object?> get props => [
        count,
        next,
        previous,
        results,
      ];
}
