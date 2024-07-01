class HomeModel {
  bool success;
  String message;
  HomeData data;

  HomeModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      success: json['success'],
      message: json['message'],
      data: HomeData.fromJson(json['data']),
    );
  }
}

class HomeData {
  final int id;
  final String name;
  final String description;

  HomeData({
    required this.id,
    required this.name,
    required this.description,
  });

  factory HomeData.fromJson(Map<String, dynamic> json) {
    return HomeData(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }
}
