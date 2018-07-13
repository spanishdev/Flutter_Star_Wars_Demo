import 'dart:async';
import 'dart:convert';

import 'package:flutter_tutorial/characters/character_item.dart';
import 'package:flutter_tutorial/characters/character_page.dart';
import 'package:flutter_tutorial/model/characters.dart';
import 'package:flutter_tutorial/model/star_wars_api.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class CharacterListPage extends StatefulWidget {
  CharacterListPage() : super();

  @override
  _CharacterListPageState createState() => new _CharacterListPageState();
}

class _CharacterListPageState extends State<CharacterListPage> {

  List<Character> _characters;
  int page = 1;

  ScrollController _scrollController;
  bool _loading = false;

  @override
  void initState() {
    super.initState();

    _characters = new List<Character>();
    getCharacters(page);

    _scrollController = new ScrollController()..addListener(onBottomReached);
  }

  @override
  void dispose() {
    _scrollController.removeListener(onBottomReached);
    super.dispose();
  }

  onBottomReached() {
    if(_scrollController.position.extentAfter < 500 && !_loading){
      getCharacters(++page);
    }
  }

  Future<List<Character>> getCharacters(int page) async {

    _loading = true;

    var response = await http.get(
      Uri.encodeFull(Endpoints.BASE_URL+"people?page=$page")
    );

    print(response.body);

    Map<String,dynamic> data = JSON.decode(response.body);
    var results = data['results'];

    try{
      results.forEach((Map map) =>  setState(() => _characters.add(new Character.fromMap(map))));
    } catch(e) {
      print(e.toString());
    } finally {
      _loading = false;
    }

  }

  onCharacterSelected(int index) {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new CharacterPage(_characters[index])));
  }


  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      body: new Center(
        child: new ListView.builder(
          controller: _scrollController,
          itemCount: _characters == null ? 0 : _characters.length + 1,
          itemBuilder: (context,index){

            if(index == _characters.length){
              if(_loading) {
                return new Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: const Center( child: const CircularProgressIndicator())
                );
              } else {
                return new Container( height: 50.0);
              }
            }
            else return new character_item(_characters[index],() => onCharacterSelected(index));
          },
        ),

      ),

      floatingActionButton: new FloatingActionButton(
        onPressed: () => getCharacters(page),
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}