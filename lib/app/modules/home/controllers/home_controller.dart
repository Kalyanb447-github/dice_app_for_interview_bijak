import 'dart:math';

import 'package:dice_app_for_interview_bijak/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../constants.dart';
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
      saveDataToLocalForFutureUse(
          allDiceValues: allDiceValues.value,
          currentChance: currentChance.value);
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
    getcurrentUserUserData();
    setDataToLocalForFutureUse();
    // currentChance.value = box.read('currentChance') ?? 0;
    // List<int> temp =
    //     box.read('allDiceValues') ?? List<int>.filled(10, 0, growable: true);
    // allDiceValues.value = temp;

    // if cuccent value is equal to max chances
    //move to another page
    ever(currentChance, (v) {
      if (v == maxChances.value) {
        ShowValueController.to.allDiceValues = allDiceValues;

        saveDataToLocalForFutureUse(
            allDiceValues: List<int>.filled(10, 0, growable: true),
            currentChance: 0);
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

  setDataToLocalForFutureUse() {
    var tempCurrentChance = box.read(KcurrentChance);
    var tempallDiceValues = box.read(KallDiceValues);
    currentChance.value = tempCurrentChance;
    allDiceValues.value = tempallDiceValues.cast<int>();

    print(tempCurrentChance);
    print(tempallDiceValues);
  }

  saveDataToLocalForFutureUse(
      {required currentChance, required allDiceValues}) {
    box.write(KcurrentChance, currentChance);
    box.write(KallDiceValues, allDiceValues);
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;
  //SIGN IN METHOD
  Future signOut() async {
    await _auth.signOut();
    box.write(KuserLoggedIn, false);
    Get.offAllNamed(Routes.LOGIN);
    print('signout');
  }

  RxString displayName = ''.obs;
  getcurrentUserUserData() async {
    User? user = await FirebaseAuth.instance.currentUser;

    if (user != null) {
      print(user.displayName);
      displayName.value = user.email?.replaceAll('@gmail.com', '') ?? '';
      // signed in
    } else {}
  }
}
