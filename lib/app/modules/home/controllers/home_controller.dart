import 'dart:math';

import 'package:dice_app_for_interview_bijak/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../show_value/controllers/show_value_controller.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  final box = GetStorage();

  final RxInt maxChances = 10.obs;
  final RxInt currentChance = 0.obs;
  RxInt diceNumber = 1.obs;
  RxList<int> allDiceValues = List<int>.filled(10, 0, growable: true).obs;

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
    allDiceValues[index] = value;
  }

//clear all data
  clearAllData() {
    maxChances.value = 9;
    currentChance.value = 0;
    diceNumber = 1.obs;
    allDiceValues = List<int>.filled(10, 0, growable: true).obs;
  }

  @override
  void onInit() {
    super.onInit();

    // currentChance.value = box.read('currentChance') ?? 0;
    // List<int> temp =
    //     box.read('allDiceValues') ?? List<int>.filled(10, 0, growable: true);
    // allDiceValues.value = temp;

    // if cuccent value is equal to max chances
    //move to another page
    ever(currentChance, (v) {
      if (v == maxChances.value) {
        ShowValueController.to.allDiceValues = allDiceValues;

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

  saveDataToLocalForFutureUse() {
    // box.write('currentChance', currentChance.value);
    // box.write('allDiceValues', allDiceValues.value);
  }
}
