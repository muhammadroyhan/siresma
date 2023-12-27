class ApiResponse<T> {
  final bool success;
  final String message;
  final T data;

  ApiResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json,
      T Function(Map<String, dynamic>) fromJsonData) {
    return ApiResponse(
      success: json['success'],
      message: json['message'],
      data: fromJsonData(json['data']),
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
