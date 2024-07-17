import 'package:blue_challenge/generated/l10n.dart';
import 'package:blue_challenge/src/core/failures/failures.dart';
import 'package:dio/dio.dart';

mixin HandleApiError {
  Failure handleError(dynamic error) {
    final strings = S();

    if (error is! DioException) {
      return UnexpectedFailure(message: strings.anUnexpectedErrorOcurrend);
    }

    if (error.response != null) {
      return ServerFailure(
        message: strings.internalServerError,
      );
    } else if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.sendTimeout) {
      return UnexpectedFailure(message: strings.anUnexpectedErrorOcurrend);
    } else if (error.type == DioExceptionType.cancel) {
      return ServerFailure(message: strings.canceledRequest);
    } else {
      return ConnectionFailure(message: strings.noInternetConnection);
    }
  }
}
