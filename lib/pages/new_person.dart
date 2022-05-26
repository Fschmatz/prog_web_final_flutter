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
  FocusNode focusEmail= FocusNode();

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
              borderRadius: BorderRadius.circular(25.0),
            ))),
            onPressed: () {},
            icon: const Icon(
              Icons.save_outlined,
              size: 24,
              color: Colors.black,
            ),
            label: const Text(
              'Save',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 50,
      ),
    ]);
  }
}
