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