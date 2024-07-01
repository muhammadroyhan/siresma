class DataNasabahResponse {
  final bool success;
  final String message;
  final List<DataNasabah> data;

  DataNasabahResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory DataNasabahResponse.fromJson(Map<String, dynamic> json) {
    var dataList = json['data'] as List;
    List<DataNasabah> nasabahList = dataList.map((i) => DataNasabah.fromJson(i)).toList();

    return DataNasabahResponse(
      success: json['success'],
      message: json['message'],
      data: nasabahList,
    );
  }
}

class DataNasabah {
  final int id;
  final String fullName;
  final String profilePicture;
  final String phone;

  DataNasabah({
    required this.id,
    required this.fullName,
    required this.profilePicture,
    required this.phone,
  });

  factory DataNasabah.fromJson(Map<String, dynamic> json) {
    return DataNasabah(
      id: json['id'],
      fullName: json['full_name'],
      profilePicture: json['profile_picture'],
      phone: json['phone'],
    );
  }
}


