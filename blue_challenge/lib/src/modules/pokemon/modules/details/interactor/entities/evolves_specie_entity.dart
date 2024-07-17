import 'package:equatable/equatable.dart';

class EvolvesSpecieEntity extends Equatable {
  final String name;
  final String url;

  const EvolvesSpecieEntity({
    required this.name,
    required this.url,
  });

  factory EvolvesSpecieEntity.fromMap(Map<String, dynamic> map) {
    return EvolvesSpecieEntity(
      name: map['name'],
      url: map['url'],
    );
  }

  @override
  List<Object?> get props => [
        name,
        url,
      ];
}
