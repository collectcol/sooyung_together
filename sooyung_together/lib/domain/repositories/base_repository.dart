import 'package:sooyung_together/domain/repositories/repository_interface.dart';

abstract class BaseRepository<T> extends RepositoryInterface<T> {
  final String dataKey;

  BaseRepository({
    required super.page,
    required super.perPage,
    required this.dataKey,
  });

  @override
  Future<List<T>> getItems() async {
    try {
      final response = await dio.get(
        buildUrl(),
        queryParameters: getQueryParameters(),
      );
      totalCount = response.data['totalCount'];
      final List<dynamic> data = response.data[dataKey];
      return parseData(data);
    } catch (e) {
      throw Exception('데이터를 가져오는데 실패하였습니다.');
    }
  }

  // 각 repository에서 구현할 데이터 파싱 메서드
  List<T> parseData(List<dynamic> data);
}