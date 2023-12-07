import 'package:get/get.dart';
import '../modules/home/views/login_view.dart';
import '../modules/home/views/signup_view.dart';
import '../modules/home/views/widgets/bottomnavigationbar.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const Bottom(),
    ),GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
    ),GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
    ),
  ];
}
