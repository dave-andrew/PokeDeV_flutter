import 'package:flutter/material.dart';
import 'package:frontend/model/pokemon_model.dart';
import 'package:frontend/model/comment_model.dart';

class PokedexDetailPage extends StatefulWidget {
  final Pokemon pokemon;
  final String username;
  const PokedexDetailPage(
      {Key? key, required this.pokemon, required this.username})
      : super(key: key);

  @override
  State<PokedexDetailPage> createState() => _PokedexDetailPageState();
}

class _PokedexDetailPageState extends State<PokedexDetailPage> {
  String comment = "";

  TextEditingController commentController = TextEditingController();

  void _submitComment() {
    comment = commentController.text;
    if (comment.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Comment is empty"),
        ),
      );
      return;
    }

    PokeComment newComment =
        PokeComment(name: widget.username, description: comment);

    setState(() {
      widget.pokemon.commentList.add(newComment);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Comment Success"),
      ),
    );
    commentController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SizedBox(
          height: 50,
          width: 200,
          child: Image.asset("lib/assets/Logo.png"),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const TabBar(
              labelColor: Colors.black,
              tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.info),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text("Details"),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.comment),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text("Comments"),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Image.network(widget.pokemon.image),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            widget.pokemon.name,
                            style: const TextStyle(fontSize: 20.0),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
                            child: Text(
                              widget.pokemon.description,
                              style: const TextStyle(fontSize: 15.0),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  const Text(
                                    "Height",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    widget.pokemon.height,
                                    style: const TextStyle(fontSize: 15.0),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  const Text(
                                    "Weight",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    widget.pokemon.weight,
                                    style: const TextStyle(fontSize: 15.0),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  const Text(
                                    "Type",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    widget.pokemon.type.join(", "),
                                    style: const TextStyle(fontSize: 15.0),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  ListView.builder(
                    itemCount: widget.pokemon.commentList.isEmpty
                        ? 1
                        : widget.pokemon.commentList.length,
                    itemBuilder: (context, index) {
                      if (widget.pokemon.commentList.isEmpty) {
                        return const Column(
                          children: [
                            SizedBox(
                              height: 20.0,
                            ),
                            Text("Be the first one to comment!"),
                          ],
                        );
                      } else {
                        final currentComment =
                            widget.pokemon.commentList[index];
                        return Card(
                          elevation: 3,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                          child: ListTile(
                            title: Row(
                              children: [
                                Text(
                                  currentComment.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Text(currentComment.description),
                              ],
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: TextField(
        controller: commentController,
        onSubmitted: (_) => _submitComment(),
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Comment',
        ),
      ),
    );
  }
}
