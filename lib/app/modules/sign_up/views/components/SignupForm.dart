import 'package:dice_app_for_interview_bijak/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/sign_up_controller.dart';

class SignupForm extends GetView<SignUpController> {
  final _formKey = GlobalKey<FormState>();

  final pass = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.all(
        const Radius.circular(100.0),
      ),
    );

    var space = SizedBox(height: 10);
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          // email
          TextFormField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                labelText: 'Email',
                border: border),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            onSaved: (val) {
              controller.email.value = val!;
            },
            keyboardType: TextInputType.emailAddress,
          ),

          space,

          // password
          Obx(() => TextFormField(
                controller: pass,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock_outline),
                  border: border,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      controller.obscureText.value =
                          !controller.obscureText.value;
                    },
                    child: Icon(
                      controller.obscureText.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                ),
                onSaved: (val) {
                  controller.password.value = val!;
                },
                obscureText: controller.obscureText.value,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              )),
          space,
          // confirm passwords
          Obx(() => TextFormField(
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  prefixIcon: Icon(Icons.lock_outline),
                  border: border,
                ),
                obscureText: controller.obscureText.value,
                validator: (value) {
                  if (value != pass.text) {
                    return 'password not match';
                  }
                  return null;
                },
              )),
          space,
          // name
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Full name',
              prefixIcon: Icon(Icons.account_circle),
              border: border,
            ),
            onSaved: (val) {
              controller.name.value = val!;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some name';
              }
              return null;
            },
          ),

          Obx(
            () => Row(
              children: <Widget>[
                Checkbox(
                  onChanged: (_) {
                    controller.agree.value = !controller.agree.value;
                  },
                  value: controller.agree.value,
                ),
                Flexible(
                  child: Text(
                      'By creating account, I agree to Terms & Conditions and Privacy Policy.'),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),

          // signUP button
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();

                  controller
                      .signUp(
                          email: controller.email.value,
                          password: controller.password.value)
                      .then((result) {
                    if (result == null) {
                      controller.setDataForLocal();
                      Get.toNamed(Routes.HOME);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          result,
                          style: TextStyle(fontSize: 16),
                        ),
                      ));
                    }
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24.0)))),
              child: Text('Sign Up'),
            ),
          ),
        ],
      ),
    );
  }
}
