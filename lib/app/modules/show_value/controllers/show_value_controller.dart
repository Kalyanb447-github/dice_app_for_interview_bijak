import 'package:get/get.dart';

class ShowValueController extends GetxController {
  static ShowValueController get to => Get.find();
  RxList<dynamic> allData = List<dynamic>.filled(10, 0, growable: true).obs;

  RxInt total = 0.obs;

  RxBool loading = false.obs;

  int findTotal() {
    total.value = 0;
    allData.forEach((element) {
      total += int.tryParse(element) ?? 0;
    });

    return total.value;
  }
}
