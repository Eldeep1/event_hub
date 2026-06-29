import 'package:dio/dio.dart';

class NetworkException implements Exception {
  final String message;
  final int? statusCode;

  NetworkException(this.message, {this.statusCode});

  @override
  String toString() =>
      'NetworkException(statusCode: $statusCode, message: $message)';
}

class NetworkErrors {
  static NetworkException fromDioException(DioException exception) {
    if (exception.type == DioExceptionType.connectionTimeout ||
        exception.type == DioExceptionType.sendTimeout ||
        exception.type == DioExceptionType.receiveTimeout) {
      return NetworkException(
        'Request timed out. Please check your connection.',
      );
    }

    if (exception.type == DioExceptionType.badResponse) {
      final statusCode = exception.response?.statusCode;
      final message = exception.response?.statusMessage ?? 'Server error';
      return NetworkException(message, statusCode: statusCode);
    }

    if (exception.type == DioExceptionType.cancel) {
      return NetworkException('Request was cancelled.');
    }

    if (exception.type == DioExceptionType.badCertificate) {
      return NetworkException('Bad SSL certificate.');
    }

    return NetworkException(exception.message ?? 'Unexpected network error.');
  }

  static NetworkException unexpected(Object error) {
    return NetworkException('Unexpected network error: $error');
  }
}
