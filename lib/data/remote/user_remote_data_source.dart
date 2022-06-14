import 'package:ijob_app/core/base/base_remote_source.dart';
import '../../utils/constants.dart';

abstract class UserRemoteDataSource {
  Future<String> login(String email, String password);
}

class UserRemoteDataSourceImp extends BaseRemoteSource implements UserRemoteDataSource {
  @override
  Future<String> login(String email, String password) {
    const endPoint = '${Utils.baseUrl}/user/authenticate';
    final dioCall = dioClient.post(endPoint, data: {'email': email, 'password': password});

    try {
      return callApiWithErrorParser(dioCall).then((response) {
        return response.data['token'];
      });
    } catch (_) {
      rethrow;
    }
  }
}
