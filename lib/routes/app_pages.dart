import 'package:get/get.dart';
import 'package:ijob_app/modules/home/views/home_employee_view.dart';
import 'package:ijob_app/modules/login/bindings/login_binding.dart';
import 'package:ijob_app/modules/login/views/login_view.dart';
import 'package:ijob_app/modules/premium/bindings/premium_binding.dart';
import 'package:ijob_app/modules/splash/views/splash_view.dart';
import 'package:ijob_app/modules/subscription/bindings/subscription_binding.dart';
import 'package:ijob_app/modules/subscription/views/subscription_view.dart';

import '../modules/home/views/home_employer_view.dart';
import '../modules/premium/views/premium_view.dart';
import '../modules/splash/bindings/splash_binding.dart';

part './app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.main;

  static final routes = [
    GetPage(
      name: _Paths.main,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.homeEmployee,
      page: () => const HomeEmployeeView(),
    ),
    GetPage(
      name: _Paths.homeEmployer,
      page: () => const HomeEmployerView(),
    ),
    GetPage(
      name: _Paths.premium,
      page: () => PremiumView(),
      binding: PremiumBinding(),
    ),
    GetPage(
      name: _Paths.subscription,
      page: () => SubscriptionView(),
      binding: SubscriptionBinding(),
    ),
  ];
}
