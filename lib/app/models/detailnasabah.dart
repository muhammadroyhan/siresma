class DetailDataNasabah {
  final int user_id;
  final int id;
  final String fullName;
  final String profilePicture;
  final String address;
  final String noKK;
  final String phone;

  DetailDataNasabah({
    required this.user_id,
    required this.id,
    required this.fullName,
    required this.profilePicture,
    required this.address,
    required this.noKK,
    required this.phone,
  });

  factory DetailDataNasabah.fromJson(Map<String, dynamic> json) {
    return DetailDataNasabah(
      user_id: json['user_id'] as int? ?? 0, // Default value if null
      id: json['id'] as int? ?? 0, // Default value if null
      fullName: json['full_name'] as String? ?? '', // Default value if null
      profilePicture:
          json['profile_picture'] as String? ?? '', // Default value if null
      address: json['address'] as String? ?? '', // Default value if null
      noKK: json['no_kk'] as String? ?? '', // Default value if null
      phone: json['phone'] as String? ?? '', // Default value if null
    );
  }
}

class ListDetailDatanasabah {
  static int? user_id;
  static int? id;
  static String? full_name;
  static String? role;
  static String? phone;
  static String? address;
  static String? location;
  static String? no_kk;
}
