import 'package:flutter/material.dart';

import '../widgets/tile_pessoa.dart';

class PersonList extends StatefulWidget {


  PersonList({Key? key}) : super(key: key);

  @override
  State<PersonList> createState() => _PersonListState();
}

class _PersonListState extends State<PersonList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0,right: 12),
      child: Card(
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return TilePessoa(
              key: UniqueKey(),
              index: index,
            );
          },
        ),
      ),
    );
  }
}
