import 'package:dio/dio.dart';
import 'package:sooyung_together/core/constants/api_endpoints.dart';
import 'package:sooyung_together/data/models/status_medical_institudtions_model.dart';

import '../../core/network/dio_client.dart';

class MedicalRepository {
  final Dio _dio = DioClient().dio;
  final int page;
  final int perPage;
  int totalCount = 0;

  MedicalRepository({
    required this.page,
    required this.perPage,
  });

  String buildUrl() {
    return ApiEndpoints.baseURL + ApiEndpoints.medicalInstitutions;
  }

  Map<String, dynamic> getQueryParameters() {
    return {
      'page': page,
      'perPage': perPage,
      'serviceKey': ApiEndpoints.authKeyDecoding,
    };
  }

  Future<List<MedicalInstitution>> getMedicalInstitutions() async {
    try {
      final response = await _dio.get(
        buildUrl(),
        queryParameters: getQueryParameters(),
      );
      totalCount = response.data['totalCount'];
      final List<dynamic> data = response.data['data'];
      return data.map((json) => MedicalInstitution.fromJson(json)).toList();
    } catch (e) {
      throw Exception('데이터를 가져오는데 실패하였습니다.');
    }
  }
}
