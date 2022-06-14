import 'package:get/get.dart';
import 'package:ijob_app/data/remote/user_remote_data_source.dart';

abstract class UserRepository {
  Future<String> login(String email, String password);
}

class UserRepositoryImp implements UserRepository {
  final UserRemoteDataSource _remoteDataSource = Get.find(tag: (UserRemoteDataSource).toString());

  @override
  Future<String> login(String email, String password) {
    return _remoteDataSource.login(email, password);
  }
}
