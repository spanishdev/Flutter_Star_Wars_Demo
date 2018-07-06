import 'package:flutter/material.dart';
import 'package:flutter_tutorial/characters/character_list_page.dart';
import 'package:flutter_tutorial/list_page/nav_drawer_item.dart';

final String PAGE_TITLE = "Main Page";

class HomePage extends StatefulWidget {

  final List<NavDrawerItem> navDrawerItems = [
      new NavDrawerItem(0,"Characters"),
      new NavDrawerItem(1,"Planets"),
      new NavDrawerItem(2,"Starships"),
      new NavDrawerItem(3,"Species"),
      new NavDrawerItem(4,"Vehicles"),
      new NavDrawerItem(5,"Films")
  ];

  final String title = PAGE_TITLE;

  @override
  _HomePageState createState() => new _HomePageState(navDrawerItems[0]);
}



class _HomePageState extends State<HomePage> {

  NavDrawerItem _selectedItem;

  _HomePageState(NavDrawerItem item){
    _selectedItem = item;
  }

  NavDrawerItem _getSelectedItem(){
    return _selectedItem;
  }

  _getSelectedScreen(NavDrawerItem selectedItem) {
    if(selectedItem == null) return null;

    return new CharacterListPage();
  }


  _setSelectedItem(NavDrawerItem selected) {
    if(selected == null) return;

    if(_selectedItem == null || _selectedItem.id != selected.id) {
      setState(() => _selectedItem = selected);
    } else {
      return;
    }

    Navigator.of(context).pop();
  }

  bool _isSelected(NavDrawerItem item) {
      if(item == null || _selectedItem == null) return false;

      return item.id == _selectedItem.id;
  }

  @override
  Widget build(BuildContext context) {

    var drawerItems = <Widget>[];

    widget.navDrawerItems.forEach((item) =>
        drawerItems.add(
            new ListTile(
              title: new Text(item.name),
              selected: _isSelected(item),
              onTap: () => _setSelectedItem(item),
            )
        )
    );

    return new Scaffold(
      appBar: new AppBar(title: new Text(_selectedItem.name)),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(accountName: new Text("Hahaha estoy usando el internet"), accountEmail: null),
            new Column(children: drawerItems)
          ],
        ),
      ),

      body: _getSelectedScreen(_selectedItem),

    );
  }

}