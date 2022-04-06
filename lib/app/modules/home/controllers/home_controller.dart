import 'dart:math';

import 'package:dice_app_for_interview_bijak/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../show_value/controllers/show_value_controller.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  final RxInt maxChances = 10.obs;
  final RxInt currentChance = 0.obs;
  RxInt diceNumber = 1.obs;
  RxList<int> allData = List<int>.filled(10, 0, growable: true).obs;
  // change dice
  void changeDiceFace() {
    currentChance.value += 1;
    diceNumber.value = Random().nextInt(6) + 1;

    if (currentChance.value <= maxChances.value) {
      addValue(currentChance.value - 1, diceNumber.value);
    } else {
      Get.snackbar('Sorry!', "sorry your chances is over");
    }
  }

// store value to the array
  addValue(int index, int value) {
    allData[index] = value;
  }

//clear all data
  clearAllData() {
    maxChances.value = 9;
    currentChance.value = 0;
    diceNumber = 1.obs;
    allData = List<int>.filled(10, 0, growable: true).obs;
  }

  @override
  void onInit() {
    super.onInit();

    // if cuccent value is equal to max chances
    //move to another page
    ever(currentChance, (v) {
      if (v == maxChances.value) {
        ShowValueController.to.allData = allData;

        Get.toNamed(Routes.SHOW_VALUE);
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
