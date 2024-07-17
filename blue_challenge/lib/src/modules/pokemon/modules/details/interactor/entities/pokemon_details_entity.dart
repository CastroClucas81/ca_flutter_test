import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/entities/pokemon_stat_entity.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/entities/pokemon_type_entity.dart';
import 'package:equatable/equatable.dart';

class PokemonDetailsEntity extends Equatable {
  final int id;
  final int weight;
  final int height;
  final String name;
  final String locationAreaEncounters;
  final List<PokemonTypeEntity> types;
  final List<PokemonStatEntity> stats;
  final String gif;
  final String abilityName;

  const PokemonDetailsEntity({
    required this.id,
    required this.weight,
    required this.height,
    required this.name,
    required this.locationAreaEncounters,
    required this.types,
    required this.stats,
    required this.gif,
    required this.abilityName,
  });

  factory PokemonDetailsEntity.fromMap(Map<String, dynamic> map) {
    return PokemonDetailsEntity(
      id: map['id'] as int,
      weight: map['weight'] as int,
      height: map['height'] as int,
      name: map['name'] as String,
      locationAreaEncounters: map['location_area_encounters'] as String,
      types: (map['types'] as List)
          .map(
            (x) => PokemonTypeEntity.fromMap(x as Map<String, dynamic>),
          )
          .toList(),
      stats: (map['stats'] as List)
          .map(
            (x) => PokemonStatEntity.fromMap(x as Map<String, dynamic>),
          )
          .toList(),
      gif: map['sprites']['other']['showdown']['front_default'],
      abilityName: map['abilities'][0]['ability']['name'] as String,
    );
  }

  @override
  List<Object?> get props => [
        id,
        weight,
        height,
        name,
        locationAreaEncounters,
        types,
        stats,
        gif,
        abilityName,
      ];
}
