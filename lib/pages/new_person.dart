import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class NewPerson extends StatefulWidget {
  @override
  _NewPersonState createState() => _NewPersonState();

  //Function()? refreshHome;

  NewPerson({Key? key}) : super(key: key);
}

class _NewPersonState extends State<NewPerson> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerCidade = TextEditingController();
  TextEditingController controllerCpf = TextEditingController();
  TextEditingController controllerRua = TextEditingController();

  bool _validTitle = true;
  bool _validLink = true;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _savePlaylist() async {

  }

  bool validateTextFields() {
    String errors = "";
    if (controllerRua.text.isEmpty) {
      errors += "Link";
      _validLink = false;
    }
    if (controllerName.text.isEmpty) {
      errors += "Title";
      _validTitle = false;
    }
    return errors.isEmpty ? true : false;
  }

  void _loseFocus() {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [

      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: TextField(
          autofocus: true,
          minLines: 1,
          maxLines: 4,
          maxLength: 500,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          textCapitalization: TextCapitalization.sentences,
          keyboardType: TextInputType.name,
          controller: controllerRua,
          decoration: InputDecoration(
              labelText: "Link",
              helperText: "* Required",
              counterText: "",
              errorText: (_validLink) ? null : "Link is empty"),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: TextField(
          minLines: 1,
          maxLines: 3,
          maxLength: 300,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          textCapitalization: TextCapitalization.sentences,
          keyboardType: TextInputType.name,
          controller: controllerName,
          decoration: InputDecoration(
              labelText: "Title",
              helperText: "* Required",
              counterText: "",
              errorText: (_validTitle) ? null : "Title is empty"),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: TextField(
          minLines: 1,
          maxLines: 2,
          maxLength: 300,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          textCapitalization: TextCapitalization.sentences,
          keyboardType: TextInputType.name,
          controller: controllerCidade,
          decoration: const InputDecoration(
            labelText: "Artist",
            counterText: "",
          ),
        ),
      ),

      const SizedBox(
        height: 50,
      ),
    ]);
  }
}
