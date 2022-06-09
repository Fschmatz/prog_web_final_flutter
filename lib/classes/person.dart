import 'package:dynamic_value/dynamic_value.dart';

class Person {
  final String id;
  final String name;
  final String cpf;
  final String phone;
  final String email;
  final String address;
  final String city;

  Person({
    required this.id,
    required this.name,
    required this.cpf,
    required this.phone,
    required this.email,
    required this.address,
    required this.city,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    final value = DynamicValue(json);
    return Person(
      id: value["id"].toString(),
      name: value["name"].toString(),
      cpf: value["cgc"].toString(),
      phone: value["phone"].toString(),
      email: value["email"].toString(),
      address: value["address"].toString(),
      city: value["city"].toString(),
    );
  }

}
