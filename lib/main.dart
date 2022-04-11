import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

const kDevMode = "DevMode";

void main() async {
  // change if you want to change the mode to dev to production
  FlavorConfig(
    variables: {
      kDevMode: true,
    },
  );
  await GetStorage.init();
  await Firebase.initializeApp();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,

      // home: AuthExampleApp(),
    ),
  );
}
