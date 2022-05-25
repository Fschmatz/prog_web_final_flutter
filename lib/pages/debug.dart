import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DebugPage extends StatefulWidget {
  @override
  _DebugPageState createState() => _DebugPageState();

  DebugPage({Key? key}) : super(key: key);
}

class _DebugPageState extends State<DebugPage> {


  @override
  Widget build(BuildContext context) {
    Color themeColorApp = Theme.of(context).colorScheme.primary;

    return  ListView(
      children: <Widget>[
        Card(
          elevation: 1,
          margin: const EdgeInsets.fromLTRB(16, 20, 16, 25),
          color: themeColorApp,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: const ListTile(
            title:  Text(
              "Olá",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17.5, color: Colors.black),
            ),
          ),
        ),

      ],
    );
  }
}
