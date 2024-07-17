class InsertLocalPokemonDTO {
  final String name;
  final String url;

  InsertLocalPokemonDTO({
    required this.name,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'url': url,
    };
  }
}
