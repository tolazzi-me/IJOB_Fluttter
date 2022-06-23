import 'package:get_storage/get_storage.dart';
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
}
