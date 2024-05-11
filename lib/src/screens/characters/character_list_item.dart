import 'package:flutter/widgets.dart';
import 'package:flutter_sample_app/src/models/entities/character.dart';
import 'package:flutter_sample_app/src/utils/string_extensions.dart';
import 'package:flutter_sample_app/src/widgets/character_status.dart';

class CharacterListItem extends StatelessWidget {
  const CharacterListItem({required this.character, super.key});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Row(
        children: [
          Image.network(
            character.image,
            width: 64,
            height: 64,
            errorBuilder: (context, error, stackTrace) => Image.asset(
                'assets/no_character_image.jpeg',
                width: 64,
                height: 64),
          ),
          Flexible(
              child: Container(
            padding: const EdgeInsets.only(left: 16.0),
            height: 64,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  character.name,
                  maxLines: 1,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24.0),
                  overflow: TextOverflow.fade,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: CharacterStatus(characterStatus: character.status),
                    ),
                    Text(
                      "${character.status.name.toCapitalize()} — ${character.species}",
                      maxLines: 1,
                      style: const TextStyle(fontSize: 16.0),
                    )
                  ],
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
}
