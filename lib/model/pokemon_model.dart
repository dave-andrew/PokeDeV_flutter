import 'package:frontend/model/comment_model.dart';

class Pokemon {
  int id;
  String name;
  String image;
  List<String> type;
  String description;
  String height;
  String weight;
  List<PokeComment> commentList;

  Pokemon({
    required this.id,
    required this.name,
    required this.image,
    required this.type,
    required this.description,
    required this.height,
    required this.weight,
    List<PokeComment>? commentList,
  }) : commentList = commentList ?? [];
}
