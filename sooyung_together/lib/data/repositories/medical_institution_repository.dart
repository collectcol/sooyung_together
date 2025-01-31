import 'package:dio/dio.dart';
import 'package:sooyung_together/core/constants/api_endpoints.dart';
import 'package:sooyung_together/data/models/status_medical_institudtions_model.dart';

import '../../core/network/dio_client.dart';

class MedicalRepository {
  final Dio _dio = DioClient().dio;

  Future<List<MedicalInstitution>> getMedicalInstitutions() async {
    try {
      final response = await _dio.get(ApiEndpoints.baseURL + ApiEndpoints.authKey,
      queryParameters: {
        'serviceKey': ApiEndpoints.medicalInstitutions,
        'page': 1,
        'perPage': 10,
      });
      final List<dynamic> data = response.data['data'];
      return data.map((json) => MedicalInstitution.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch medical institutions');
    }
  }
}