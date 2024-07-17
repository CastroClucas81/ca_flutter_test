import 'package:equatable/equatable.dart';

class PokemonEntity extends Equatable {
  final String name;
  final String url;

  const PokemonEntity({
    required this.name,
    required this.url,
  });

  factory PokemonEntity.fromMap(Map<String, dynamic> map) {
    return PokemonEntity(
      name: map['name'] as String,
      url: map['url'] as String,
    );
  }

  @override
  List<Object?> get props => [
        name,
        url,
      ];
}
