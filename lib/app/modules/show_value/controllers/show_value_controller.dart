import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ShowValueController extends GetxController {
  static ShowValueController get to => Get.find();
  RxList<int> allDiceValues = List<int>.filled(10, 0, growable: true).obs;

  RxInt total = 0.obs;

  RxBool loading = false.obs;

  findTotal() {
    total.value = 0;
    allDiceValues.forEach((element) {
      total += element;
    });
  }

  final box = GetStorage();
  // int get heightScoreStorage =>
  RxInt heightScore = 0.obs;
  void saveHeightScoreForFutureUse() {
    if (total.value >= heightScore.value) {
      heightScore.value = total.value;
      box.write('height_score', total.value);
      Future.delayed(Duration(seconds: 1), () {
        Get.snackbar('Congratulaton', 'You have a new height score',
            backgroundColor: Colors.green);
      });
    } else {
      heightScore.value = box.read('height_score') ?? 0;
    }
  }
}
