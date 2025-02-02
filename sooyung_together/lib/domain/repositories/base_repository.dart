import 'dart:convert';

import 'package:sooyung_together/domain/repositories/repository_interface.dart';

abstract class BaseRepository<T> extends RepositoryInterface<T> {

  BaseRepository({
    required super.page,
    required super.perPage,
  });

  @override
  Future<T> getItems() async {
    try {
      final response = await dio.get(
        buildUrl(),
        queryParameters: getQueryParameters(),
      );

      dynamic data = response.data;

      // final data = response.data is String
      //     ? jsonDecode(response.data as String)
      //     : response.data;

      return parseData(data);
    } catch (e) {
      throw Exception('데이터를 가져오는데 실패하였습니다.');
    }
  }

  // 각 repository에서 구현할 데이터 파싱 메서드
  T parseData(Map<String, dynamic> data);
}