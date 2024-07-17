import 'package:equatable/equatable.dart';

class PokemonStatEntity extends Equatable {
  final int effort;
  final int baseStat;
  final String name;
  final String url;

  const PokemonStatEntity({
    required this.effort,
    required this.baseStat,
    required this.name,
    required this.url,
  });

  factory PokemonStatEntity.fromMap(Map<String, dynamic> map) {
    return PokemonStatEntity(
      baseStat: map['base_stat'] as int,
      effort: map['effort'] as int,
      name: map['stat']['name'],
      url: map['stat']['url'],
    );
  }

  @override
  List<Object?> get props => [
        effort,
        baseStat,
        name,
        url,
      ];
}
