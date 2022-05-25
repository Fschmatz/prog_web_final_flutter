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
  TextEditingController controllerCpf = TextEditingController();
  TextEditingController controllerAddress = TextEditingController();
  TextEditingController controllerCity = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();

  bool _validCpf = true;
  bool _validName = true;
  bool _validPhone = true;
  bool _validEmail = true;

  @override
  void initState() {
    super.initState();
  }

  bool validateTextFields() {
    String errors = "";
    if (controllerName.text.isEmpty) {
      errors += "Name";
      _validCpf = false;
    }
    if (controllerEmail.text.isEmpty) {
      errors += "Email";
      _validName = false;
    }
    if (controllerPhone.text.isEmpty) {
      errors += "Phone";
      _validName = false;
    }
    if (controllerCpf.text.isEmpty) {
      errors += "Cpf";
      _validName = false;
    }
    return errors.isEmpty ? true : false;
  }

  @override
  Widget build(BuildContext context) {

    double width, height;
    width = MediaQuery.of(context).size.width * 0.33;
    height = MediaQuery.of(context).size.height * 0.07;

    return ListView(
        children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: TextField(
          autofocus: true,
          minLines: 1,
          maxLines: 2,
          maxLength: 150,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          textCapitalization: TextCapitalization.sentences,
          keyboardType: TextInputType.name,
          controller: controllerAddress,
          decoration: InputDecoration(
              labelText: "Name",
              helperText: "* Required",
              counterText: "",
              errorText: (_validName) ? null : "Name is empty"),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: TextField(
          minLines: 1,
          maxLines: 1,
          maxLength: 15,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          textCapitalization: TextCapitalization.sentences,
          keyboardType: TextInputType.name,
          controller: controllerName,
          decoration: InputDecoration(
              labelText: "Cpf",
              helperText: "* Required",
              counterText: "",
              errorText: (_validCpf) ? null : "Cpf is empty"),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: TextField(
          minLines: 1,
          maxLines: 1,
          maxLength: 20,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          textCapitalization: TextCapitalization.sentences,
          keyboardType: TextInputType.name,
          controller: controllerPhone,
          decoration: InputDecoration(
              labelText: "Phone",
              helperText: "* Required",
              counterText: "",
              errorText: (_validPhone) ? null : "Phone is empty"),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: TextField(
          minLines: 1,
          maxLines: 1,
          maxLength: 100,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          textCapitalization: TextCapitalization.sentences,
          keyboardType: TextInputType.name,
          controller: controllerEmail,
          decoration: InputDecoration(
              labelText: "Email",
              helperText: "* Required",
              counterText: "",
              errorText: (_validEmail) ? null : "Email is empty"),
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
          controller: controllerAddress,
          decoration: const InputDecoration(
            labelText: "Adress",
            counterText: "",
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: TextField(
          minLines: 1,
          maxLines: 1,
          maxLength: 150,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          textCapitalization: TextCapitalization.sentences,
          keyboardType: TextInputType.name,
          controller: controllerCity,
          decoration: const InputDecoration(
            labelText: "City",
            counterText: "",
          ),
        ),
      ),
      const SizedBox(
        height: 25,
      ),
    SizedBox(
    height: height,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width,),
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(
            Icons.save_outlined,
            size: 24,
            color: Colors.black87,
          ),
          label: const Text('Save',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),),
        ),
      ),
    ),
      const SizedBox(
        height: 50,
      ),
    ]);
  }
}
