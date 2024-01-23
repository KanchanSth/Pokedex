import 'package:get/get.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/services/api_services.dart';

class Pokemon_Controller extends GetxController {
  List<Pokemon> pokemonList = <Pokemon>[].obs;
  Rx<Pokemon?> pokemonDetials = Rx<Pokemon?>(null);

  ApiService apiService = ApiService();

  RxBool isLoading = false.obs;

  int? pokemonId;

  @override
  void onInit() {
    super.onInit();
  }

  void fetchPokemonList() async {
    isLoading(true);
    try {
      pokemonList = await apiService.getData();
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }

  void fetchDetails(int id) async {
    isLoading(true);
    try {
      var pokemon = await apiService.getDetails(id);
      pokemonDetials.value = pokemon;
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
