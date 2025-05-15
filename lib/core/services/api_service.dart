import 'package:dio/dio.dart';

import '../errors/error.dart';
import '../utils/endpoints.dart';

class ApiService {
  final Dio dio;

  ApiService()
    : dio = Dio(
        BaseOptions(
          baseUrl: Endpoints.baseUrl,
          connectTimeout: const Duration(seconds: 20),
          receiveTimeout: const Duration(seconds: 20),
        ),
      ) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['x-api-key'] = 'cbcf2a0dac044a158e1b7f494629951b';
          return handler.next(options);
        },
      ),
    );
  }
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
