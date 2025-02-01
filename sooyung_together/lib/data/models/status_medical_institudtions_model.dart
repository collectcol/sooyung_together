class MedicalInstitution {
  final String name;
  final String phoneNumber;
  final String type;
  final String address;
  final int totalCount;

  MedicalInstitution({
    required this.name,
    required this.phoneNumber,
    required this.type,
    required this.address,
    required this.totalCount,
  });

  factory MedicalInstitution.fromJson(Map<String, dynamic> json) {
    return MedicalInstitution(
      name: json['의료기관명'] ?? '',
      phoneNumber: json['의료기관전화번호'] ?? '',
      type: json['의료기관종별'] ?? '',
      address: json['의료기관주소(도로명)'] ?? '',
      totalCount: json['totalCount'] ?? 0,
    );
  }
}

enum TypeOfMedicalInstitution {
  all, // 전체
  hospital, // 병원
  nursing_hospital, // 요양병원
  general_hospital, // 종합병원
  clinic, // 의원
  dental_hospital, // 치과병원
  oriental_medicine_hospital, // 한방병원
  oriental_medicine_clinic; // 한의원

  String get KrName {
    switch (this) {
      case TypeOfMedicalInstitution.all:
        return '전체';
      case TypeOfMedicalInstitution.hospital:
        return '병원';
      case TypeOfMedicalInstitution.nursing_hospital:
        return '요양병원';
      case TypeOfMedicalInstitution.general_hospital:
        return '종합병원';
      case TypeOfMedicalInstitution.clinic:
        return '의원';
      case TypeOfMedicalInstitution.dental_hospital:
        return '치과병원';
      case TypeOfMedicalInstitution.oriental_medicine_hospital:
        return '한방병원';
      case TypeOfMedicalInstitution.oriental_medicine_clinic:
        return '한의원';
    }
  }
}

