class GetPokemonDetailsDTO {
  final String name;

  GetPokemonDetailsDTO({required this.name});

  factory GetPokemonDetailsDTO.empty() {
    return GetPokemonDetailsDTO(name: '');
  }
}
