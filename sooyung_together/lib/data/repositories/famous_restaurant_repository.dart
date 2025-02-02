import 'package:flutter/rendering.dart';
import 'package:sooyung_together/core/constants/api_endpoints.dart';
import 'package:sooyung_together/data/models/famous_restaurant_model.dart';

import '../../domain/repositories/base_repository.dart';

class FamousRestaurantRepository
    extends BaseRepository<FamousRestaurantResponse> {
  final LanguageType language;

  FamousRestaurantRepository({
    required super.page,
    required super.perPage,
    this.language = LanguageType.korean,
  });

  @override
  Future<FamousRestaurantResponse> getItems() async {
    try {
      final response = await dio.get(
        buildUrl(),
        queryParameters: getQueryParameters(),
      );

      debugPrint('API Response: ${response.data}');  // API 응답 확인
      return parseData(response.data);
    } catch (e) {
      debugPrint('API Error: $e');  // 에러 로깅
      rethrow;
    }
  }

  @override
  String buildUrl() {
    switch (language) {
      case LanguageType.korean:
        return ApiEndpoints.famousRestaurantKr;
      case LanguageType.english:
        return ApiEndpoints.famousRestaurantEn;
    }
  }

  @override
  Map<String, dynamic> getQueryParameters() {
    return {
      'pageNo': page,
      'numOfRows': perPage,
      'resultType': 'json',
      'serviceKey': ApiEndpoints.authKeyDecoding,
    };
  }

  @override
  FamousRestaurantResponse parseData(Map<String, dynamic> data) {
    var response = FamousRestaurantResponse.fromJson(data);

    return response;
  }
}
