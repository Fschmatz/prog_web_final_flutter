import 'package:flutter/material.dart';

class TilePessoa extends StatefulWidget {

  int index;
  TilePessoa({Key? key, required this.index}) : super(key: key);

  @override
  State<TilePessoa> createState() => _TilePessoaState();
}

class _TilePessoaState extends State<TilePessoa> {
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

          title: Text('Pessoa ${widget.index}'),
          subtitle: Text('''
-“Hi doggy!”
-“You’re my favourite customer.”
-“Thanks a lot, bye!” '''
          ),
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
