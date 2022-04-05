import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/show_value/bindings/show_value_binding.dart';
import '../modules/show_value/views/show_value_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SHOW_VALUE,
      page: () => ShowValueView(),
      binding: ShowValueBinding(),
    ),
  ];
}
