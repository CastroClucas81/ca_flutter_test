import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/entities/evolves_specie_entity.dart';
import 'package:equatable/equatable.dart';

class EvolvesToEntity extends Equatable {
  final int? minLevel;
  final String? trigger;
  final EvolvesSpecieEntity species;
  final List<EvolvesToEntity> evolvesTo;

  const EvolvesToEntity({
    this.minLevel,
    this.trigger,
    required this.species,
    required this.evolvesTo,
  });

  factory EvolvesToEntity.fromMap(Map<String, dynamic> map) {
    return EvolvesToEntity(
      minLevel: map['evolution_details'][0]?['min_level'] as int?,
      trigger: map['evolution_details'][0]?['trigger']['name'],
      species: EvolvesSpecieEntity.fromMap(
        map['species'] as Map<String, dynamic>,
      ),
      evolvesTo: (map['evolves_to'] as List)
          .map((e) => EvolvesToEntity.fromMap(e))
          .toList(),
    );
  }

  @override
  List<Object?> get props => [
        minLevel,
        species,
        evolvesTo,
      ];
}
