class RTModel {
  int id;
  String name;

  RTModel({required this.id, required this.name});

  factory RTModel.fromJson(Map<String, dynamic> json) {
    return RTModel(
      id: json['id'],
      name: json['name'],
    );
  }
}