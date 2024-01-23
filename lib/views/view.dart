import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/controllers/pokemon.dart';

import 'package:pokedex/views/pokemondetails_view.dart';

class PokemonView extends StatelessWidget {
  PokemonView({Key? key}) : super(key: key);

  Pokemon_Controller controller = Get.put(Pokemon_Controller());

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

        var pokemonData = controller.pokemonList;
        var pokemonInfoData = controller.pokemonDetials;

        return Padding(
          padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: pokemonData.length,
            itemBuilder: (context, index) {
              var pokemon = pokemonData[index];
              return GestureDetector(
                onTap: () {
                  Get.to(() => PokemonDetails(
                        id: index + 1,
                        url: pokemon.url,
                      ));
                },
                child: Card(
                  child: GridTile(
                      child: Column(
                    children: [
                      Image.network('${pokemon.sprite!.image}'),
                      Text('${pokemon.name}'),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Types",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            pokemon.types.toString(),
                          ),
                        ],
                      ),
                    ],
                  )),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
