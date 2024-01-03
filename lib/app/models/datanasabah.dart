class DataNasabah {
  final int id;
  final String fullName;
  final String phone;
  final String noKK;
  final String profilePicture;
  final String address;

  DataNasabah({
    required this.id,
    required this.fullName,
    required this.phone,
    required this.noKK,
    required this.profilePicture,
    required this.address,
  });

  factory DataNasabah.fromJson(Map<String, dynamic> json) {
    return DataNasabah(
      id: json['id'],
      fullName: json['full_name'],
      phone: json['phone'],
      noKK: json['no_kk'],
      profilePicture: json['profile_picture'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'full_name': fullName,
      'phone': phone,
      'no_kk': noKK,
      'profile_picture': profilePicture,
      'address': address,
    };
  }
}
