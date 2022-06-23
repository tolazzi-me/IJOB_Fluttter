import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:ijob_app/network/request_header.dart';
import 'package:ijob_app/utils/constants.dart';

class DioProvider {
  static Dio? _instance;

  static final BaseOptions _options = BaseOptions(
    baseUrl: Utils.baseUrl,
    connectTimeout: 60 * 1000,
    receiveTimeout: 60 * 1000,
  );

  static Dio get httpDio {
    _instance ??= Dio(_options);
    _instance!.interceptors.clear();
    // add interceptors
    (_instance!.httpClientAdapter as DefaultHttpClientAdapter)
        .onHttpClientCreate = (dioClient) {
      dioClient.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      return null;
    };
    return _instance!;
  }

  static Dio get dioWithHeaderToken {
    _addInterceptors();
    return _instance!;
  }

  static void _addInterceptors() {
    _instance ??= httpDio;
    _instance!.interceptors.clear();
    _instance!.interceptors.add(RequestHeaderInterceptor());
  }
}
