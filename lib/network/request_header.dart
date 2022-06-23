import 'package:dio/dio.dart';
import 'package:ijob_app/data/local/get_storage.dart';

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
    final _accessToken = LocalStorageImp().accessToken;
    final customHeader = {'content-type': 'application/json', 'x-access-token': _accessToken};

    return customHeader;
  }
}
