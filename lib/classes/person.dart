import 'package:dynamic_value/dynamic_value.dart';

class Person {
  final String name;


  Person(
      {required this.name,

      });

  factory Person.fromJson(Map<String, dynamic> json) {
    final value = DynamicValue(json);

    return Person(
      name: value['value']["joke"].toString(),
    );
  }

  @override
  String toString() {
    return 'Person{name: $name}';
  }
}
