import 'package:dice_app_for_interview_bijak/app/constants.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  static SplashController get to => Get.find();
  final box = GetStorage();

  bool userLoggedIn = false;

  @override
  void onInit() {
    super.onInit();

    userLoggedIn = box.read(KuserLoggedIn) ?? false;

    Future.delayed(Duration(seconds: 1), () {
      if (userLoggedIn == true) {
        Get.toNamed(Routes.HOME);
      } else {
        Get.toNamed(Routes.LOGIN);
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
