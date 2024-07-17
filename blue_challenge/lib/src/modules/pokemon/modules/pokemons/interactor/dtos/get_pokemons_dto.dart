class GetPokemonsDTO {
  final int offset;
  final int limit;
  final String? search;

  GetPokemonsDTO({
    required this.offset,
    required this.limit,
    this.search,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'offset': offset,
      'limit': limit,
      if (search != null && search!.isNotEmpty) 'search': search,
    };
  }

  GetPokemonsDTO copyWith({
    int? offset,
    int? limit,
    String? search,
  }) {
    return GetPokemonsDTO(
      offset: offset ?? this.offset,
      limit: limit ?? this.limit,
      search: search ?? this.search,
    );
  }
}
