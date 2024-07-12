import 'package:blue_challenge/src/core/utils/content_type_enum.dart';
import 'package:dio/dio.dart';

abstract class IApiManager {
  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? additionalHeader,
    ContentTypeEnum? contentType = ContentTypeEnum.json,
    ResponseType? responseType = ResponseType.json,
  });

  Future<dynamic> post(
    String url,
    dynamic data, {
    Map<String, dynamic>? requestParams,
    Map<String, dynamic>? additionalHeader,
    ContentTypeEnum contentType = ContentTypeEnum.json,
  });

  Future<dynamic> put(
    String url,
    dynamic body, {
    Map<String, dynamic>? requestParams,
    ContentTypeEnum contentType = ContentTypeEnum.json,
    Map<String, dynamic>? additionalHeader,
  });

  Future<dynamic> patch(String url, Map<String, dynamic> body);

  Future<dynamic> delete(
    String url,
    Map<String, dynamic> requestParams, {
    dynamic body,
    ContentTypeEnum contentType = ContentTypeEnum.json,
  });
}
