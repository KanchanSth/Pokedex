import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/controllers/pokemon.dart';

class PokemonDetails extends StatelessWidget {
  String? url;
  int id;
  PokemonDetails({super.key, required this.id, required this.url});

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
      body: Container(
        child: Obx(() {
          final pokemonDetail = controller.pokemonDetials.value;

          if (pokemonDetail == null) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Column(
              children: [Image.network('${pokemonDetail.sprite!.image}')],
            );
          }
        }),
      ),
    );
  }
}
