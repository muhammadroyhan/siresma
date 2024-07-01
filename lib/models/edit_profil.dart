class EditProfilModel {
  final bool success;
  final String message;
  final int data;

  EditProfilModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory EditProfilModel.fromJson(Map<String, dynamic> json) {
    return EditProfilModel(
      success: json['success'],
      message: json['message'],
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
