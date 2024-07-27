class UserModel {
  bool success;
  String message;
  UserData data;

  UserModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      success: json['success'],
      message: json['message'],
      data: UserData.fromJson(json['data']),
    );
  }
}

class UserData {
  int id;
  String fullName;
  String role;
  String phone;
  String address;
  String? location;
  String noKk;
  String profilePicture;

  UserData({
    required this.id,
    required this.fullName,
    required this.role,
    required this.phone,
    required this.address,
    required this.location,
    required this.noKk,
    required this.profilePicture,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      fullName: json['full_name'],
      role: json['role'],
      phone: json['phone'],
      address: json['address'],
      location: json['location'] ?? "null lokasi", // Handle nullable location
      noKk: json['no_kk'],
      profilePicture: json['profile_picture'],
    );
  }
}
