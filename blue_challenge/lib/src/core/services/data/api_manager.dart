import 'package:blue_challenge/src/core/failures/failures.dart';
import 'package:blue_challenge/src/core/utils/content_type_enum.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../interator/i_api_manager.dart';

class ApiManager implements IApiManager {
  CancelToken cancelToken = CancelToken();
  late final Dio _dio;

  ApiManager() {
    _dio = Dio(
      BaseOptions(
        baseUrl: const String.fromEnvironment('baseUrl'),
        headers: {
          'ngrok-skip-browser-warning': 'true',
        },
      ),
    );
    if (kDebugMode) {
      _dio.interceptors.add(
        PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            responseHeader: false,
            error: true,
            compact: true,
            maxWidth: 90),
      );
    }
    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.receiveTimeout = const Duration(seconds: 70);
  }

  @override
  Future delete(
    String url,
    Map<String, dynamic> requestParams, {
    body,
    ContentTypeEnum contentType = ContentTypeEnum.json,
  }) async {
    try {
      final response = await _dio.delete(
        url,
        queryParameters: requestParams,
        data: body,
        cancelToken: cancelToken,
        options: Options(
          contentType: ContentTypeEnum.json.text,
        ),
      );

      return response.data;
    } catch (error) {
      throw const ServerFailure(message: 'Unexpected error');
    }
  }

  @override
  Future get(
    String url, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? additionalHeader,
    ContentTypeEnum? contentType = ContentTypeEnum.json,
    ResponseType? responseType = ResponseType.json,
  }) async {
    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParams,
        cancelToken: cancelToken,
        options: Options(
          headers: additionalHeader,
          responseType: responseType,
        ),
      );

      return response.data;
    } catch (error) {
      throw const ServerFailure(message: 'Unexpected error');
    }
  }

  @override
  Future patch(
    String url,
    Map<String, dynamic> body,
  ) async {
    try {
      final response = await _dio.patch(
        url,
        data: body,
        cancelToken: cancelToken,
        options: Options(
          contentType: ContentTypeEnum.json.text,
        ),
      );

      return response.data;
    } catch (error) {
      throw const ServerFailure(message: 'Unexpected error');
    }
  }

  @override
  Future post(
    String url,
    data, {
    Map<String, dynamic>? requestParams,
    Map<String, dynamic>? additionalHeader,
    ContentTypeEnum contentType = ContentTypeEnum.json,
  }) async {
    try {
      final response = await _dio.post(
        url,
        data: data,
        options: Options(
          contentType: contentType.text,
          headers: additionalHeader,
        ),
        queryParameters: requestParams,
      );

      return response.data;
    } catch (error) {
      throw const ServerFailure(message: 'Unexpected error');
    }
  }

  @override
  Future put(
    String url,
    body, {
    Map<String, dynamic>? requestParams,
    ContentTypeEnum contentType = ContentTypeEnum.json,
    Map<String, dynamic>? additionalHeader,
  }) async {
    try {
      final response = await _dio.put(
        url,
        data: body,
        cancelToken: cancelToken,
        options: Options(
          contentType: contentType.text,
          headers: additionalHeader,
        ),
        queryParameters: requestParams,
      );

      return response.data;
    } catch (error) {
      throw const ServerFailure(message: 'Unexpected error');
    }
  }
}
