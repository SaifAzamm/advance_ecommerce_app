import 'package:ass_ecommerce_app/core/api/dio_interceptor.dart';
import 'package:ass_ecommerce_app/core/api/isolate_parser.dart';
import 'package:ass_ecommerce_app/core/error/failure.dart';
import 'package:ass_ecommerce_app/core/helper/get_storage_helper.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

typedef ResponseConverter<T> = T Function(dynamic response);

class DioClient {
  String baseUrl = const String.fromEnvironment("BASE_URL");

  String? _auth;
  bool _isUnitTest = false;
  late Dio _dio;

  DioClient({bool isUnitTest = false}) {
    _isUnitTest = isUnitTest;

    try {
      _auth = box.read('token');
    } catch (_) {}

    _dio = _createDio();

    if (!_isUnitTest) _dio.interceptors.add(DioInterceptor());
  }

  Dio get dio {
    if (_isUnitTest) {
      /// Return static dio if is unit test
      return _dio;
    } else {
      /// We need to recreate dio to avoid token issue after login
      try {
        _auth = box.read('token');
      } catch (_) {}

      final dio = _createDio();

      if (!_isUnitTest) dio.interceptors.add(DioInterceptor());

      return dio;
    }
  }

  Dio _createDio() => Dio(
        BaseOptions(
          baseUrl: baseUrl,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            if (_auth != null) ...{
              'Authorization': "Bearer $_auth",
            },
          },
          receiveTimeout: const Duration(minutes: 1),
          connectTimeout: const Duration(minutes: 1),
          validateStatus: (int? status) {
            return status! > 0;
          },
        ),
      );

  /// GET request with support for Isolate parsing and List response handling.
  Future<Either<Failure, T>> getRequest<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    required ResponseConverter<T> converter,
    dynamic data,
    bool isIsolate = true,
  }) async {
    try {
      final response = await dio.get(
        url,
        queryParameters: queryParameters,
      );

      if ((response.statusCode ?? 0) < 200 ||
          (response.statusCode ?? 0) > 299) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }

      final responseData = response.data;

      if (!isIsolate) {
        return Right(converter(responseData));
      }

      if (responseData is Map<String, dynamic>) {
        // Isolate parsing for Map response
        final isolateParse = IsolateParser<T>(responseData, converter);
        final result = await isolateParse.parseInBackground();
        return Right(result);
      } else if (responseData is List) {
        // Handle List response directly without isolate
        return Right(converter(responseData));
      } else {
        throw FormatException('Unexpected response format.');
      }
    } on DioException catch (e) {
      return Left(
        ServerFailure(
          e.response?.data['message'] as String? ?? e.message,
        ),
      );
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }

  ///Post request
  Future<Either<Failure, T>> postRequest<T>(
    String url, {
    dynamic data,
    required ResponseConverter<T> converter,
    bool isIsolate = true,
  }) async {
    try {
      final response = await dio.post(url, data: data);
      if ((response.statusCode ?? 0) < 200 ||
          (response.statusCode ?? 0) > 201) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }

      if (!isIsolate) {
        return Right(converter(response.data));
      }
      final isolateParse = IsolateParser<T>(
        response.data as Map<String, dynamic>,
        converter,
      );
      final result = await isolateParse.parseInBackground();
      return Right(result);
    } on DioException catch (e) {
      return Left(
        ServerFailure(
          e.response?.data['message'] as String? ?? e.message,
        ),
      );
    }
  }

  ///Put request
  Future<Either<Failure, T>> putRequest<T>(
    String url, {
    dynamic data,
    required ResponseConverter<T> converter,
    bool isIsolate = true,
  }) async {
    try {
      final response = await dio.put(url, data: data);
      if ((response.statusCode ?? 0) < 200 ||
          (response.statusCode ?? 0) > 201) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }

      if (!isIsolate) {
        return Right(converter(response.data));
      }
      final isolateParse = IsolateParser<T>(
        response.data as Map<String, dynamic>,
        converter,
      );
      final result = await isolateParse.parseInBackground();
      return Right(result);
    } on DioException catch (e) {
      return Left(
        ServerFailure(
          e.response?.data['message'] as String? ?? e.message,
        ),
      );
    }
  }
}
