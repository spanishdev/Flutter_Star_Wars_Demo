import 'package:flutter/material.dart';
import 'package:flutter_tutorial/model/characters.dart';

class CharacterPage extends StatefulWidget {
  Character _character;

  CharacterPage(this._character);

  @override
  _CharacterPageState createState() => new _CharacterPageState(_character);
}

class _CharacterPageState extends State<CharacterPage> {
  Character _character;

  _CharacterPageState(this._character);

  Container generateRow(String title, String description) {
    return new Container(
        margin: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
        child: new Row(
          children: <Widget>[
            new Text(title + ":",
                  style: new TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)
            ),
            new Text(description,
                style: new TextStyle(fontSize: 18.0, color: Colors.black))
          ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text(_character.name)),
        body: new Container(
            margin: new EdgeInsets.fromLTRB(10.0, 16.0, 16.0, 10.0),
            child: new Column(
              children: <Widget>[
                generateRow("Gender", _character.gender),
                generateRow("Birth Year", _character.birth_year),
                generateRow("Eye Color", _character.eye_color),
                generateRow("Hair Color", _character.hair_color),
                generateRow("Skin Color", _character.skin_color),
                generateRow("Mass", _character.mass),
                generateRow("Height", _character.height)
              ],
            )));
  }
}
