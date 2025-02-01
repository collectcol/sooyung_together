import 'package:sooyung_together/core/constants/api_endpoints.dart';
import 'package:sooyung_together/data/models/status_famous_restaurant_model.dart';

import '../../domain/repositories/base_repository.dart';

class FamousRestaurantRepository extends BaseRepository<FamousRestaurant> {
  FamousRestaurantRepository({
    required super.page,
    required super.perPage,
  }) : super(dataKey: 'item');

  @override
  String buildUrl() {
    return ApiEndpoints.famousRestaurant;
  }

  @override
  Map<String, dynamic> getQueryParameters() {
    return {
      'pageNo': page,
      'numOfRows': perPage,
      'serviceKey': ApiEndpoints.authKeyDecoding,
    };
  }

  @override
  List<FamousRestaurant> parseData(List<dynamic> data) {
    return data.map((json) => FamousRestaurant.fromJson(json)).toList();
  }
}
