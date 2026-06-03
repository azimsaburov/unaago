import 'package:dio/dio.dart';

/// Базовый клиент для работы с сетевыми запросами.
///
/// Использует библиотеку [Dio] для выполнения HTTP-запросов.
/// Здесь настраиваются базовые параметры: URL, таймауты и интерцепторы.
class NetworkClient {
  final Dio _dio;

  NetworkClient({required String baseUrl})
      : _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            connectTimeout: const Duration(seconds: 15),
            receiveTimeout: const Duration(seconds: 15),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          ),
        ) {
    _addInterceptors();
  }

  /// Добавление интерцепторов для логирования и обработки ошибок.
  void _addInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Здесь можно добавить токен авторизации
          return handler.next(options);
        },
        onError: (DioException e, handler) {
          // Глобальная обработка ошибок (например, 401 Unauthorized)
          return handler.next(e);
        },
      ),
    );
  }

  Dio get dio => _dio;
}
