class DetailNasabahModel {
  final int id;
  final String fullName;
  final String phone;
  final String address;
  final String profilePicture;
  final String noKk;

  DetailNasabahModel({
    required this.id,
    required this.fullName,
    required this.phone,
    required this.address,
    required this.profilePicture,
    required this.noKk,
  });

  factory DetailNasabahModel.fromJson(Map<String, dynamic> json) {
    return DetailNasabahModel(
      id: json['data']['id'],
      fullName: json['data']['full_name'],
      phone: json['data']['phone'],
      address: json['data']['address'],
      profilePicture: json['data']['profile_picture'],
      noKk: json['data']['no_kk'],
    );
  }
}
