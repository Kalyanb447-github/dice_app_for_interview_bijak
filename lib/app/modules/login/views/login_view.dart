import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';
import 'components/LoginForm.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: <Widget>[
          SizedBox(height: 80),
          // logo
          Column(
            children: [
              FlutterLogo(
                size: 55,
              ),
              SizedBox(height: 50),
              Text(
                'Welcome back!',
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),

          SizedBox(
            height: 50,
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: LoginForm(),
          ),

          SizedBox(height: 20),

          Row(
            children: <Widget>[
              SizedBox(width: 30),
              Text('New here ? ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(context, '/signup');
                  Get.toNamed(Routes.SIGN_UP);
                },
                child: Text('Get Registered Now!!',
                    style: TextStyle(fontSize: 20, color: Colors.blue)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
