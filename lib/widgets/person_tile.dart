import 'package:flutter/material.dart';

import '../classes/person.dart';

class PersonTile extends StatefulWidget {

  int index;
  Person person;
  PersonTile({Key? key, required this.index, required this.person}) : super(key: key);

  @override
  State<PersonTile> createState() => _PersonTileState();
}

class _PersonTileState extends State<PersonTile> {
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
          minVerticalPadding: 10,

          onTap: () {},

          title: Text('Joke ${widget.index}'),
          subtitle: Text(widget.person.name),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  icon: const Icon(
                    Icons.edit_outlined,
                    size: 20,
                  ),
                  onPressed: () {

                  }),
              const SizedBox(
                width: 8,
              ),
              IconButton(
                  icon: const Icon(
                    Icons.delete_outlined,
                    size: 20,
                  ),
                  onPressed: () {

                  }),
            ],
          ),
        ),
      ),
    );
  }
}
