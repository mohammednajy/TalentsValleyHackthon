import 'package:dio/dio.dart';

import 'endpoint.dart';

class BaseClient {
  BaseClient._();

  static final BaseClient _instanse = BaseClient._();

  factory BaseClient() {
    return _instanse;
  }

  final _dio = Dio(BaseOptions(
      connectTimeout: EndPoints.connectTimeout,
      baseUrl: EndPoints.baseUrl,
      receiveDataWhenStatusError: true,
      receiveTimeout: EndPoints.receiveTimeout,
      //TODO: pass token here
      validateStatus: (value) {
        if (value != null && value < 503) {
          return true;
        }
        return false;
      }));

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
  }) async {
    return await _dio.get(
      path,
      cancelToken: cancelToken,
      queryParameters: queryParameters,
      onReceiveProgress: onReceiveProgress,
      options: options,
    );
  }

  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    try {
      return await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.delete(path,
          data: data, queryParameters: queryParameters, options: options);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await _dio.put(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }
}
