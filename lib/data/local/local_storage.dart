import 'package:ijob_app/core/model/user_model.dart';

abstract class LocalStorage {
  String get accessToken;
  User get user;
  void write(String key, dynamic value);
  void writeToken(String token);
}
