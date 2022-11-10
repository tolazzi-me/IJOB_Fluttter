import 'package:get_storage/get_storage.dart';
import 'package:ijob_app/core/model/user_model.dart';
import 'local_storage.dart';

class LocalStorageImp implements LocalStorage {
  final _box = GetStorage();

  @override
  String get accessToken {
    return _box.read('accessToken') ?? '';
  }

  @override
  void write(String key, value) {
    _box.write(key, value);
  }

  @override
  void writeToken(String token) {
    _box.write('accessToken', token);
  }

  @override
  User get user {
    final _user = _box.read('user');
    return User.fromJson(_user);
  }
}
