import 'package:get_storage/get_storage.dart';
import 'local_storage.dart';

class GetLocalStorage implements LocalStorage {
  final _box = GetStorage();

  @override
  String get accessToken {
    return _box.read('accessToken') ?? '';
  }
}
