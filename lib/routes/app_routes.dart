part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const main = _Paths.main;
  static const login = _Paths.login;
  static const homeEmployee = _Paths.homeEmployee;
  static const homeEmployer = _Paths.homeEmployer;
  static const premium = _Paths.premium;
  static const subscription = _Paths.subscription;
  static const registerPageOne = _Paths.registerPageOne;
  static const registerPageTwo = _Paths.registerPageTwo;
  static const registerPageThree = _Paths.registerPageThree;
  static const profile = _Paths.profile;
  static const chat = _Paths.chat;
  static const settings = _Paths.settings;
}

abstract class _Paths {
  static const main = '/main';
  static const login = '/login';
  static const homeEmployee = '/homeEmployee';
  static const homeEmployer = '/homeEmployer';
  static const premium = '/premium';
  static const subscription = '/subscription';
  static const registerPageOne = '/registerPageOne';
  static const registerPageTwo = '/registerPageTwo';
  static const registerPageThree = '/registerPageThree';
  static const profile = '/profile';
  static const chat = '/chat';
  static const settings = '/settings';
}
