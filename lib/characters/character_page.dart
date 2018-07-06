import 'package:flutter/material.dart';
import 'package:flutter_tutorial/model/characters.dart';

class CharacterPage extends StatefulWidget {

  Character _character;

  CharacterPage(this._character);

  @override
  _CharacterPageState createState() => new _CharacterPageState(_character.name);
}

class _CharacterPageState extends State<CharacterPage> {

  String _title;
  _CharacterPageState(this._title);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(_title)),
      drawer: new Drawer(
        child: new Column(),
      ),
    );
  }
}
