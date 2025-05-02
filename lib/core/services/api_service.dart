import 'package:dio/dio.dart';

import '../errors/error.dart';

class ApiService {
  final Dio dio;

  ApiService({required this.dio});
  Future<Map<String, dynamic>> getMapData({required String endPoint}) async {
    try {
      final res = await dio.get(endPoint);
      if (res.statusCode == 200) {
        return res.data as Map<String, dynamic>;
      } else {
        throw Exception('Unexpected status code: ${res.statusCode}');
      }
    } on DioException catch (dioError) {
      throw ServerFailure.fromDioException(dioError);
    }
  }

}
