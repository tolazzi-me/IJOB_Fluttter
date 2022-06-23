part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const main = _Paths.main;
  static const login = _Paths.login;
  static const homeEmployee = _Paths.homeEmployee;
  static const homeEmployer = _Paths.homeEmployer;
  static const premium = _Paths.premium;
  static const subscription = _Paths.subscription;
}

abstract class _Paths {
  static const main = '/main';
  static const login = '/login';
  static const homeEmployee = '/homeEmployee';
  static const homeEmployer = '/homeEmployer';
  static const premium = '/premium';
  static const subscription = '/subscription';
}
