import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/entities/evolves_specie_entity.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/entities/evolves_to_entity.dart';
import 'package:equatable/equatable.dart';

class EvolutionChainEntity extends Equatable {
  final EvolvesSpecieEntity species;
  final List<EvolvesToEntity> evolvesTo;

  const EvolutionChainEntity({
    required this.species,
    required this.evolvesTo,
  });

  factory EvolutionChainEntity.fromMap(Map<String, dynamic> map) {
    return EvolutionChainEntity(
      species: EvolvesSpecieEntity.fromMap(
          map['chain']['species'] as Map<String, dynamic>),
      evolvesTo: (map['chain']['evolves_to'] as List)
          .map((e) => EvolvesToEntity.fromMap(e))
          .toList(),
    );
  }

  @override
  List<Object?> get props => [
        species,
        evolvesTo,
      ];
}
