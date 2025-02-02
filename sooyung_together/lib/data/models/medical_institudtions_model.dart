class MedicalInstitutionResponse {
  final int currentCount;
  final List<MedicalInstitution> data;
  final int matchCount;
  final int page;
  final int perPage;
  final int totalCount;

  MedicalInstitutionResponse({
    required this.currentCount,
    required this.data,
    required this.matchCount,
    required this.page,
    required this.perPage,
    required this.totalCount,
  });

  factory MedicalInstitutionResponse.fromJson(Map<String, dynamic> json) {
    return MedicalInstitutionResponse(
      currentCount: json['currentCount'] ?? 0,
      data: (json['data'] as List)
          .map((item) => MedicalInstitution.fromJson(item))
          .toList(),
      matchCount: json['matchCount'] ?? 0,
      page: json['page'] ?? 1,
      perPage: json['perPage'] ?? 10,
      totalCount: json['totalCount'] ?? 0,
    );
  }
}

class MedicalInstitution {
  final String name;
  final String phoneNumber;
  final String type;
  final String address;

  MedicalInstitution({
    required this.name,
    required this.phoneNumber,
    required this.type,
    required this.address,
  });

  factory MedicalInstitution.fromJson(Map<String, dynamic> json) {
    return MedicalInstitution(
      name: json['의료기관명'] ?? '',
      phoneNumber: json['의료기관전화번호'] ?? '',
      type: json['의료기관종별'] ?? '',
      address: json['의료기관주소(도로명)'] ?? '',
    );
  }
}

enum TypeOfMedicalInstitution {
  all, // 전체
  hospital, // 병원
  nursingHospital, // 요양병원
  generalHospital, // 종합병원
  clinic, // 의원
  dentalHospital, // 치과병원
  orientalMedicineHospital, // 한방병원
  orientalMedicineClinic; // 한의원

  String get KrName {
    switch (this) {
      case TypeOfMedicalInstitution.all:
        return '전체';
      case TypeOfMedicalInstitution.hospital:
        return '병원';
      case TypeOfMedicalInstitution.nursingHospital:
        return '요양병원';
      case TypeOfMedicalInstitution.generalHospital:
        return '종합병원';
      case TypeOfMedicalInstitution.clinic:
        return '의원';
      case TypeOfMedicalInstitution.dentalHospital:
        return '치과병원';
      case TypeOfMedicalInstitution.orientalMedicineHospital:
        return '한방병원';
      case TypeOfMedicalInstitution.orientalMedicineClinic:
        return '한의원';
    }
  }
}

