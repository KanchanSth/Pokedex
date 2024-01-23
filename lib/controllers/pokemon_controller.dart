import 'package:get/get.dart';
import 'package:pokedex/models/pokemon_info_response.dart';

import 'package:pokedex/services/pokemon_repo.dart';

import '../models/pokemon_page_response.dart';

class PokemonController extends GetxController {
  var isLoading = true.obs;

  var pokemonListings = <PokemonListing>[].obs;
  var pokemonInfoListings = <PokemonInfoResponse>[].obs;
  int? pokemonId;
  @override
  void onInit() {
    fetchPokemon();
    super.onInit();
  }

  fetchPokemon() async {
    try {
      isLoading(true);
      // var data = await ApiService().fetchData();
      // pokemonList.add(data);
      // print(pokemonList);

      var pokemons = await PokemonRepository().getPokemonPage(0);
      pokemonListings.addAll(pokemons.pokemonListing);

      fetchType(pokemonId!);

      // for (int i = 0; i <= 150; i++) {
      //   fetchType(pokemons.pokemonListing[i].id);
      // }
    } catch (e) {
      print("error fetching data $e ");
    } finally {
      isLoading(false);
    }
  }

  fetchType(int pId) async {
    try {
      isLoading(true);
      var type = await PokemonRepository().getPokemonInfo(pId);
      pokemonInfoListings.add(type);
    } catch (e) {
      print("error fetching data $e");
    } finally {
      isLoading(true);
    }
  }
}
