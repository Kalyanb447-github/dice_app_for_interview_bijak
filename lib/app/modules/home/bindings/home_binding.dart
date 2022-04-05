import 'package:get/get.dart';

import '../../show_value/controllers/show_value_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<HomeController>(
    //   () => HomeController(),
    // );
    Get.put(HomeController(), permanent: true);

    Get.put(ShowValueController(), permanent: true);
  }
}
