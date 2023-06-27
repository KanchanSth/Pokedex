import 'package:pokedex/models/pokemon_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<PokemonModel> fetchData() async {
    var response = await http
        .get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=151'));

    if (response.statusCode == 200) {
      return pokemonModelFromJson(response.body);
    } else {
      throw Exception("network error");
    }
  }
}
