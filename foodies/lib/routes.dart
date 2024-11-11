import 'package:foodies/navbar.dart';
import 'package:foodies/pages/dashboard_screen.dart';
import 'package:foodies/pages/login_screen.dart';
import 'package:get/get.dart';

class RoutesClass {
  static String initalroute = '/';

  static String getInitialRoute() => initalroute;

  static List<GetPage> routes = [
    GetPage(name: initalroute, page: (() => const LoginScreen())),
    GetPage(name: '/Dashboard', page: (() => const DashboardScreen()))
  ];
}
