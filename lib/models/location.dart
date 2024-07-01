class Location {
  final int id;
  final String name;
  final int rt;
  final int rw;
  final String description;

  Location({
    required this.id,
    required this.name,
    required this.rt,
    required this.rw,
    required this.description,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'],
      name: json['name'],
      rt: json['rt'],
      rw: json['rw'],
      description: json['description'],
    );
  }
}
