import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:teste_web/classes/person.dart';
import '../widgets/person_tile.dart';
import 'dart:convert';

class PersonList extends StatefulWidget {
  PersonList({Key? key}) : super(key: key);

  @override
  State<PersonList> createState() => _PersonListState();
}

class _PersonListState extends State<PersonList> {
  bool loading = true;

  String urlJson = 'http://api.icndb.com/jokes/random'; // 1
  //String urlJson = 'http://api.icndb.com/jokes/random/10'; // various

  List<Person> personList = [];
  Person person = Person(name: '');

  @override
  void initState() {
    loadJsonData();
    super.initState();
  }

  Future<void> loadJsonData() async {
    final response = await http.get(Uri.parse(urlJson));
    if (response.statusCode == 200) {
      //Person p = Person.fromJson(jsonDecode(response.body));
      final parsed = json.decode(response.body).cast<String, dynamic>();
      //List<Person> listJson = Person.fromJson(parsed) as List<Person>;
      Person x = Person.fromJson(parsed);


      setState(() {
        person = x;
        //personList = listJson;
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 12),
      child: Card(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 600),
          child: (loading)
              ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Loading...',style: TextStyle(fontSize: 18),),
                  SizedBox(height: 20,),
                  CircularProgressIndicator(),
                ],
              )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,//personList.length,
                  itemBuilder: (context, index) {
                    return PersonTile(
                      key: UniqueKey(),
                      index: index,
                      person: Person(
                          //name: personList[index].name
                          name: person.name
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
