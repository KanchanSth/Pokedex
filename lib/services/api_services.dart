import 'package:pokedex/models/pokemon_model.dart';
import 'package:dio/dio.dart';

class ApiService {
  Future<List<Pokemon>> getData() async {
    var response =
        await Dio().get('https://pokeapi.co/api/v2/pokemon?limit=151');

    if (response.statusCode == 200) {
      // return Pokemon.fromJson(response.body);

      List<Pokemon> pokemon = (response.data['results'] as List)
          .map((e) => Pokemon.fromJson(e))
          .toList();

      return pokemon;
    } else {
      throw Exception("network error");
    }
  }

  Future<Pokemon> getDetails(int id) async {
    try {
      var response = await Dio().get('https://pokeapi.co/api/v2/pokemon/$id/');
      Pokemon pokemon = Pokemon.fromJson(response.data);
      return pokemon;
    } catch (e) {
      throw e;
    }
  }
}
