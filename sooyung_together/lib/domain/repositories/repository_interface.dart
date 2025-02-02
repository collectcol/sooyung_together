import 'package:dio/dio.dart';
import 'package:sooyung_together/core/network/dio_client.dart';

abstract class RepositoryInterface<T> {
  final Dio dio = DioClient().dio;
  final int page;
  final int perPage;

  RepositoryInterface({
    required this.page,
    required this.perPage,
  });

  String buildUrl();
  Map<String, dynamic> getQueryParameters();
  Future<T> getItems();
}
