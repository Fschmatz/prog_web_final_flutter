import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:teste_web/pages/edit_person.dart';
import '../classes/person.dart';

class PersonTile extends StatefulWidget {
  int index;
  Person person;
  Function() refreshPersonList;

  PersonTile({Key? key, required this.index, required this.person, required this.refreshPersonList})
      : super(key: key);

  @override
  State<PersonTile> createState() => _PersonTileState();
}

class _PersonTileState extends State<PersonTile> {

  String urlApi = 'http://app.gsoftwares.com.br:3000/clients/';

  Future<void> deletePerson() async {
    final response = await http.delete(
      Uri.parse(urlApi + widget.person.id),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      print('Delete OK');
    } else {
      throw Exception('Fail - Status Code ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Card(
        child: ListTile(
          tileColor: Theme.of(context).dialogTheme.backgroundColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          leading: const Icon(Icons.person_outline),
          minVerticalPadding: 16,
          onTap: () {},
          title: Text(widget.person.name, style: const TextStyle(fontSize: 18),),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
               widget.person.formattedInfo(widget.person).trim(),
              style: const TextStyle(fontSize: 15),
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  icon: const Icon(
                    Icons.edit_outlined,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => EditPerson(
                            refreshHome: widget.refreshPersonList,
                            person: Person(
                              id: widget.person.id,
                              name:  widget.person.name,
                              cpf:  widget.person.cpf,
                              phone:  widget.person.phone,
                              email:  widget.person.email,
                              address:  widget.person.address,
                              city:  widget.person.city,
                            ),
                          ),
                        ));
                  }),
              const SizedBox(
                width: 20,
              ),
              IconButton(
                  icon: const Icon(
                    Icons.delete_outlined,
                  ),
                  onPressed: () {
                    deletePerson().then((v) => widget.refreshPersonList());
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
