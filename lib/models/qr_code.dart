class QrCodeModel {
  final bool success;
  final String message;
  final dynamic data;

  QrCodeModel({required this.success, required this.message, this.data});

  factory QrCodeModel.fromJson(Map<String, dynamic> json) {
    return QrCodeModel(
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
