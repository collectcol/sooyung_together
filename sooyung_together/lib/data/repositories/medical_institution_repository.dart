import 'package:sooyung_together/core/constants/api_endpoints.dart';
import 'package:sooyung_together/data/models/status_medical_institudtions_model.dart';
import 'package:sooyung_together/domain/repositories/base_repository.dart';

class MedicalInstitutionRepository extends BaseRepository<MedicalInstitution> {

  MedicalInstitutionRepository({
    required super.page,
    required super.perPage,
  }) : super(dataKey: 'data');

  @override
  String buildUrl() {
    return ApiEndpoints.medicalInstitutions;
  }

  @override
  Map<String, dynamic> getQueryParameters() {
    return {
      'page': page,
      'perPage': perPage,
      'serviceKey': ApiEndpoints.authKeyDecoding,
    };
  }

  @override
  List<MedicalInstitution> parseData(List<dynamic> data) {
    return data.map((json) => MedicalInstitution.fromJson(json)).toList();
  }
}
