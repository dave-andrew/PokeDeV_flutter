import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:frontend/model/pokemon_model.dart';

class HomePage extends StatefulWidget {
  final List<Pokemon> pokemonList;

  const HomePage({Key? key, required this.pokemonList}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          const Text(
            "Today's Pokemon!",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          CarouselSlider(
            items: widget.pokemonList.map((pokemon) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    index = widget.pokemonList.indexOf(pokemon);
                  });
                },
                child: Image.network(pokemon.image),
              );
            }).toList(),
            options: CarouselOptions(
                height: 200,
                enableInfiniteScroll: true,
                enlargeCenterPage: true,
                autoPlay: true,
                onPageChanged: (currentIndex, reason) {
                  setState(() {
                    index = currentIndex;
                  });
                }),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            widget.pokemonList[index].name,
            style: const TextStyle(fontSize: 20.0),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
            child: Text(
              widget.pokemonList[index].description,
              style: const TextStyle(fontSize: 15.0),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  const Text(
                    "Height:",
                    style: TextStyle(fontSize: 15.0),
                  ),
                  Text(
                    widget.pokemonList[index].height,
                    style: const TextStyle(fontSize: 15.0),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    "Weight:",
                    style: TextStyle(fontSize: 15.0),
                  ),
                  Text(
                    widget.pokemonList[index].weight,
                    style: const TextStyle(fontSize: 15.0),
                  ),
                ],
              ),
              const SizedBox(
                width: 50.0,
              ),
              Column(
                children: [
                  const Text(
                    "Type:",
                    style: TextStyle(fontSize: 15.0),
                  ),
                  Text(
                    widget.pokemonList[index].type.join(", "),
                    style: const TextStyle(fontSize: 15.0),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
