import 'package:flutter/material.dart';
import 'package:frontend/model/pokemon_model.dart';
import 'package:frontend/pages/pokemon_detail_page.dart';

class PokedexPage extends StatefulWidget {
  final List<Pokemon> pokemonList;
  final String username;
  const PokedexPage(
      {Key? key, required this.pokemonList, required this.username})
      : super(key: key);

  @override
  State<PokedexPage> createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Center(
              child: Text(
            "Pokemon List",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          )),
          Expanded(
            child: ListView.builder(
              itemCount: widget.pokemonList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PokedexDetailPage(
                              pokemon: widget.pokemonList[index],
                              username: widget.username),
                        ),
                      );
                    },
                    leading: Image.network(widget.pokemonList[index].image),
                    title: Text(widget.pokemonList[index].name),
                    subtitle: Text(widget.pokemonList[index].description),
                    trailing: Text(widget.pokemonList[index].type.join(", ")),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
