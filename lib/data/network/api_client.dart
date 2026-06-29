import 'package:dio/dio.dart';
import 'network_constants.dart';
import 'network_errors.dart';

class ApiClient {
  final Dio dio;

  ApiClient({Dio? dio}) : dio = dio ?? _createDio();

  static Dio _createDio() {
    final options = BaseOptions(
      baseUrl: NetworkConstants.baseUrl,
      connectTimeout: NetworkConstants.connectTimeout,
      receiveTimeout: NetworkConstants.receiveTimeout,
      responseType: ResponseType.json,
      headers: {'Accept': 'application/json'},
    );

    final client = Dio(options);
    client.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        responseHeader: false,
        responseBody: true,
        error: true,
      ),
    );
    return client;
  }

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioException catch (error) {
      throw NetworkErrors.fromDioException(error);
    } catch (error) {
      throw NetworkErrors.unexpected(error);
    }
  }
}
