import 'package:dynamic_value/dynamic_value.dart';

class Person {
  final String name;
  final String cpf;
  final String phone;
  final String email;
  final String address;
  final String city;

  Person({
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
      name: value["name"].toString(),
      cpf: value["animal_type"].toString(),
      phone: value["weight_max"].toString(),
      email: value["length_max"].toString(),
      address: value["geo_range"].toString(),
      city: value["lifespan"].toString(),
    );
  }

}
