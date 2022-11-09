import 'package:get/get.dart';
import 'package:ijob_app/modules/Empregado/homeEmpregado.dart';
import 'package:ijob_app/modules/Empregador/homeEmpregador.dart';
import 'package:ijob_app/modules/login/bindings/login_binding.dart';
import 'package:ijob_app/modules/login/views/login_view.dart';
import 'package:ijob_app/modules/premium/bindings/premium_binding.dart';
import 'package:ijob_app/modules/register/bindings/register_binding.dart';
import 'package:ijob_app/modules/register/views/register_page_one.dart';
import 'package:ijob_app/modules/register/views/register_page_three.dart';
import 'package:ijob_app/modules/register/views/register_page_two.dart';
import 'package:ijob_app/modules/splash/views/splash_view.dart';
import 'package:ijob_app/modules/subscription/bindings/subscription_binding.dart';
import 'package:ijob_app/modules/subscription/views/subscription_view.dart';

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
      page: () => homeEmpregado(),
    ),
    GetPage(
      name: _Paths.homeEmployer,
      page: () => homeEmpregador(),
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
    GetPage(
      name: _Paths.registerPageOne,
      page: () => const RegisterPageMain(),
      binding: RegisterBindings(),
    ),
    GetPage(
      name: _Paths.registerPageTwo,
      page: () => RegisterPageTwo(),
      binding: RegisterBindings(),
    ),
    GetPage(
      name: _Paths.registerPageThree,
      page: () => RegisterPageThree(),
      binding: RegisterBindings(),
    ),
  ];
}
