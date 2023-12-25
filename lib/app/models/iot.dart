class Iots {
  final int id;
  final String code;
  final String weight;

  Iots({
    required this.id,
    required this.code,
    required this.weight,
  });

  factory Iots.fromJson(Map<String, dynamic> json) {
    return Iots(
      id: json['id'],
      code: json['code'],
      weight: json['weight'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "code": code,
      "weight": weight,
    };
  }
}