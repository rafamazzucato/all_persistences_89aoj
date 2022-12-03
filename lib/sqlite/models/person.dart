class Person {
  final int? id;
  final String name;
  final String lastName;

  Person(this.name, this.lastName, {this.id});

  Map<String, dynamic> toMap() {
    return {"id": id, "name": name, "lastName": lastName};
  }
}
