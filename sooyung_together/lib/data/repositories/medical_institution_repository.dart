import 'package:sooyung_together/core/constants/api_endpoints.dart';
import 'package:sooyung_together/data/models/medical_institudtions_model.dart';
import 'package:sooyung_together/domain/repositories/base_repository.dart';

class MedicalInstitutionRepository extends BaseRepository<MedicalInstitutionResponse> {
  final TypeOfMedicalInstitution? type;

  MedicalInstitutionRepository({
    required super.page,
    required super.perPage,
    this.type,
  });

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
  MedicalInstitutionResponse parseData(Map<String, dynamic> data) {
    var response = MedicalInstitutionResponse.fromJson(data);

    // 타입 필터링이 필요한 경우
    if (type != null && type != TypeOfMedicalInstitution.all) {
      final filteredData = response.data
          .where((inst) => inst.type == type?.KrName)
          .toList();

      return MedicalInstitutionResponse(
        currentCount: filteredData.length,
        data: filteredData,
        matchCount: response.matchCount,
        page: response.page,
        perPage: response.perPage,
        totalCount: response.totalCount,
      );
    }

    return response;
  }
}
