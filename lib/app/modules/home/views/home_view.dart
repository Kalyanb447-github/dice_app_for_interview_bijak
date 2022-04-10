import 'package:dice_app_for_interview_bijak/app/modules/home/views/components/NavDrawer.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    Future<bool> onWillPop() {
      controller.saveDataToLocalForFutureUse();
      return Future.value(true);
    }

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Obx(
            () => Text('Hay, ${controller.displayName}'),
          ),
          backgroundColor: Colors.red,
        ),
        drawer: NavDrawer(),
        body: GetX<HomeController>(
          init: HomeController(),
          builder: (_) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Text(controller.allData.toString()),
                  Text('Chance ${controller.currentChance.value + 1}'),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            controller.changeDiceFace();
                          },
                          child: Image.asset(
                              'images/dice${controller.diceNumber}.png'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
