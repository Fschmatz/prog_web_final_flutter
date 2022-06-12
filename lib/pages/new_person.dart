import 'dart:convert';

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

  FocusNode focusName = FocusNode();
  FocusNode focusCpf = FocusNode();
  FocusNode focusAddress = FocusNode();
  FocusNode focusCity = FocusNode();
  FocusNode focusPhone = FocusNode();
  FocusNode focusEmail = FocusNode();

  bool _validCpf = true;
  bool _validName = true;
  bool _validPhone = true;
  bool _validEmail = true;

  @override
  void initState() {
    super.initState();
  }

  makePostRequest() async {
    //CGC UNICO
    Map<String, dynamic> body = {
      "name": controllerName.text,
      "cgc": controllerCpf.text,
      "phone": controllerPhone.text,
      "email": controllerEmail.text,
      "address": controllerAddress.text,
      "city": controllerCity.text,
    };
    String jsonBody = json.encode(body);
    final response = await http.post(
      Uri.parse('http://app.gsoftwares.com.br:3000/clients'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonBody,
    );
    if (response.statusCode == 200) {
      print('Post OK');
      controllerName.clear();
      controllerCpf.clear();
      controllerPhone.clear();
      controllerEmail.clear();
      controllerAddress.clear();
      controllerCity.clear();
      _showSnackBar();
    } else {
      throw Exception('Fail - Status Code ${response.statusCode}');
    }
  }

  void _showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        margin: EdgeInsets.only(left: 200,right: 200, bottom: 50),
        content: Text("Save OK"),
      ),
    );
  }

  bool validateTextFields() {
    bool ok = true;
    if (controllerName.text.isEmpty) {
      _validName = false;
      ok = false;
    }
    if (controllerEmail.text.isEmpty) {
      _validEmail = false;
      ok = false;
    }
    if (controllerPhone.text.isEmpty) {
      _validPhone = false;
      ok = false;
    }
    if (controllerCpf.text.isEmpty) {
      _validCpf = false;
      ok = false;
    }
    return ok;
  }

  @override
  Widget build(BuildContext context) {
    double width, height;
    width = MediaQuery.of(context).size.width * 0.33;
    height = MediaQuery.of(context).size.height * 0.07;

    return ListView(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: TextField(
          minLines: 1,
          maxLines: 1,
          maxLength: 150,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          focusNode: focusName,
          onEditingComplete: () => focusCpf.requestFocus(),
          controller: controllerName,
          decoration: InputDecoration(
              labelText: "Name",
              helperText: "* Required",
              counterText: "",
              errorText: (_validName) ? null : "Name is empty"),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: TextField(
          minLines: 1,
          maxLines: 1,
          maxLength: 15,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          textInputAction: TextInputAction.next,
          onEditingComplete: () => focusPhone.requestFocus(),
          focusNode: focusCpf,
          controller: controllerCpf,
          decoration: InputDecoration(
              labelText: "Cpf",
              helperText: "* Required",
              counterText: "",
              errorText: (_validCpf) ? null : "Cpf is empty"),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: TextField(
          minLines: 1,
          maxLines: 1,
          maxLength: 20,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          onSubmitted: (_) => focusEmail.requestFocus(),
          focusNode: focusPhone,
          controller: controllerPhone,
          decoration: InputDecoration(
              labelText: "Phone",
              helperText: "* Required",
              counterText: "",
              errorText: (_validPhone) ? null : "Phone is empty"),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: TextField(
          minLines: 1,
          maxLines: 1,
          maxLength: 100,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          focusNode: focusEmail,
          controller: controllerEmail,
          onSubmitted: (_) => focusAddress.requestFocus(),
          decoration: InputDecoration(
              labelText: "Email",
              helperText: "* Required",
              counterText: "",
              errorText: (_validEmail) ? null : "Email is empty"),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: TextField(
          minLines: 1,
          maxLines: 1,
          maxLength: 300,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          focusNode: focusAddress,
          controller: controllerAddress,
          onSubmitted: (_) => focusCity.requestFocus(),
          decoration: const InputDecoration(
            labelText: "Address",
            counterText: "",
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        child: TextField(
          minLines: 1,
          maxLines: 1,
          maxLength: 150,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          focusNode: focusCity,
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
          padding: EdgeInsets.symmetric(
            horizontal: width,
          ),
          child: ElevatedButton.icon(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ))),
            onPressed: () {
              if (validateTextFields()) {
                makePostRequest();
                //caso haja alguma campo q apresentou erro antes
                setState(() {
                  _validCpf = true;
                  _validEmail= true;
                  _validPhone= true;
                  _validName= true;
                });
              } else {
                //show errors
                setState(() {
                  _validCpf;
                  _validEmail;
                  _validPhone;
                  _validName;
                });
              }
            },
            icon: const Icon(
              Icons.save_outlined,
              color: Colors.black87,
            ),
            label: const Text(
              'Save',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
    ]);
  }
}
