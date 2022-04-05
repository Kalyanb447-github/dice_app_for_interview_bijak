import 'dart:math';

import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxInt maxChances = 9.obs;
  final RxInt minChances = 0.obs;
  final RxInt currentChance = 0.obs;
  RxInt diceNumber = 1.obs;
  RxList<dynamic> allData = List<dynamic>.filled(10, '', growable: true).obs;

  void changeDiceFace() {
    if (currentChance.value <= maxChances.value) {
      diceNumber.value = Random().nextInt(6) + 1;
      addValue(currentChance.value, diceNumber.value);
    } else if (currentChance.value == maxChances.value) {
      Get.to
    }
    
    
    else {
      Get.snackbar('Sorry!', "sorry your chances is over");
    }

  }

  addValue(int index, int value) {
    allData[index] = value.toString();
    currentChance.value += 1;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
