import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../util/app_details.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();

  InfoPage({Key? key}) : super(key: key);
}

class _InfoPageState extends State<InfoPage> {

_launchGithub() {
    launchUrl(
      Uri.parse(AppDetails.repositoryLink),
      mode: LaunchMode.externalApplication,
    );
  }

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
          child: ListTile(
            title:  Text(
              '${AppDetails.appName} ${AppDetails.appVersion}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 17.5, color: Colors.black),
            ),
          ),
        ),


        ListTile(
          title: Text("Alunos",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.primary,
              )),
        ),
        const ListTile(
          leading:  Icon(
            Icons.person_outlined,
          ),
          title:  Text(
            "Fernando J. Schmatz",
            style: TextStyle(fontSize: 16),
          ),
        ),
        const ListTile(
          leading:  Icon(
            Icons.person_outlined,
          ),
          title:  Text(
            'Gustavo Steinhoefel',
            style: TextStyle(fontSize: 16),
          ),
        ),
        ListTile(
          title: Text("Source Code",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: themeColorApp)),
        ),
        ListTile(
          onTap: () {
            _launchGithub();
          },
          leading: const Icon(Icons.open_in_new_outlined),
          title: const Text("View Source Code on GitHub",
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.blue)),
        ),
      ],
    );
  }
}
