import 'package:flutter/material.dart';
import 'package:flutter_tutorial/model/characters.dart';

/// Displays its integer item as 'item N' on a Card whose color is based on
/// the item's value. The text is displayed in bright green if selected is true.
/// This widget's height is based on the animation parameter, it varies
/// from 0 to 128 as the animation varies from 0.0 to 1.0.
class character_item extends StatelessWidget {

  Character _character;
  GestureTapCallback onTap;

  character_item(this._character, this.onTap);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onTap: onTap,
        child: new Card(
            child: new Padding(
                padding: const EdgeInsets.all(35.0),
                child: new Text(_character.name)
            )
        )
    );
  }
}
