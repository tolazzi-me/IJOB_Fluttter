import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:ijob_app/core/base/base_controller.dart';
import 'package:ijob_app/data/local/get_storage.dart';
import 'package:ijob_app/data/repositories/user_repository.dart';
import 'package:ijob_app/network/exceptions/api_exception.dart';

import '../../../routes/app_pages.dart';

class SplashController extends BaseController {
  final UserRepository _userRepository = Get.find(tag: (UserRepository).toString());

  Future<void> getPersonalInfo() async {
    final userOrError = await _userRepository.me();
    userOrError.fold((error) {
      if (error is ApiException) {
        if (error.httpCode == 401) {
          Get.offAllNamed(Routes.login);
        }
      } else {
        Get.snackbar('Erro', 'Não foi possível conectar ao serviço');
      }
    }, (user) async {
      final _localStorage = LocalStorageImp();
      print(user.toJson());
      _localStorage.write('user', user.toJson());
      Get.offAllNamed(user.userActiveType == 0 ? Routes.homeEmployee : Routes.homeEmployer);
      final position = await _determinePosition();
      final locationOrError = await _userRepository.storeLocation(position.latitude, position.longitude);
      locationOrError.fold((l) => print(l.toString()), (r) => null);
    });
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  @override
  void onInit() async {
    await getPersonalInfo();

    super.onInit();
  }
}
