import 'package:get/get.dart';
import 'package:ijob_app/routes/app_pages.dart';

mixin SessionManager {
  final _isSessionIsExpired = false.obs;
  bool get isSessionIsExpired => _isSessionIsExpired.value;
  // set isSessionIsExpired(bool value) => _isSessionIsExpired.value = value;

  void signout() {
    _isSessionIsExpired.value = true;
    Get.offAllNamed(Routes.login);
  }

  void refreshToken() {}
}
