abstract class LocalStorage {
  String get accessToken;
  void write(String key, dynamic value);
  void writeToken(String token);
}
