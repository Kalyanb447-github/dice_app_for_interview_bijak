import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';

import '../../../constants.dart';

class SignUpController extends GetxController {
  RxString email = ''.obs;
  RxString password = ''.obs;
  RxString name = ''.obs;

  RxBool obscureText = false.obs;

  RxBool agree = false.obs;

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

  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;

  //SIGN IN METHOD
  Future signUp({required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  final box = GetStorage();
  setDataForLocal() {
    box.write(KuserLoggedIn, true);
  }
}
