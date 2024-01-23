import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/models/pokemon_info_response.dart';
import 'package:pokedex/models/pokemon_page_response.dart';

class PokemonRepository {
  final baseUrl = 'pokeapi.co';
  final client = http.Client();

  Future<PokemonPageResponse> getPokemonPage(int pageIndex) async {
    // final queryParameters = {
    //   'limit': 151,
    //   'offset': (pageIndex * 151).toString()
    // };

    // final uri = Uri.https(baseUrl, '/api/v2/pokemon');

    final uri = Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=151');

    final response = await http.get(uri);

    final json = jsonDecode(response.body);

    return PokemonPageResponse.fromJson(json);
  }

  Future<PokemonInfoResponse> getPokemonInfo(int pId) async {
    final uri = Uri.parse('https://pokeapi.co/api/v2/pokemon/$pId');

    final response = await http.get(uri);

    final json = jsonDecode(response.body);

    return PokemonInfoResponse.fromJson(json);
  }
}
