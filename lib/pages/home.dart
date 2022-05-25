import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:teste_web/pages/debug.dart';
import 'package:teste_web/pages/info_page.dart';
import 'package:teste_web/pages/new_person.dart';
import 'package:teste_web/pages/person_list.dart';
import 'package:teste_web/util/settings_page.dart';

import '../widgets/tile_pessoa.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, dynamic>> history = [];
  final TextEditingController messageText = TextEditingController();
  bool loadingHistory = false;
  int _selectedIndex = 0;
  final List<Widget> _tabs = [
    PersonList(),
    NewPerson(),
    DebugPage(),
    InfoPage(),
  ];

  @override
  void initState() {
    //_getHistory(false);
    super.initState();
  }

  Future<void> _getHistory([bool refresh = true]) async {
    if (refresh) {
      setState(() {
        loadingHistory = true;
      });
    }
    setState(() {
      loadingHistory = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Prog. Web Final Flutter'),
          actions: [
            IconButton(
                icon: const Icon(
                  Icons.settings_outlined,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => SettingsPage(),
                      ));
                }),
          ],
        ),
        body: Row(
          children: <Widget>[
            NavigationRail(
              extended: true,
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              labelType: NavigationRailLabelType.none,
              destinations: const <NavigationRailDestination>[
                NavigationRailDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home),
                  label: Text('Listagem'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.add_outlined),
                  selectedIcon: Icon(Icons.add),
                  label: Text('Novo Cadastro'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.bug_report_outlined),
                  selectedIcon: Icon(Icons.bug_report),
                  label: Text('Debug'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.info_outline),
                  selectedIcon: Icon(Icons.info),
                  label: Text('Info'),
                ),
              ],
            ),

           //PAGES usar expanded direto aqui
        Expanded(child: _tabs[ _selectedIndex])],
        ));
  }
}

//flutter run -d chrome