import 'package:flutter/material.dart';
import 'package:teste_web/pages/info_page.dart';
import 'package:teste_web/pages/new_person.dart';
import 'package:teste_web/pages/person_list.dart';
import 'package:teste_web/util/settings_page.dart';
import '../util/app_details.dart';
import '../widgets/person_tile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, dynamic>> history = [];
  final TextEditingController messageText = TextEditingController();
  bool loadingHistory = false;

  int _selectedIndex = 0; // def = 0
  final List<Widget> _tabs = [
    PersonList(),
    NewPerson(),
    InfoPage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${AppDetails.appName} ${AppDetails.appVersion}',),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            NavigationRail(
              minWidth: 65,
              minExtendedWidth: 200,
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
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.add_outlined),
                  selectedIcon: Icon(Icons.add),
                  label: Text('New'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.info_outline),
                  selectedIcon: Icon(Icons.info),
                  label: Text('Info'),
                ),
              ],
            ),

           //PAGES usar expanded direto aqui
        Expanded(
            child: _tabs[ _selectedIndex])],
        ));
  }
}

//flutter run -d chrome