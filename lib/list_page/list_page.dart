import 'dart:async';
import 'dart:convert';

import 'package:flutter_tutorial/characters/character_item.dart';
import 'package:flutter_tutorial/characters/character_page.dart';
import 'package:flutter_tutorial/model/characters.dart';
import 'package:flutter_tutorial/model/star_wars_api.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  ListPage() : super();

  @override
  _ListPageState createState() => new _ListPageState();
}

class _ListPageState extends State<ListPage> {

  List<Character> _characters;

  @override
  void initState() {
    super.initState();

    getCharacters();
  }

  Future<List<Character>> getCharacters() async {
    var response = await http.get(
      Uri.encodeFull(Endpoints.BASE_URL+"people/")
    );

    print(response.body);

    Map<String,dynamic> data = JSON.decode(response.body);
    var results = data['results'];

    List<Character> characterList = new List<Character>();

    results.forEach((Map map) => characterList.add(new Character.fromMap(map)));

    print(characterList[0].name);

    setState(() => _characters = characterList);

    return characterList;

  }

  onCharacterSelected(int index) {
    print("SELECTED: "+_characters[index].name);
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new CharacterPage(_characters[index])));
  }


  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      body: new Center(
        child: new ListView.builder(
          itemCount: _characters == null ? 0 : _characters.length,
          itemBuilder: (context,index){
             return new character_item(_characters[index],() => onCharacterSelected(index));
          },
        ),

      ),

      floatingActionButton: new FloatingActionButton(
        onPressed: getCharacters,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}