import 'package:dio/dio.dart';

class RequestHeaderInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    getCustomHeaders().then((customHeaders) {
      options.headers.addAll(customHeaders);
      super.onRequest(options, handler);
    });
  }

  Future<Map<String, dynamic>> getCustomHeaders() async {
    //include all custom headers, e.g: token for login in app
    final customHeader = {'content-type': 'application/json'};

    return customHeader;
  }
}
