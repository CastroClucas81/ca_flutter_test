import 'package:equatable/equatable.dart';

class PokemonTypeEntity extends Equatable {
  final String name;
  final String url;

  const PokemonTypeEntity({
    required this.name,
    required this.url,
  });

  factory PokemonTypeEntity.fromMap(Map<String, dynamic> map) {
    return PokemonTypeEntity(
      name: map['type']['name'],
      url: map['type']['url'],
    );
  }

  @override
  List<Object?> get props => [
        name,
        url,
      ];
}
