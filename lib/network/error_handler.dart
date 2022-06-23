import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:ijob_app/network/exceptions/app_exception.dart';

import 'exceptions/api_exception.dart';
import 'exceptions/network_exception.dart';
import 'exceptions/not_found_exception.dart';
import 'exceptions/service_unavailable_exception.dart';
import 'exceptions/timeout_exception.dart';

Exception handleError(String error) {
  log('Generic exception: $error');

  return AppException(message: error);
}

Exception handleDioError(DioError dioError) {
  print(dioError.error);
  switch (dioError.type) {
    case DioErrorType.cancel:
      return AppException(message: 'Request to API was cancelled');
    case DioErrorType.connectTimeout:
      return AppException(message: 'Connection timeout with API');
    case DioErrorType.other:
      return NetworkException("There is no internet connection");
    case DioErrorType.receiveTimeout:
      return TimeoutException("Receive timeout in connection with API");
    case DioErrorType.sendTimeout:
      return TimeoutException("Send timeout in connection with API");
    case DioErrorType.response:
      return _parseDioErrorResponse(dioError);
  }
}

Exception _parseDioErrorResponse(DioError dioError) {
  int statusCode = dioError.response?.statusCode ?? -1;
  String? status;
  String? serverMessage;

  try {
    if (statusCode == -1 || statusCode == HttpStatus.ok) {
      statusCode = dioError.response?.data["code"];
    }
    status = dioError.response?.data["error"];
    serverMessage = dioError.response?.data["message"][0];
  } catch (e, s) {
    log("$e");
    log(s.toString());

    serverMessage = "Something went wrong. Please try again later.";
  }

  switch (statusCode) {
    case HttpStatus.serviceUnavailable:
      return ServiceUnavailableException("Service Temporarily Unavailable");
    case HttpStatus.notFound:
      return NotFoundException(serverMessage ?? '', status ?? '');
    default:
      return ApiException(
          httpCode: statusCode,
          status: status ?? '',
          message: serverMessage ?? '');
  }
}
