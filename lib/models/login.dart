class LoginModel {
  bool success;
  String message;
  String token;
  UserData data;

  LoginModel({
    required this.success,
    required this.message,
    required this.token,
    required this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      token: json['token'] ?? '',
      data: json['data'] != null
          ? UserData.fromJson(json['data'])
          : UserData.empty(),
    );
  }
}

class UserData {
  int id;
  String fullName;
  String role;
  String phone;
  String address;
  String location;
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
      id: json['id'] ?? 0,
      fullName: json['full_name'] ?? '',
      role: json['role'] ?? '',
      phone: json['phone'] ?? '',
      address: json['address'] ?? '',
      location: json['location'] ?? '',
      noKk: json['no_kk'] ?? '',
      profilePicture: json['profile_picture'] ?? '',
    );
  }

  factory UserData.empty() {
    return UserData(
      id: 0,
      fullName: '',
      role: '',
      phone: '',
      address: '',
      location: '',
      noKk: '',
      profilePicture: '',
    );
  }
}
