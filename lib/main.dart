import 'package:flutter/material.dart';
import 'package:frontend/model/pokemon_model.dart';
import 'package:frontend/pages/login_page.dart';

void main() {
  runApp(PokeDevApp());
}

class PokeDevApp extends StatelessWidget {
  PokeDevApp({super.key});

  final List<Pokemon> pokemonList = [
    Pokemon(
      id: 1,
      name: "Bulbasaur",
      image: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/001.png",
      type: ["Grass", "Poison"],
      description:
          "There is a plant seed on its back right from the day this Pokémon is born. The seed slowly grows larger.",
      height: "2' 04\"",
      weight: "15.2 lbs",
    ),
    Pokemon(
        id: 2,
        name: "Charmander",
        image:
            "https://assets.pokemon.com/assets/cms2/img/pokedex/full/004.png",
        type: ["Fire"],
        description:
            "It has a preference for hot things. When it rains, steam is said to spout from the tip of its tail.",
        height: "2' 00\"",
        weight: "18.7 lbs"),
    Pokemon(
        id: 3,
        name: "Squirtle",
        image:
            "https://assets.pokemon.com/assets/cms2/img/pokedex/full/007.png",
        type: ["Water"],
        description:
            "When it retracts its long neck into its shell, it squirts out water with vigorous force.",
        height: "1' 08\"",
        weight: "19.8 lbs"),
    Pokemon(
        id: 4,
        name: "Pikachu",
        image:
            "https://assets.pokemon.com/assets/cms2/img/pokedex/full/025.png",
        type: ["Electric"],
        description:
            "When it is angered, it immediately discharges the energy stored in the pouches in its cheeks.",
        height: "1' 04\"",
        weight: "13.2 lbs"),
    Pokemon(
        id: 5,
        name: "Ninetails",
        image:
            "https://assets.pokemon.com/assets/cms2/img/pokedex/full/038.png",
        type: ["Fire"],
        description:
            "Very smart and very vengeful. Grabbing one of its many tails could result in a 1000-year curse.",
        height: "3' 07\"",
        weight: "43.9 lbs"),
    Pokemon(
        id: 6,
        name: "Eevee",
        image:
            "https://assets.pokemon.com/assets/cms2/img/pokedex/full/133.png",
        type: ["Normal"],
        description:
            "Its genetic code is irregular. It may mutate if it is exposed to radiation from element stones.",
        height: "1' 00\"",
        weight: "14.3 lbs"),
    Pokemon(
        id: 7,
        name: "Azelf",
        image:
            "https://assets.pokemon.com/assets/cms2/img/pokedex/full/482.png",
        type: ["Psychic"],
        description:
            "It is thought that Uxie, Mesprit, and Azelf all came from the same egg.",
        height: "1' 00\"",
        weight: "0.7 lbs"),
    Pokemon(
        id: 8,
        name: "Zerkrom",
        image:
            "https://assets.pokemon.com/assets/cms2/img/pokedex/full/644.png",
        type: ["Dragon", "Electric"],
        description: "This Pokémon appears in legends.",
        height: "9' 06\"",
        weight: "760.6 lbs"),
    Pokemon(
        id: 9,
        name: "Mewtwo",
        image:
            "https://assets.pokemon.com/assets/cms2/img/pokedex/full/150.png",
        type: ["Psychic"],
        description:
            "It was created by a scientist after years of horrific gene splicing and DNA engineering experiments.",
        height: "6' 07\"",
        weight: "269.0 lbs"),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PokeDev",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(pokemonList: pokemonList),
    );
  }
}
