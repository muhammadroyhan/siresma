class Location {
  final int id;
  final String name;
  final String description;

  Location({required this.id, required this.name, required this.description});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }
}
