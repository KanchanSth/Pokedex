import 'package:get/get.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/services/api_services.dart';

class PokemonController extends GetxController {
  var isLoading = true.obs;
  var pokemonList = <PokemonModel>[].obs;
  @override
  void onInit() {
    fetchPokemon();
    super.onInit();
  }

  fetchPokemon() async {
    try {
      isLoading(true);
      var data = await ApiService().fetchData();
      pokemonList.add(data);
      print(pokemonList);
    } catch (e) {
      print("error fetching data $e ");
    } finally {
      isLoading(false);
    }
  }
}
