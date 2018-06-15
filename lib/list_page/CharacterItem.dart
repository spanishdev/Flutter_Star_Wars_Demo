import 'package:flutter/material.dart';
import 'package:flutter_tutorial/model/characters.dart';

/// Displays its integer item as 'item N' on a Card whose color is based on
/// the item's value. The text is displayed in bright green if selected is true.
/// This widget's height is based on the animation parameter, it varies
/// from 0 to 128 as the animation varies from 0.0 to 1.0.
class CharacterItem extends StatelessWidget {
  Character _character;

  CharacterItem(Character character) {
    this._character = character;
  }

  @override
  Widget build(BuildContext context) {
    return new Card(
        child: new Padding(
            padding: const EdgeInsets.all(35.0),
            child: new Text(_character.name)
        )
    );
  }
}
