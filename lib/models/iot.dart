class IotModel {
  final bool success;
  final String message;
  final dynamic data;

  IotModel({required this.success, required this.message, this.data});

  factory IotModel.fromJson(Map<String, dynamic> json) {
    return IotModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['data'] = this.data;
    return data;
  }
}
