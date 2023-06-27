import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/controllers/pokemon_controller.dart';
import 'package:pokedex/views/pokemondetails_view.dart';

class PokemonView extends StatelessWidget {
  PokemonView({Key? key}) : super(key: key);

  PokemonController controller = Get.put(PokemonController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        title: const Text(
          "Pokedex",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        var pokemonData = controller.pokemonList[0].results;

        return ListView.builder(
          itemCount: pokemonData.length,
          itemBuilder: (context, index) {
            var pokemon = pokemonData[index];
            return Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                color: Colors.redAccent,
                child: ListTile(
                  onTap: () {
                    Get.to(PokemonDetails());
                  },
                  title: Text(pokemon.name),
                  subtitle: Text(pokemon.url),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
