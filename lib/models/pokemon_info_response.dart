class PokemonInfoResponse {
  final List<String> type;
  PokemonInfoResponse({required this.type});

  factory PokemonInfoResponse.fromJson(Map<String, dynamic> json) {
    final types = (json['types'] as List)
        .map((typeJson) => typeJson['type']['name'] as String)
        .toList();
    return PokemonInfoResponse(type: types);
  }
}
